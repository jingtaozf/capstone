;;; -*- encoding:utf-8 Mode: LISP; Syntax: COMMON-LISP; Base: 10  -*- ---
;; 
;; Filename: api.lisp
;; Description: 
;; Author: Jingtao Xu <jingtaozf@gmail.com>
;; Created: 2015.12.06 14:45:47(+0800)
;; Last-Updated: 2015.12.09 21:44:37(+0800)
;;     Update #: 33
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
(defun cs-open (&key (arch :arm) (mode :arm))
  (with-foreign-object (csh 'csh)
    (let ((cs-err (.cs-open (foreign-enum-value 'cs-arch arch)
                            (foreign-enum-value 'cs-mode mode)
                            csh)))
      (unless (eq :ok cs-err)
        (error "cs-open returned error:~a" cs-err))
      (mem-ref csh 'csh))))

(defun cs-close (handle)
  (with-foreign-object (csh 'csh)
    (setf (mem-ref csh 'csh) handle)
    (.cs-close csh)))

(defmacro with-capstone-handle ((handle &key (arch :arm) (mode :arm)) &body body)
  `(let ((,handle (cs-open :arch ,arch :mode ,mode)))
     (unwind-protect
         (progn ,@body)
       (cs-close ,handle))))

;;; TODO with-cs-handle

(defun cs-option-detail-on (handle)
  (let ((cs-err (.cs-option handle (foreign-enum-value 'cs-opt-type :detail)
                              (foreign-enum-value 'cs-opt-value :on))))
    (unless (eq :ok cs-err)
      (error "cs-option returned error:~a" cs-err))
    t))

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
(defun cs-insn-to-alist (p)
  (macrolet ((%insn-slot (x)
             `(foreign-slot-value p '(:struct cs-insn) ,x))
             (%detail (x)
               `(foreign-slot-value detail '(:struct cs-detail) ,x)))
    (let* ((size (%insn-slot 'size))
           (bytes (%insn-slot 'bytes))
           (detail (%insn-slot 'detail))
           (arm )
           (insn-detail (make-insn-detail
                         :regs-read (byte-array-to-lisp (%detail 'regs-read)
                                                        (%detail 'regs-read-count))
                         :regs-read-count (%detail 'regs-read-count)  
                         :regs-write (byte-array-to-lisp (%detail 'regs-write)
                                                        (%detail 'regs-write-count))
                         :regs-write-count (%detail 'regs-write-count)  
                         :groups (byte-array-to-lisp (%detail 'groups)
                                                        (%detail 'groups-count))
                         :groups-count (%detail 'groups-count)
                         :arm arm)))
      (make-insn :id (%insn-slot 'id)
                 :address (%insn-slot 'address)
                 :size size
                 :bytes (byte-array-to-lisp bytes size)
                 :mnemonic (foreign-string-to-lisp (%insn-slot 'mnemonic))
                 :op-str (foreign-string-to-lisp (%insn-slot 'op-str))
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
                collect (cs-insn-to-alist p))
          (.cs-free p-insn count))))))

