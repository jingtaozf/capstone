;;; capstone-tests.asdf --- system definition for the capstone
;;; test suite

(defsystem "capstone-lisp-tests"
  :name "capstone-tests"
  :description "capstone tests"
  :author "jingtaozf <jingtaozf@gmail.com>"
  :license "MIT"
  :serial t
  :components
  ((:module "test"
    :pathname "t/"
    :components
    ((:file "packages")
     (:file "test")
     )
    :serial t))
  :depends-on (#:capstone-lisp #:fiveam)
  :perform (test-op (o c)
                    #+asdf3
                    (funcall (intern "RUN-TESTS" :capstone-tests))))
