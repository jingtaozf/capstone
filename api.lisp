;;; -*- encoding:utf-8 Mode: LISP; Syntax: COMMON-LISP; Base: 10  -*- ---
;; 
;; Filename: api.lisp
;; Description: 
;; Author: Jingtao Xu <jingtaozf@gmail.com>
;; Created: 2015.12.06 14:45:47(+0800)
;; Last-Updated: 2015.12.13 12:44:09(+0800)
;;     Update #: 87
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Commentary: 
;; 
;; 
(in-package :capstone)

;;;; utils
(defun c-raw-string-to-binary-array (c-raw-string)
  "convert c string like \x70\x47\xeb\x46\ to lisp binary array"
    (loop with len = (/ (length c-raw-string) 3)
          with arr = (make-array len :element-type '(unsigned-byte 8))
          for i from 0 to (1- len)
          ;; just a simple one,without type check
          for byte-str = (format nil "~c~c" 
                                 (aref c-raw-string (+ (* i 3) 1))
                                 (aref c-raw-string (+ (* i 3) 2)))
          for byte = (parse-integer byte-str :radix 16)
          do (setf (aref arr i) byte)
          finally (return arr)))
(defun byte-array-to-lisp (ptr size)
  (loop with arr = (make-array size)
        for i from 0 below size
        do (setf (aref arr i)
                   (mem-ref ptr 'uint8-t i))
        finally (return arr)))

;;;; api
(defmacro cs-funcall (func-name &rest args)
  (with-unique-names (cs-err)
    `(let ((,cs-err (funcall ',func-name ,@args)))
       (unless (eq :ok ,cs-err)
         (error "capstone function ~a returned error:~a" ',func-name ,cs-err)))))

(defun cs-option (handle opt-type opt-value)
  (cs-funcall .cs-option handle
              (foreign-enum-value 'cs-opt-type opt-type)
              (foreign-enum-value 'cs-opt-value opt-value)))

(defun cs-open (&key (arch :arm) (mode :arm) (detail t))
  (with-foreign-object (csh 'csh)
    (cs-funcall .cs-open (foreign-enum-value 'cs-arch arch)
                (foreign-enum-value 'cs-mode mode)
                csh)
    (when detail
      (cs-option (mem-ref csh 'csh) :detail :on))
    (mem-ref csh 'csh)))

(defun cs-close (handle)
  (with-foreign-object (csh 'csh)
    (setf (mem-ref csh 'csh) handle)
    (cs-funcall .cs-close csh)))

(defun cs-reg-name (handle reg-index)
  (.cs-reg-name handle reg-index))

(defvar *capstone-arch* nil)
(defvar *capstone-mode* nil)
(defmacro with-capstone-handle ((handle &key (arch :arm) (mode :arm) (detail t))
                                &body body)
  `(let ((,handle (cs-open :arch ,arch :mode ,mode :detail ,detail))
         (*capstone-arch* ,arch)
         (*capstone-mode* ,mode))
     (unwind-protect
         (progn ,@body)
       (cs-close ,handle))))

(defstruct arm-op-mem
  base index scale disp)
(defstruct arm-op
  vector-index shift.type shift.value
  type reg imm fp mem setend subtracted)

(defstruct insn-arm
  usermode vector-size vector-data cps-mode cps-flag cc update-flags writeback
  mem-barrier op-count operands)
(defstruct insn-detail
  regs-read regs-read-count regs-write regs-write-count groups groups-count
  arm)

(defstruct insn 
  id address size bytes mnemonic op-str detail)

(defun cs-arm-op-mem-to-lisp (arm-op)
  (macrolet ((%arm-op-mem (x)
               `(foreign-slot-value arm-op-mem '(:struct arm-op-mem) ',x)))
    (let ((arm-op-mem (foreign-slot-pointer arm-op '(:struct cs-arm-op) 'mem)))
      (make-arm-op-mem :base (%arm-op-mem base)
                       :index (%arm-op-mem index)
                       :scale (%arm-op-mem scale)
                       :disp (%arm-op-mem disp)))))

(defun cs-arm-op-to-lisp (arm-op)
  (macrolet ((%arm-op (x)
               `(foreign-slot-value arm-op '(:struct cs-arm-op) ',x)))
  (make-arm-op :vector-index (%arm-op vector-index)
               :shift.type (%arm-op shift.type)
               :shift.value (%arm-op shift.value)
               :type (%arm-op type)
               :reg (%arm-op reg)
               :imm (%arm-op imm)
               :fp (%arm-op fp)
               :mem (cs-arm-op-mem-to-lisp arm-op)
               :setend (%arm-op setend)
               :subtracted (%arm-op subtracted)
  )))
(defun cs-arm-to-lisp (detail)
  (macrolet ((%arm (x)
               `(foreign-slot-value arm '(:struct cs-arm) ',x)))
    (let ((arm (foreign-slot-pointer detail '(:struct cs-detail) 'arm)))
    (make-insn-arm :usermode (%arm usermode)
                   :vector-size (%arm vector-size)
                   :vector-data (%arm vector-data)
                   :cps-mode (%arm cps-mode)
                   :cps-flag (%arm cps-flag)
                   :cc (%arm cc)
                   :update-flags (%arm update-flags)
                   :writeback (%arm writeback)
                   :mem-barrier (%arm mem-barrier)
                   :op-count (%arm op-count)
                   :operands (loop with operands = (make-array (%arm op-count))
                                   with p = (foreign-slot-pointer arm
                                                    '(:struct cs-arm)
                                                    'operands)
                                   for i from 0 below (%arm op-count)
                                   do (setf (aref operands i)
                                              (cs-arm-op-to-lisp p))
                                      (incf-pointer p size-of-cs-arm-op)
                                   finally (return operands))
    ))))

(defun cs-detail-to-lisp (detail)
  (macrolet ((%detail (x)
               `(foreign-slot-value detail '(:struct cs-detail) ',x)))
    (make-insn-detail
     :regs-read (byte-array-to-lisp (%detail regs-read)
                                    (%detail regs-read-count))
     :regs-read-count (%detail regs-read-count)  
     :regs-write (byte-array-to-lisp (%detail regs-write)
                                     (%detail regs-write-count))
     :regs-write-count (%detail regs-write-count)  
     :groups (byte-array-to-lisp (%detail groups)
                                 (%detail groups-count))
     :groups-count (%detail groups-count)
     :arm (cs-arm-to-lisp detail)
     )))

(defun cs-insn-to-lisp (p)
  (macrolet ((%insn-slot (x)
             `(foreign-slot-value p '(:struct cs-insn) ',x)))
    (let* ((size (%insn-slot size))
           (bytes (%insn-slot bytes))
           (insn-detail (cs-detail-to-lisp (%insn-slot detail))))
      (make-insn :id (%insn-slot id)
                 :address (%insn-slot address)
                 :size size
                 :bytes (byte-array-to-lisp bytes size)
                 :mnemonic (foreign-string-to-lisp (%insn-slot mnemonic))
                 :op-str (foreign-string-to-lisp (%insn-slot op-str))
                 :detail insn-detail))))
(defun cs-disasm (handle base-address arm-code)
  (with-foreign-object (buffer 'uint8-t (length arm-code))
    (loop for i from 0
          for x across arm-code
          do (setf (mem-ref buffer 'uint8-t i) x))
    (with-foreign-object (pinsn '(:pointer (:struct cs-insn)))
      (let ((count (.cs-disasm handle buffer (1- (length arm-code)) base-address 0 pinsn))
            (p-insn (mem-ref pinsn :pointer)))
        (unwind-protect
          (loop for i from 1 to count
                for p = p-insn then (inc-pointer p size-of-cs-insn)
                collect (cs-insn-to-lisp p))
          (.cs-free p-insn count))))))

