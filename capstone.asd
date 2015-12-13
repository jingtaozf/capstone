;;; capstone.asd --- ASDF system definition for capstone

(cl:eval-when (:load-toplevel :execute)
  (asdf:load-system "cffi-grovel"))

(defpackage #:capstone-system (:use #:asdf #:cl #:cffi-grovel))
(in-package #:capstone-system)

(defsystem "capstone"
    :depends-on (#:cffi #:cl-fad :xjt-utils)
    :name "capstone"
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
     (:file "ffi-setup")
     (grovel-file "grovel")
     (:file "ffi-interface")
     (:file "api"))
    :in-order-to ((test-op (test-op #:capstone-tests))))
