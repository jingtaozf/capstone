;;; -*- encoding:utf-8 Mode: LISP; Syntax: COMMON-LISP; Base: 10  -*- ---
;; 
;; Filename: test.lisp
;; Description: 
;; Author: Jingtao Xu <jingtaozf@gmail.com>
;; Created: 2015.12.09 11:20:17(+0800)
;; Last-Updated: 2015.12.12 20:26:25(+0800)
;;     Update #: 18
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Commentary: 
;; 
;; 
(in-package :capstone)

(5am:def-suite utils-suite :description "The test suite of capstone utils.")
(5am:in-suite utils-suite)

(5am:test c-raw-string-to-binary-array
  (5am:is (equalp (c-raw-string-to-binary-array "\x70\x47\xeb\x46")
                  #(#x70 #x47 #xeb #x46))))

(5am:def-suite disasm-suite :description "The test suite of capstone disassemble.")
(5am:in-suite disasm-suite)

(5am:rem-fixture 'arm-data1)
(5am:def-fixture arm-data1 ()
  `(progn 
     ,@(let ((arm-data (file-as-lisp 
                        (format nil "~at/arm-data1.lisp" (namestring (asdf:component-pathname (asdf:find-system "capstone")))))))
         (&body))))

(5am:test (arm-disasmble-data1 :fixture arm-data1)
  (5am:is (equalp 
           (cdr arm-data)
           (with-capstone-handle (handle :arch :arm :mode :arm :detail t)
             (cs-disasm handle #x1000
                        (c-raw-string-to-binary-array (car arm-data)))))))

(defun run-tests ()
  (5am:run! 'utils-suite)
  (5am:run! 'disasm-suite)
  )




