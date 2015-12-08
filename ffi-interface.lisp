(in-package #:capstone.cffi)
;;;; FFI Library
;; Much of what we do below requires it be loaded during macroexpansion time.
(eval-when (:compile-toplevel :load-toplevel :execute)
  (define-foreign-library capstone-library
    (:darwin "libcapstone.3.dylib")
    (:unix "libcapstone.3.so")
    (:windows "libcapstone.3.dll")
    (t (:default "libcapstone")))
  (use-foreign-library capstone-library))

(defcfun ("cs_open" .cs-open) cs-err
  (arch cs-arch) (mode cs-mode) (handle (:pointer csh))
  )

(defcfun ("cs_close" .cs-close) cs-err
  (handle (:pointer csh)))

(defcfun ("cs_option" .cs-option) cs-err
  (ud csh) (type cs-opt-type) (value size-t)
  )

(defcfun ("cs_disasm" .cs-disasm) size-t
  (ud csh) (buffer (:pointer uint8-t)) (size size-t)
  (offset uint64-t) (count size-t) (insn (:pointer (:pointer (:struct cs-insn))))
  )
(defcfun ("cs_free" .cs-free) :void
  (insn (:pointer (:struct cs-insn)))
  (count size-t))

(defun cs-open (&optional (arch (foreign-enum-value 'cs-arch :arm))
                (mode (foreign-enum-value 'cs-mode :arm)))
  (with-foreign-object (csh 'csh)
    (let ((cs-err (.cs-open arch mode csh)))
      (unless (eq :ok cs-err)
        (error "cs-open returned error:~a" cs-err))
      (mem-ref csh 'csh))))

(defun cs-close (handle)
  (with-foreign-object (csh 'csh)
    (setf (mem-ref csh 'csh) handle)
    (.cs-close csh)))

;;; TODO with-cs-handle

(defun cs-option-detail-on (handle)
  (let ((cs-err (.cs-option handle (foreign-enum-value 'cs-opt-type :detail)
                              (foreign-enum-value 'cs-opt-value :on))))
    (unless (eq :ok cs-err)
      (error "cs-option returned error:~a" cs-err))
    t))

(defun cs-char-array-to-string (p size)
  (with-output-to-string (stream)
    (loop for i from 0 to (1- size)
          for code = (mem-ref p :char i)
          until (= code 0)
          do (write-char (code-char code) stream))))

(defun cs-disasm-test (handle &optional
                       (arm-code '(237 255 255 235 4 224 45 229 0 0 0 0 224 131 34
                                   229 241 2 3 14 0 0 160 227 2 48 193 231 0 0
                                   83 227 0 2 1 241 5 64 208 232 244 128 0 0)))
  (with-foreign-object (buffer 'uint8-t (length arm-code))
    (loop for i from 0
          for x in arm-code
          do (setf (mem-ref buffer 'uint8-t i) x))
    (with-foreign-object (pinsn '(:pointer (:struct cs-insn)))
      (let ((count (.cs-disasm handle buffer (1- (length arm-code)) #x1000 0 pinsn))
            (p-inst (mem-ref pinsn :pointer)))
        (unwind-protect
          (loop for i from 1 to count
                for p = p-inst then (inc-pointer p size-of-cs-insn)
                collect
                (list :address (foreign-slot-value p '(:struct cs-insn) 'address)
                      :mnemonic (cs-char-array-to-string (foreign-slot-value
                                                                 p
                                                                 '(:struct cs-insn)
                                                                 'mnemonic)
                                   32)
                      :op-str (cs-char-array-to-string (foreign-slot-value
                                                               p
                                                               '(:struct cs-insn)
                                                               'op-str)
                                 160)))
          (.cs-free p-inst count))))))
