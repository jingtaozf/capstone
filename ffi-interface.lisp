(in-package #:capstone)
;;;; FFI Library
;; Much of what we do below requires it be loaded during macroexpansion time.
(eval-when (:compile-toplevel :load-toplevel :execute)
  (define-foreign-library capstone-library
    (:darwin "libcapstone.3.dylib")
    (:unix "libcapstone.so")
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

