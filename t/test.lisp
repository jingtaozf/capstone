;;; -*- encoding:utf-8 Mode: LISP; Syntax: COMMON-LISP; Base: 10  -*- ---
;; 
;; Filename: test.lisp
;; Description: 
;; Author: Jingtao Xu <jingtaozf@gmail.com>
;; Created: 2015.12.09 11:20:17(+0800)
;; Last-Updated: 2015.12.10 22:00:15(+0800)
;;     Update #: 16
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


(5am:test arm-disasmble
  (5am:is (equalp 
           (list #S(INSN :ID 13
                         :ADDRESS 4096
                         :SIZE 4
                         :BYTES #(237 255 255 235)
                         :MNEMONIC "bl"
                         :OP-STR "#0xfbc"
                         :DETAIL #S(INSN-DETAIL :REGS-READ #(11)
                                                :REGS-READ-COUNT 1
                                                :REGS-WRITE #(10)
                                                :REGS-WRITE-COUNT 1
                                                :GROUPS #(1 147)
                                                :GROUPS-COUNT 2
                                                :ARM NIL))
                 #S(INSN :ID 212
                         :ADDRESS 4100
                         :SIZE 4
                         :BYTES #(4 224 45 229)
                         :MNEMONIC "str"
                         :OP-STR "lr, [sp, #-4]!"
                         :DETAIL #S(INSN-DETAIL :REGS-READ #()
                                                :REGS-READ-COUNT 0
                                                :REGS-WRITE #()
                                                :REGS-WRITE-COUNT 0
                                                :GROUPS #(147)
                                                :GROUPS-COUNT 1
                                                :ARM NIL))
                 #S(INSN :ID 8
                         :ADDRESS 4104
                         :SIZE 4
                         :BYTES #(0 0 0 0)
                         :MNEMONIC "andeq"
                         :OP-STR "r0, r0, r0"
                         :DETAIL #S(INSN-DETAIL :REGS-READ #()
                                                :REGS-READ-COUNT 0
                                                :REGS-WRITE #()
                                                :REGS-WRITE-COUNT 0
                                                :GROUPS #(147)
                                                :GROUPS-COUNT 1
                                                :ARM NIL))
                 #S(INSN :ID 212
                         :ADDRESS 4108
                         :SIZE 4
                         :BYTES #(224 131 34 229)
                         :MNEMONIC "str"
                         :OP-STR "r8, [r2, #-0x3e0]!"
                         :DETAIL #S(INSN-DETAIL :REGS-READ #()
                                                :REGS-READ-COUNT 0
                                                :REGS-WRITE #()
                                                :REGS-WRITE-COUNT 0
                                                :GROUPS #(147)
                                                :GROUPS-COUNT 1
                                                :ARM NIL))
                 #S(INSN :ID 74
                         :ADDRESS 4112
                         :SIZE 4
                         :BYTES #(241 2 3 14)
                         :MNEMONIC "mcreq"
                         :OP-STR "p2, #0, r0, c3, c1, #7"
                         :DETAIL #S(INSN-DETAIL :REGS-READ #()
                                                :REGS-READ-COUNT 0
                                                :REGS-WRITE #()
                                                :REGS-WRITE-COUNT 0
                                                :GROUPS #(147)
                                                :GROUPS-COUNT 1
                                                :ARM NIL))
                 #S(INSN :ID 80
                         :ADDRESS 4116
                         :SIZE 4
                         :BYTES #(0 0 160 227)
                         :MNEMONIC "mov"
                         :OP-STR "r0, #0"
                         :DETAIL #S(INSN-DETAIL :REGS-READ #()
                                                :REGS-READ-COUNT 0
                                                :REGS-WRITE #()
                                                :REGS-WRITE-COUNT 0
                                                :GROUPS #(147)
                                                :GROUPS-COUNT 1
                                                :ARM NIL))
                 #S(INSN :ID 203
                         :ADDRESS 4120
                         :SIZE 4
                         :BYTES #(2 48 193 231)
                         :MNEMONIC "strb"
                         :OP-STR "r3, [r1, r2]"
                         :DETAIL #S(INSN-DETAIL :REGS-READ #()
                                                :REGS-READ-COUNT 0
                                                :REGS-WRITE #()
                                                :REGS-WRITE-COUNT 0
                                                :GROUPS #(147)
                                                :GROUPS-COUNT 1
                                                :ARM NIL))
                 #S(INSN :ID 23
                         :ADDRESS 4124
                         :SIZE 4
                         :BYTES #(0 0 83 227)
                         :MNEMONIC "cmp"
                         :OP-STR "r3, #0"
                         :DETAIL #S(INSN-DETAIL :REGS-READ #()
                                                :REGS-READ-COUNT 0
                                                :REGS-WRITE #(3)
                                                :REGS-WRITE-COUNT 1
                                                :GROUPS #(147)
                                                :GROUPS-COUNT 1
                                                :ARM NIL))
                 #S(INSN :ID 124
                         :ADDRESS 4128
                         :SIZE 4
                         :BYTES #(0 2 1 241)
                         :MNEMONIC "setend"
                         :OP-STR "be"
                         :DETAIL #S(INSN-DETAIL :REGS-READ #()
                                                :REGS-READ-COUNT 0
                                                :REGS-WRITE #()
                                                :REGS-WRITE-COUNT 0
                                                :GROUPS #(147)
                                                :GROUPS-COUNT 1
                                                :ARM NIL))
                 #S(INSN :ID 57
                         :ADDRESS 4132
                         :SIZE 4
                         :BYTES #(5 64 208 232)
                         :MNEMONIC "ldm"
                         :OP-STR "r0, {r0, r2, lr} ^"
                         :DETAIL #S(INSN-DETAIL :REGS-READ #()
                                                :REGS-READ-COUNT 0
                                                :REGS-WRITE #()
                                                :REGS-WRITE-COUNT 0
                                                :GROUPS #(147)
                                                :GROUPS-COUNT 1
                                                :ARM NIL))) 
           (with-capstone-handle (handle :arch :arm :mode :arm :detail t)
             (cs-disasm handle #x1000
                        (c-raw-string-to-binary-array
                         "\xED\xFF\xFF\xEB\x04\xe0\x2d\xe5\x00\x00\x00\x00\xe0\x83\x22\xe5\xf1\x02\x03\x0e\x00\x00\xa0\xe3\x02\x30\xc1\xe7\x00\x00\x53\xe3\x00\x02\x01\xf1\x05\x40\xd0\xe8\xf4\x80\x00\x00")
                        )))))

(defun run-tests ()
  (5am:run! 'utils-suite)
  (5am:run! 'disasm-suite)
  )
