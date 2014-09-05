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
(defun cd-compile(&optional arg)
  "Run compile in a specific directory.
If cd-compile-directory is set then compile will be run in that directory,
otherwise the user will be prompted to enter a directory. After the directory
is selected, it will be cached for subsequent compile without prompting.

If ARG is supplied, prompt for new directory and compile command."
  (interactive "P")
  (let* ((default-directory
           (if (and cd-compile-directory (not arg))
               (file-name-as-directory cd-compile-directory)
             (read-directory-name "Compile directory: "))))
    (setq cd-compile-directory default-directory)
    (if arg
        (setq-local compilation-read-command t)
      (setq-local compilation-read-command nil))
    (call-interactively 'compile)))

(provide 'cd-compile)

;;; cd-compile.el ends here
