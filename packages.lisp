(defpackage #:capstone
  (:use #:cl #:cffi :xjt-utils)
  (:import-from #:cffi #:parse-type #:find-type-parser)
  (:export 
   #:cs-arch
   #:cs-mode
   #:cs-open
   #:cs-close
   #:cs-option-detail-on
   #:cs-disasm
   #:with-capstone-handle
   ))
