(defpackage #:capstone.cffi
  (:use #:cl #:cffi)
  (:import-from #:cffi #:parse-type #:find-type-parser)
  (:export 
           )
  (:documentation "
CAPSTONE.CFFI is the package for defining the CFFI interface to capstone's external
C functions."))

(defpackage #:capstone
  (:use #:cl #:capstone.cffi)
  (:export 
	   ))
