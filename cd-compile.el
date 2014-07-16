;;; cd-compile.el --- run compile in a specific directory

;; Copyright (C) 2014 Jamie Nicol

;; Author: Jamie Nicol <jamie@thenicols.net>
;; Version: 0.1

;;; Commentary:

;; Run compile in a specific directory.  If cd-compile-directory is set then
;; compile will be run in that directory, otherwise the user will be prompted
;; to enter a directory.  It may be useful to set cd-compile-directory as a
;; file-local or directory-local variable.

;;; Code:

;;;###autoload
(defvar cd-compile-directory nil
  "Directory in which to run compile.")

;;;###autoload
(put 'cd-compile-directory 'safe-local-variable 'stringp)

;;;###autoload
(defun cd-compile()
  "Run compile in a specific directory.
If cd-compile-directory is set then compile will be run in that directory,
otherwise the user will be prompted to enter a directory."
  (interactive)
  (let ((default-directory
          (if cd-compile-directory
              (file-name-as-directory cd-compile-directory)
            (read-directory-name "Compile directory: "))))
    (call-interactively 'compile)))

(provide 'cd-compile)

;;; cd-compile.el ends here
