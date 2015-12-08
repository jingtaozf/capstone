(in-package #:capstone.cffi)

(cc-flags #.(format nil "-I~A" *capstone-include-dir*))

(include "arm.h")
(include "arm64.h")
(include "capstone.h")
(include "mips.h")
(include "platform.h")
(include "ppc.h")
(include "sparc.h")
(include "systemz.h")
(include "x86.h")
(include "xcore.h")

(ctype size-t  "size_t")
(ctype csh  "csh")
(ctype uint8-t  "uint8_t")
(ctype bool  "bool")
(ctype int32-t "int32_t")
(ctype uint64-t "uint64_t")
(ctype uint16-t "uint16_t")
(ctype csh "csh")

(cenum cs-arch
       ((:ARM "CS_ARCH_ARM"))
       ((:ARM64 "CS_ARCH_ARM64"))
       ((:MIPS "CS_ARCH_MIPS"))
       ((:X86 "CS_ARCH_X86"))
       ((:PPC "CS_ARCH_PPC"))
       ((:SPARC "CS_ARCH_SPARC"))
       ((:SYSZ "CS_ARCH_SYSZ"))
       ((:XCORE "CS_ARCH_XCORE"))
       ((:MAX "CS_ARCH_MAX"))
       ((:ALL "CS_ARCH_ALL")))

(cenum cs-mode
       ((:LITTLE "CS_MODE_LITTLE_ENDIAN"))
       ((:ARM "CS_MODE_ARM"))
       ((:16 "CS_MODE_16"))
       ((:32 "CS_MODE_32"))
       ((:64 "CS_MODE_64"))
       ((:THUMB "CS_MODE_THUMB"))
       ((:MCLASS "CS_MODE_MCLASS"))
       ((:V8 "CS_MODE_V8"))
       ((:MICRO "CS_MODE_MICRO"))
       ((:MIPS3 "CS_MODE_MIPS3"))
       ((:MIPS32R6 "CS_MODE_MIPS32R6"))
       ((:MIPSGP64 "CS_MODE_MIPSGP64"))
       ((:V9 "CS_MODE_V9"))
       ((:BIG "CS_MODE_BIG_ENDIAN"))
       ((:MIPS32 "CS_MODE_MIPS32"))
       ((:MIPS64 "CS_MODE_MIPS64")))

(cenum cs-opt-type
       ((:SYNTAX "CS_OPT_SYNTAX"))
       ((:DETAIL "CS_OPT_DETAIL"))
       ((:MODE "CS_OPT_MODE"))
       ((:MEM "CS_OPT_MEM"))
       ((:SKIPDATA "CS_OPT_SKIPDATA"))
       ((:SKIPDATA_SETUP "CS_OPT_SKIPDATA_SETUP")))

(cenum cs-opt-value
       ((:OFF "CS_OPT_OFF"))
       ((:ON "CS_OPT_ON"))
       ((:SYNTAX_DEFAULT "CS_OPT_SYNTAX_DEFAULT"))
       ((:SYNTAX_INTEL "CS_OPT_SYNTAX_INTEL"))
       ((:SYNTAX_ATT "CS_OPT_SYNTAX_ATT"))
       ((:SYNTAX_NOREGNAME "CS_OPT_SYNTAX_NOREGNAME")))

(cenum arm-vectordata-type
       ((:INVALID "ARM_VECTORDATA_INVALID"))

       ;; Integer type
       ((:I8 "ARM_VECTORDATA_I8"))
       ((:I16 "ARM_VECTORDATA_I16"))
       ((:I32 "ARM_VECTORDATA_I32"))
       ((:I64 "ARM_VECTORDATA_I64"))

       ;; Signed integer type
       ((:S8 "ARM_VECTORDATA_S8"))
       ((:S16 "ARM_VECTORDATA_S16"))
       ((:S32 "ARM_VECTORDATA_S32"))
       ((:S64 "ARM_VECTORDATA_S64"))

       ;; Unsigned integer type
       ((:U8 "ARM_VECTORDATA_U8"))
       ((:U16 "ARM_VECTORDATA_U16"))
       ((:U32 "ARM_VECTORDATA_U32"))
       ((:U64 "ARM_VECTORDATA_U64"))

       ;; Data type for VMUL/VMULL
       ((:P8 "ARM_VECTORDATA_P8"))

       ;; Floating type
       ((:F32 "ARM_VECTORDATA_F32"))
       ((:F64 "ARM_VECTORDATA_F64"))

       ;; Convert float <-> float
       ((:F16F64 "ARM_VECTORDATA_F16F64"))	;; f16.f64
       ((:F64F16 "ARM_VECTORDATA_F64F16"))	;; f64.f16
       ((:F32F16 "ARM_VECTORDATA_F32F16"))	;; f32.f16
       ((:F16F32 "ARM_VECTORDATA_F16F32"))	;; f32.f16
       ((:F64F32 "ARM_VECTORDATA_F64F32"))	;; f64.f32
       ((:F32F64 "ARM_VECTORDATA_F32F64"))	;; f32.f64

       ;; Convert integer <-> float
       ((:S32F32 "ARM_VECTORDATA_S32F32"))	;; s32.f32
       ((:U32F32 "ARM_VECTORDATA_U32F32"))	;; u32.f32
       ((:F32S32 "ARM_VECTORDATA_F32S32"))	;; f32.s32
       ((:F32U32 "ARM_VECTORDATA_F32U32"))	;; f32.u32
       ((:F64S16 "ARM_VECTORDATA_F64S16"))	;; f64.s16
       ((:F32S16 "ARM_VECTORDATA_F32S16"))	;; f32.s16
       ((:F64S32 "ARM_VECTORDATA_F64S32"))	;; f64.s32
       ((:S16F64 "ARM_VECTORDATA_S16F64"))	;; s16.f64
       ((:S16F32 "ARM_VECTORDATA_S16F32"))	;; s16.f64
       ((:S32F64 "ARM_VECTORDATA_S32F64"))	;; s32.f64
       ((:U16F64 "ARM_VECTORDATA_U16F64"))	;; u16.f64
       ((:U16F32 "ARM_VECTORDATA_U16F32"))	;; u16.f32
       ((:U32F64 "ARM_VECTORDATA_U32F64"))	;; u32.f64
       ((:F64U16 "ARM_VECTORDATA_F64U16"))	;; f64.u16
       ((:F32U16 "ARM_VECTORDATA_F32U16"))	;; f32.u16
       ((:F64U32 "ARM_VECTORDATA_F64U32"))	;; f64.u32
       )
(cenum arm-cpsmode-type
       ((:INVALID0 "ARM_CPSMODE_INVALID"))
       ((:IE2 "ARM_CPSMODE_IE"))
       ((:ID3 "ARM_CPSMODE_ID")))
(cenum arm-cpsflag-type
	((:INVALID "ARM_CPSFLAG_INVALID"))
	((:F "ARM_CPSFLAG_F"))
	((:I "ARM_CPSFLAG_I"))
	((:A "ARM_CPSFLAG_A"))
	((:NONE "ARM_CPSFLAG_NONE"))	;; no flag
       )

(cenum arm-cc 
       ((:INVALID "ARM_CC_INVALID"))
       ((:EQ "ARM_CC_EQ")) ;; Equal                      Equal
       ((:NE "ARM_CC_NE")) ;; Not equal                  Not equal, or unordered
       ((:HS "ARM_CC_HS")) ;; Carry set                  >, ==, or unordered
       ((:LO "ARM_CC_LO")) ;; Carry clear                Less than
       ((:MI "ARM_CC_MI")) ;; Minus, negative            Less than
       ((:PL "ARM_CC_PL")) ;; Plus, positive or zero     >, ==, or unordered
       ((:VS "ARM_CC_VS")) ;; Overflow                   Unordered
       ((:VC "ARM_CC_VC")) ;; No overflow                Not unordered
       ((:HI "ARM_CC_HI")) ;; Unsigned higher            Greater than, or unordered
       ((:LS "ARM_CC_LS")) ;; Unsigned lower or same     Less than or equal
       ((:GE "ARM_CC_GE")) ;; Greater than or equal      Greater than or equal
       ((:LT "ARM_CC_LT")) ;; Less than                  Less than, or unordered
       ((:GT "ARM_CC_GT")) ;; Greater than               Greater than
       ((:LE "ARM_CC_LE")) ;; Less than or equal         <, ==, or unordered
       ((:AL "ARM_CC_AL")) ;; Always (unconditional)     Always (unconditional)
       )

(cenum arm-mem-barrier 
       ((:INVALID "ARM_MB_INVALID"))
       ((:RESERVED_0 "ARM_MB_RESERVED_0"))
       ((:OSHLD "ARM_MB_OSHLD"))
       ((:OSHST "ARM_MB_OSHST"))
       ((:OSH "ARM_MB_OSH"))
       ((:RESERVED_4 "ARM_MB_RESERVED_4"))
       ((:NSHLD "ARM_MB_NSHLD"))
       ((:NSHST "ARM_MB_NSHST"))
       ((:NSH "ARM_MB_NSH"))
       ((:RESERVED_8 "ARM_MB_RESERVED_8"))
       ((:ISHLD "ARM_MB_ISHLD"))
       ((:ISHST "ARM_MB_ISHST"))
       ((:ISH "ARM_MB_ISH"))
       ((:RESERVED_12 "ARM_MB_RESERVED_12"))
       ((:LD "ARM_MB_LD"))
       ((:ST "ARM_MB_ST"))
       ((:SY "ARM_MB_SY"))
       )

(cenum arm-shifter 
       ((:INVALID "ARM_SFT_INVALID"))
       ((:ASR "ARM_SFT_ASR"))	;; shift with immediate const
       ((:LSL "ARM_SFT_LSL"))	;; shift with immediate const
       ((:LSR "ARM_SFT_LSR"))	;; shift with immediate const
       ((:ROR "ARM_SFT_ROR"))	;; shift with immediate const
       ((:RRX "ARM_SFT_RRX"))	;; shift with immediate const
       ((:ASR_REG "ARM_SFT_ASR_REG"))	;; shift with register
       ((:LSL_REG "ARM_SFT_LSL_REG"))	;; shift with register
       ((:LSR_REG "ARM_SFT_LSR_REG"))	;; shift with register
       ((:ROR_REG "ARM_SFT_ROR_REG"))	;; shift with register
       ((:RRX_REG "ARM_SFT_RRX_REG"))	;; shift with register
       )
(cenum arm-op-type 
       ((:INVALID "ARM_OP_INVALID")) ;; = CS_OP_INVALID (Uninitialized).
       ((:REG "ARM_OP_REG")) ;; = CS_OP_REG (Register operand).
       ((:IMM "ARM_OP_IMM")) ;; = CS_OP_IMM (Immediate operand).
       ((:MEM "ARM_OP_MEM")) ;; = CS_OP_MEM (Memory operand).
       ((:FP "ARM_OP_FP"))  ;; = CS_OP_FP (Floating-Point operand).
       ((:CIMM "ARM_OP_CIMM")) ;; C-Immediate (coprocessor registers)
       ((:PIMM "ARM_OP_PIMM")) ;; P-Immediate (coprocessor registers)
       ((:SETEND "ARM_OP_SETEND"))	;; operand for SETEND instruction
       ((:SYSREG "ARM_OP_SYSREG"))	;; MSR/MSR special register operand
       )

(cstruct arm-op-mem "arm_op_mem"
         (base "base" :type :unsigned-int)
         (index "index" :type :unsigned-int)
         (scale "scale" :type :int)
         (disp "disp" :type :int)
         )

(cenum arm-setend-type 
       ((:INVALID "ARM_SETEND_INVALID"))	;; Uninitialized.
       ((:BE "ARM_SETEND_BE"))	;; BE operand.
       ((:LE "ARM_SETEND_LE")) ;; LE operand
       )

(cstruct cs-arm-op "cs_arm_op" 
         (vector-index "vector_index" :type :int)
         (shift.type "shift.type" :type arm-shifter)
         (shift.value "shift.value" :type :unsigned-int)
         (type "type" :type arm-op-type)
         (reg "reg" :type :unsigned-int)
         (imm "imm" :type int32-t)
         (fp "fp" :type :double)
         (mem "mem" :type (:struct arm-op-mem))
         (setend "setend" :type arm-setend-type)
         (subtracted "subtracted" :type bool)
         )
(cstruct cs-arm "cs_arm" 
         (usermode "usermode" :type bool) 	;; User-mode registers to be loaded (for LDM/STM instructions)
         (vector-size "vector_size" :type :int)  	;; Scalar size for vector instructions
         (vector-data "vector_data" :type arm-vectordata-type)  ;; Data type for elements of vector instructions
         (cps-mode "cps_mode" :type arm-cpsmode-type) 	;; CPS mode for CPS instruction
         (cps-flag "cps_flag" :type arm-cpsflag-type) 	;; CPS mode for CPS instruction
         (cc "cc" :type arm-cc) 			;; conditional code for this insn
         (update-flags "update_flags" :type bool) 	;; does this insn update flags?
         (writeback "writeback" :type bool) 		;; does this insn write-back?
         (mem-barrier "mem_barrier" :type arm-mem-barrier) 	;; Option for some memory barrier instructions

         ;; Number of operands of this instruction, 
         ;; or 0 when instruction has no operand.
         (op-count "op_count" :type uint8-t) 

         (operands "operands" :type (:struct cs-arm-op) :count 36) 	;; operands for this instruction.
         )
(cstruct cs-detail "cs_detail" 
         (regs-read "regs_read" :type uint8-t :count 12)
         (regs-read-count "regs_read_count" :type uint8-t)
         (regs-write "regs_write" :type uint8-t :count 20)
         (regs-write-count "regs_write_count" :type uint8-t)
         (groups "groups" :type uint8-t :count 8)
         (groups-count "groups_count" :type uint8-t)
         (arm "arm" :type (:struct cs-arm))
         )
(cstruct cs-insn "cs_insn" 
         (id "id" :type :unsigned-int)
         (address "address" :type uint64-t)
         (size "size" :type uint16-t)

         (bytes "bytes" :type uint8-t :count 16)
         (mnemonic "mnemonic" :type :char :count 32)
         (op-str "op_str" :type :char :count 160)
         (detail "detail" :type (:pointer (:STRUCT cs-detail)))
         )

(cenum cs-err 
	((:OK "CS_ERR_OK"))   ;; No error: everything was fine
	((:MEM "CS_ERR_MEM"))      ;; Out-Of-Memory error: cs_open() cs_disasm() cs_disasm_iter()
	((:ARCH "CS_ERR_ARCH"))     ;; Unsupported architecture: cs_open()
	((:HANDLE "CS_ERR_HANDLE"))   ;; Invalid handle: cs_op_count() cs_op_index()
	((:CSH "CS_ERR_CSH"))	     ;; Invalid csh argument: cs_close() cs_errno() cs_option()
	((:MODE "CS_ERR_MODE"))     ;; Invalid/unsupported mode: cs_open()
	((:OPTION "CS_ERR_OPTION"))   ;; Invalid/unsupported option: cs_option()
	((:DETAIL "CS_ERR_DETAIL"))   ;; Information is unavailable because detail option is OFF
	((:MEMSETUP "CS_ERR_MEMSETUP")) ;; Dynamic memory management uninitialized (see CS_OPT_MEM)
	((:VERSION "CS_ERR_VERSION"))  ;; Unsupported version (bindings)
	((:DIET "CS_ERR_DIET"))     ;; Access irrelevant data in "diet" engine
	((:SKIPDATA "CS_ERR_SKIPDATA")) ;; Access irrelevant data for "data" instruction in SKIPDATA mode
	((:X86_ATT "CS_ERR_X86_ATT"))  ;; X86 AT&T syntax is unsupported (opt-out at compile time)
	((:X86_INTEL "CS_ERR_X86_INTEL")) ;; X86 Intel syntax is unsupported (opt-out at compile time)
)
