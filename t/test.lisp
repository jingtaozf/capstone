;;; -*- encoding:utf-8 Mode: LISP; Syntax: COMMON-LISP; Base: 10  -*- ---
;; 
;; Filename: test.lisp
;; Description: 
;; Author: Jingtao Xu <jingtaozf@gmail.com>
;; Created: 2015.12.09 11:20:17(+0800)
;; Last-Updated: 2015.12.09 11:44:29(+0800)
;;     Update #: 7
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Commentary: 
;; 
;; 
(in-package :capstone-tests)

(5am:def-suite disasm-suite :description "The test suite of capstone disassemble.")
(5am:in-suite disasm-suite)

(5am:test arm-disasmble
  (5am:is (equal '((:ADDRESS 4096 :MNEMONIC "bl" :OP-STR "#0xfbc")
                   (:ADDRESS 4100 :MNEMONIC "str" :OP-STR "lr, [sp, #-4]!")
                   (:ADDRESS 4104 :MNEMONIC "andeq" :OP-STR "r0, r0, r0")
                   (:ADDRESS 4108 :MNEMONIC "str" :OP-STR "r8, [r2, #-0x3e0]!")
                   (:ADDRESS 4112 :MNEMONIC "mcreq" :OP-STR "p2, #0, r0, c3, c1, #7")
                   (:ADDRESS 4116 :MNEMONIC "mov" :OP-STR "r0, #0")
                   (:ADDRESS 4120 :MNEMONIC "strb" :OP-STR "r3, [r1, r2]")
                   (:ADDRESS 4124 :MNEMONIC "cmp" :OP-STR "r3, #0")
                   (:ADDRESS 4128 :MNEMONIC "setend" :OP-STR "be")
                   (:ADDRESS 4132 :MNEMONIC "ldm" :OP-STR "r0, {r0, r2, lr} ^"))
                 (let ((handle (cs-open (foreign-enum-value 'cs-arch :arm) (foreign-enum-value 'cs-mode :arm))))
                   (unwind-protect
                       (progn
                         (cs-option-detail-on handle)
                         (cs-disasm handle #x1000
                                    '(237 255 255 235 4 224 45 229 0 0 0 0 224 131 34
                                      229 241 2 3 14 0 0 160 227 2 48 193 231 0 0
                                      83 227 0 2 1 241 5 64 208 232 244 128 0 0)))
                     (cs-close handle))))))

(defun run-tests ()
  (5am:run! 'disasm-suite)
  )
