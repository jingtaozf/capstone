(defpackage #:capstone.cffi
  (:use #:cl #:cffi)
  (:import-from #:cffi #:parse-type #:find-type-parser)
  (:export 
   #:cs-arch
   #:cs-mode
   #:cs-open
   #:cs-close
   #:cs-option-detail-on
   #:cs-disasm
           )
  (:documentation "
CAPSTONE.CFFI is the package for defining the CFFI interface to capstone's external
C functions."))

(defpackage #:capstone
  (:use #:cl #:capstone.cffi)
  (:export 
	   ))
