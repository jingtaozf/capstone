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

(cstruct cs-detail "cs_detail" 
         (regs-read "regs_read" :type uint8-t :count 12)
         (regs-read-count "regs_read_count" :type uint8-t)
         (regs-write "regs_write" :type uint8-t :count 20)
         (regs-write-count "regs_write_count" :type uint8-t)
         (groups "groups" :type uint8-t :count 8)
         (groups-count "groups_count" :type uint8-t)
         )
;; (cstruct cs-insn "cs_insn" 
