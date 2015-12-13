(defpackage #:capstone
  (:use #:cl #:cffi :xjt-utils)
  (:import-from #:cffi #:parse-type #:find-type-parser)
  (:export 
   #:cs-open
   #:cs-close
   #:cs-option-detail-on
   #:cs-disasm
   #:with-capstone-handle
   #:cs-reg-name
   ))
