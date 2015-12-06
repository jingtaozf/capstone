;;; capstone-lisp.asd --- ASDF system definition for capstone-lisp

(cl:eval-when (:load-toplevel :execute)
  (asdf:load-system "cffi-grovel"))

(defpackage #:capstone-lisp-system (:use #:asdf #:cl #:cffi-grovel))
(in-package #:capstone-lisp-system)

(defsystem "capstone-lisp"
    :depends-on (#:cffi #:cl-fad)
    :name "capstone-lisp"
    :author "Jingtao xu <jingtaozf@gmail.com>"
    :license "MIT"
    :description "Lisp-capstone interface"
    :long-description "
This system provides support for embedding capstone into Common Lisp via CFFI.

To grovel against a specific copy of capstone's header files, you may need to edit
  (defparameter *capstone-include-dir* ...)
in #p\"capstone-include-dir.lisp\".
"
    :serial t
    :components
    ((:file "packages")
     (:file "grovel-include-dir")
     (grovel-file "grovel")
     (:file "ffi-interface")
     (:file "api"))
    :in-order-to ((test-op (test-op #:capstone-lisp-tests))))
