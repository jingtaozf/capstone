("xEDxFFxFFxEBx04xe0x2dxe5x00x00x00x00xe0x83x22xe5xf1x02x03x0ex00x00xa0xe3x02x30xc1xe7x00x00x53xe3x00x02x01xf1x05x40xd0xe8xf4x80x00x00"
 #S(INSN :ID 13
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
                                :ARM #S(INSN-ARM :USERMODE NIL
                                                 :VECTOR-SIZE 0
                                                 :VECTOR-DATA :INVALID
                                                 :CPS-MODE :INVALID0
                                                 :CPS-FLAG :INVALID
                                                 :CC :AL
                                                 :UPDATE-FLAGS NIL
                                                 :WRITEBACK NIL
                                                 :MEM-BARRIER :INVALID
                                                 :OP-COUNT 1
                                                 :OPERANDS #(#S(ARM-OP :VECTOR-INDEX -1
                                                                       :SHIFT.TYPE :INVALID
                                                                       :SHIFT.VALUE 0
                                                                       :TYPE :IMM
                                                                       :REG 4028
                                                                       :IMM 4028
                                                                       :FP 1.99D-320
                                                                       :MEM #S(ARM-OP-MEM :BASE 4028
                                                                                          :INDEX 0
                                                                                          :SCALE 0
                                                                                          :DISP 0)
                                                                       :SETEND NIL
                                                                       :SUBTRACTED NIL)))))
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
                                :ARM #S(INSN-ARM :USERMODE NIL
                                                 :VECTOR-SIZE 0
                                                 :VECTOR-DATA :INVALID
                                                 :CPS-MODE :INVALID0
                                                 :CPS-FLAG :INVALID
                                                 :CC :AL
                                                 :UPDATE-FLAGS NIL
                                                 :WRITEBACK T
                                                 :MEM-BARRIER :INVALID
                                                 :OP-COUNT 2
                                                 :OPERANDS #(#S(ARM-OP :VECTOR-INDEX -1
                                                                       :SHIFT.TYPE :INVALID
                                                                       :SHIFT.VALUE 0
                                                                       :TYPE :REG
                                                                       :REG 10
                                                                       :IMM 10
                                                                       :FP 5.0D-323
                                                                       :MEM #S(ARM-OP-MEM :BASE 10
                                                                                          :INDEX 0
                                                                                          :SCALE 0
                                                                                          :DISP 0)
                                                                       :SETEND NIL
                                                                       :SUBTRACTED NIL)
                                                             #S(ARM-OP :VECTOR-INDEX -1
                                                                       :SHIFT.TYPE :INVALID
                                                                       :SHIFT.VALUE 0
                                                                       :TYPE :MEM
                                                                       :REG 12
                                                                       :IMM 12
                                                                       :FP 6.0D-323
                                                                       :MEM #S(ARM-OP-MEM :BASE 12
                                                                                          :INDEX 0
                                                                                          :SCALE 1
                                                                                          :DISP -4)
                                                                       :SETEND NIL
                                                                       :SUBTRACTED NIL)))))
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
                                :ARM #S(INSN-ARM :USERMODE NIL
                                                 :VECTOR-SIZE 0
                                                 :VECTOR-DATA :INVALID
                                                 :CPS-MODE :INVALID0
                                                 :CPS-FLAG :INVALID
                                                 :CC :EQ
                                                 :UPDATE-FLAGS NIL
                                                 :WRITEBACK NIL
                                                 :MEM-BARRIER :INVALID
                                                 :OP-COUNT 3
                                                 :OPERANDS #(#S(ARM-OP :VECTOR-INDEX -1
                                                                       :SHIFT.TYPE :INVALID
                                                                       :SHIFT.VALUE 0
                                                                       :TYPE :REG
                                                                       :REG 66
                                                                       :IMM 66
                                                                       :FP 3.26D-322
                                                                       :MEM #S(ARM-OP-MEM :BASE 66
                                                                                          :INDEX 0
                                                                                          :SCALE 0
                                                                                          :DISP 0)
                                                                       :SETEND NIL
                                                                       :SUBTRACTED NIL)
                                                             #S(ARM-OP :VECTOR-INDEX -1
                                                                       :SHIFT.TYPE :INVALID
                                                                       :SHIFT.VALUE 0
                                                                       :TYPE :REG
                                                                       :REG 66
                                                                       :IMM 66
                                                                       :FP 3.26D-322
                                                                       :MEM #S(ARM-OP-MEM :BASE 66
                                                                                          :INDEX 0
                                                                                          :SCALE 0
                                                                                          :DISP 0)
                                                                       :SETEND NIL
                                                                       :SUBTRACTED NIL)
                                                             #S(ARM-OP :VECTOR-INDEX -1
                                                                       :SHIFT.TYPE :INVALID
                                                                       :SHIFT.VALUE 0
                                                                       :TYPE :REG
                                                                       :REG 66
                                                                       :IMM 66
                                                                       :FP 3.26D-322
                                                                       :MEM #S(ARM-OP-MEM :BASE 66
                                                                                          :INDEX 0
                                                                                          :SCALE 0
                                                                                          :DISP 0)
                                                                       :SETEND NIL
                                                                       :SUBTRACTED NIL)))))
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
                                :ARM #S(INSN-ARM :USERMODE NIL
                                                 :VECTOR-SIZE 0
                                                 :VECTOR-DATA :INVALID
                                                 :CPS-MODE :INVALID0
                                                 :CPS-FLAG :INVALID
                                                 :CC :AL
                                                 :UPDATE-FLAGS NIL
                                                 :WRITEBACK T
                                                 :MEM-BARRIER :INVALID
                                                 :OP-COUNT 2
                                                 :OPERANDS #(#S(ARM-OP :VECTOR-INDEX -1
                                                                       :SHIFT.TYPE :INVALID
                                                                       :SHIFT.VALUE 0
                                                                       :TYPE :REG
                                                                       :REG 74
                                                                       :IMM 74
                                                                       :FP 3.66D-322
                                                                       :MEM #S(ARM-OP-MEM :BASE 74
                                                                                          :INDEX 0
                                                                                          :SCALE 0
                                                                                          :DISP 0)
                                                                       :SETEND NIL
                                                                       :SUBTRACTED NIL)
                                                             #S(ARM-OP :VECTOR-INDEX -1
                                                                       :SHIFT.TYPE :INVALID
                                                                       :SHIFT.VALUE 0
                                                                       :TYPE :MEM
                                                                       :REG 68
                                                                       :IMM 68
                                                                       :FP 3.36D-322
                                                                       :MEM #S(ARM-OP-MEM :BASE 68
                                                                                          :INDEX 0
                                                                                          :SCALE 1
                                                                                          :DISP -992)
                                                                       :SETEND NIL
                                                                       :SUBTRACTED NIL)))))
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
                                :ARM #S(INSN-ARM :USERMODE NIL
                                                 :VECTOR-SIZE 0
                                                 :VECTOR-DATA :INVALID
                                                 :CPS-MODE :INVALID0
                                                 :CPS-FLAG :INVALID
                                                 :CC :EQ
                                                 :UPDATE-FLAGS NIL
                                                 :WRITEBACK NIL
                                                 :MEM-BARRIER :INVALID
                                                 :OP-COUNT 6
                                                 :OPERANDS #(#S(ARM-OP :VECTOR-INDEX -1
                                                                       :SHIFT.TYPE :INVALID
                                                                       :SHIFT.VALUE 0
                                                                       :TYPE :PIMM
                                                                       :REG 2
                                                                       :IMM 2
                                                                       :FP 1.0D-323
                                                                       :MEM #S(ARM-OP-MEM :BASE 2
                                                                                          :INDEX 0
                                                                                          :SCALE 0
                                                                                          :DISP 0)
                                                                       :SETEND :LE
                                                                       :SUBTRACTED NIL)
                                                             #S(ARM-OP :VECTOR-INDEX -1
                                                                       :SHIFT.TYPE :INVALID
                                                                       :SHIFT.VALUE 0
                                                                       :TYPE :IMM
                                                                       :REG 0
                                                                       :IMM 0
                                                                       :FP 0.0D0
                                                                       :MEM #S(ARM-OP-MEM :BASE 0
                                                                                          :INDEX 0
                                                                                          :SCALE 0
                                                                                          :DISP 0)
                                                                       :SETEND :INVALID
                                                                       :SUBTRACTED NIL)
                                                             #S(ARM-OP :VECTOR-INDEX -1
                                                                       :SHIFT.TYPE :INVALID
                                                                       :SHIFT.VALUE 0
                                                                       :TYPE :REG
                                                                       :REG 66
                                                                       :IMM 66
                                                                       :FP 3.26D-322
                                                                       :MEM #S(ARM-OP-MEM :BASE 66
                                                                                          :INDEX 0
                                                                                          :SCALE 0
                                                                                          :DISP 0)
                                                                       :SETEND NIL
                                                                       :SUBTRACTED NIL)
                                                             #S(ARM-OP :VECTOR-INDEX -1
                                                                       :SHIFT.TYPE :INVALID
                                                                       :SHIFT.VALUE 0
                                                                       :TYPE :CIMM
                                                                       :REG 3
                                                                       :IMM 3
                                                                       :FP 1.5D-323
                                                                       :MEM #S(ARM-OP-MEM :BASE 3
                                                                                          :INDEX 0
                                                                                          :SCALE 0
                                                                                          :DISP 0)
                                                                       :SETEND NIL
                                                                       :SUBTRACTED NIL)
                                                             #S(ARM-OP :VECTOR-INDEX -1
                                                                       :SHIFT.TYPE :INVALID
                                                                       :SHIFT.VALUE 0
                                                                       :TYPE :CIMM
                                                                       :REG 1
                                                                       :IMM 1
                                                                       :FP 5.0D-324
                                                                       :MEM #S(ARM-OP-MEM :BASE 1
                                                                                          :INDEX 0
                                                                                          :SCALE 0
                                                                                          :DISP 0)
                                                                       :SETEND :BE
                                                                       :SUBTRACTED NIL)
                                                             #S(ARM-OP :VECTOR-INDEX -1
                                                                       :SHIFT.TYPE :INVALID
                                                                       :SHIFT.VALUE 0
                                                                       :TYPE :IMM
                                                                       :REG 7
                                                                       :IMM 7
                                                                       :FP 3.5D-323
                                                                       :MEM #S(ARM-OP-MEM :BASE 7
                                                                                          :INDEX 0
                                                                                          :SCALE 0
                                                                                          :DISP 0)
                                                                       :SETEND NIL
                                                                       :SUBTRACTED NIL)))))
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
                                :ARM #S(INSN-ARM :USERMODE NIL
                                                 :VECTOR-SIZE 0
                                                 :VECTOR-DATA :INVALID
                                                 :CPS-MODE :INVALID0
                                                 :CPS-FLAG :INVALID
                                                 :CC :AL
                                                 :UPDATE-FLAGS NIL
                                                 :WRITEBACK NIL
                                                 :MEM-BARRIER :INVALID
                                                 :OP-COUNT 2
                                                 :OPERANDS #(#S(ARM-OP :VECTOR-INDEX -1
                                                                       :SHIFT.TYPE :INVALID
                                                                       :SHIFT.VALUE 0
                                                                       :TYPE :REG
                                                                       :REG 66
                                                                       :IMM 66
                                                                       :FP 3.26D-322
                                                                       :MEM #S(ARM-OP-MEM :BASE 66
                                                                                          :INDEX 0
                                                                                          :SCALE 0
                                                                                          :DISP 0)
                                                                       :SETEND NIL
                                                                       :SUBTRACTED NIL)
                                                             #S(ARM-OP :VECTOR-INDEX -1
                                                                       :SHIFT.TYPE :INVALID
                                                                       :SHIFT.VALUE 0
                                                                       :TYPE :IMM
                                                                       :REG 0
                                                                       :IMM 0
                                                                       :FP 0.0D0
                                                                       :MEM #S(ARM-OP-MEM :BASE 0
                                                                                          :INDEX 0
                                                                                          :SCALE 0
                                                                                          :DISP 0)
                                                                       :SETEND :INVALID
                                                                       :SUBTRACTED NIL)))))
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
                                :ARM #S(INSN-ARM :USERMODE NIL
                                                 :VECTOR-SIZE 0
                                                 :VECTOR-DATA :INVALID
                                                 :CPS-MODE :INVALID0
                                                 :CPS-FLAG :INVALID
                                                 :CC :AL
                                                 :UPDATE-FLAGS NIL
                                                 :WRITEBACK NIL
                                                 :MEM-BARRIER :INVALID
                                                 :OP-COUNT 2
                                                 :OPERANDS #(#S(ARM-OP :VECTOR-INDEX -1
                                                                       :SHIFT.TYPE :INVALID
                                                                       :SHIFT.VALUE 0
                                                                       :TYPE :REG
                                                                       :REG 69
                                                                       :IMM 69
                                                                       :FP 3.4D-322
                                                                       :MEM #S(ARM-OP-MEM :BASE 69
                                                                                          :INDEX 0
                                                                                          :SCALE 0
                                                                                          :DISP 0)
                                                                       :SETEND NIL
                                                                       :SUBTRACTED NIL)
                                                             #S(ARM-OP :VECTOR-INDEX -1
                                                                       :SHIFT.TYPE :INVALID
                                                                       :SHIFT.VALUE 0
                                                                       :TYPE :MEM
                                                                       :REG 67
                                                                       :IMM 67
                                                                       :FP 1.442957138187D-312
                                                                       :MEM #S(ARM-OP-MEM :BASE 67
                                                                                          :INDEX 68
                                                                                          :SCALE 1
                                                                                          :DISP 0)
                                                                       :SETEND NIL
                                                                       :SUBTRACTED NIL)))))
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
                                :ARM #S(INSN-ARM :USERMODE NIL
                                                 :VECTOR-SIZE 0
                                                 :VECTOR-DATA :INVALID
                                                 :CPS-MODE :INVALID0
                                                 :CPS-FLAG :INVALID
                                                 :CC :AL
                                                 :UPDATE-FLAGS T
                                                 :WRITEBACK NIL
                                                 :MEM-BARRIER :INVALID
                                                 :OP-COUNT 2
                                                 :OPERANDS #(#S(ARM-OP :VECTOR-INDEX -1
                                                                       :SHIFT.TYPE :INVALID
                                                                       :SHIFT.VALUE 0
                                                                       :TYPE :REG
                                                                       :REG 69
                                                                       :IMM 69
                                                                       :FP 3.4D-322
                                                                       :MEM #S(ARM-OP-MEM :BASE 69
                                                                                          :INDEX 0
                                                                                          :SCALE 0
                                                                                          :DISP 0)
                                                                       :SETEND NIL
                                                                       :SUBTRACTED NIL)
                                                             #S(ARM-OP :VECTOR-INDEX -1
                                                                       :SHIFT.TYPE :INVALID
                                                                       :SHIFT.VALUE 0
                                                                       :TYPE :IMM
                                                                       :REG 0
                                                                       :IMM 0
                                                                       :FP 0.0D0
                                                                       :MEM #S(ARM-OP-MEM :BASE 0
                                                                                          :INDEX 0
                                                                                          :SCALE 0
                                                                                          :DISP 0)
                                                                       :SETEND :INVALID
                                                                       :SUBTRACTED NIL)))))
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
                                :ARM #S(INSN-ARM :USERMODE NIL
                                                 :VECTOR-SIZE 0
                                                 :VECTOR-DATA :INVALID
                                                 :CPS-MODE :INVALID0
                                                 :CPS-FLAG :INVALID
                                                 :CC :AL
                                                 :UPDATE-FLAGS NIL
                                                 :WRITEBACK NIL
                                                 :MEM-BARRIER :INVALID
                                                 :OP-COUNT 1
                                                 :OPERANDS #(#S(ARM-OP :VECTOR-INDEX -1
                                                                       :SHIFT.TYPE :INVALID
                                                                       :SHIFT.VALUE 0
                                                                       :TYPE :SETEND
                                                                       :REG 1
                                                                       :IMM 1
                                                                       :FP 5.0D-324
                                                                       :MEM #S(ARM-OP-MEM :BASE 1
                                                                                          :INDEX 0
                                                                                          :SCALE 0
                                                                                          :DISP 0)
                                                                       :SETEND :BE
                                                                       :SUBTRACTED NIL)))))
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
                                :ARM #S(INSN-ARM :USERMODE T
                                                 :VECTOR-SIZE 0
                                                 :VECTOR-DATA :INVALID
                                                 :CPS-MODE :INVALID0
                                                 :CPS-FLAG :INVALID
                                                 :CC :AL
                                                 :UPDATE-FLAGS NIL
                                                 :WRITEBACK NIL
                                                 :MEM-BARRIER :INVALID
                                                 :OP-COUNT 4
                                                 :OPERANDS #(#S(ARM-OP :VECTOR-INDEX -1
                                                                       :SHIFT.TYPE :INVALID
                                                                       :SHIFT.VALUE 0
                                                                       :TYPE :REG
                                                                       :REG 66
                                                                       :IMM 66
                                                                       :FP 3.26D-322
                                                                       :MEM #S(ARM-OP-MEM :BASE 66
                                                                                          :INDEX 0
                                                                                          :SCALE 0
                                                                                          :DISP 0)
                                                                       :SETEND NIL
                                                                       :SUBTRACTED NIL)
                                                             #S(ARM-OP :VECTOR-INDEX -1
                                                                       :SHIFT.TYPE :INVALID
                                                                       :SHIFT.VALUE 0
                                                                       :TYPE :REG
                                                                       :REG 66
                                                                       :IMM 66
                                                                       :FP 3.26D-322
                                                                       :MEM #S(ARM-OP-MEM :BASE 66
                                                                                          :INDEX 0
                                                                                          :SCALE 0
                                                                                          :DISP 0)
                                                                       :SETEND NIL
                                                                       :SUBTRACTED NIL)
                                                             #S(ARM-OP :VECTOR-INDEX -1
                                                                       :SHIFT.TYPE :INVALID
                                                                       :SHIFT.VALUE 0
                                                                       :TYPE :REG
                                                                       :REG 68
                                                                       :IMM 68
                                                                       :FP 3.36D-322
                                                                       :MEM #S(ARM-OP-MEM :BASE 68
                                                                                          :INDEX 0
                                                                                          :SCALE 0
                                                                                          :DISP 0)
                                                                       :SETEND NIL
                                                                       :SUBTRACTED NIL)
                                                             #S(ARM-OP :VECTOR-INDEX -1
                                                                       :SHIFT.TYPE :INVALID
                                                                       :SHIFT.VALUE 0
                                                                       :TYPE :REG
                                                                       :REG 10
                                                                       :IMM 10
                                                                       :FP 5.0D-323
                                                                       :MEM #S(ARM-OP-MEM :BASE 10
                                                                                          :INDEX 0
                                                                                          :SCALE 0
                                                                                          :DISP 0)
                                                                       :SETEND NIL
                                                                       :SUBTRACTED NIL))))))