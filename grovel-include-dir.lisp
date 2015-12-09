(in-package #:capstone)

(defun read-path ()
  (format *query-io* "Enter directory containing capstone's C header files: ")
  (cl:list (read-line *query-io*)))

(defun query-error (format-string &rest args)
  (restart-case (apply #'error format-string args)
    (use-value (v)
      :report "Specify directory containing capstone's header files"
      :interactive read-path
      v)))

(defun query-user-for-include-dir ()
  (loop :for path := (query-error "Unable to determine Python include directory.")
               :then (query-error "Path ~s does not appear to exist." path)
        :when (cl-fad:directory-exists-p path) :return it))

(defparameter *capstone-include-dir*
              (or (cl-fad:directory-exists-p "/usr/include/capstone")
                  (cl-fad:directory-exists-p "/usr/local/include/capstone")
                  (cl-fad:directory-exists-p (namestring "~/projects/capstone/include"))
                  ;; This allows us to avoid querying the user during a recompile, while
                  ;; still allowing for a change in Python version
                  (when (boundp '*capstone-include-dir*)
                    (cl-fad:directory-exists-p *capstone-include-dir*))
                  (query-user-for-include-dir)))
