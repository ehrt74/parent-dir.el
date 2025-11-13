;;; parent-dir.el --- replace filepath at point with parent dir -*- lexical-binding: t; -*-

;; Author: Ed Tavinor <edtavinor@posteo.de>
;; Maintainer: Ed Tavinor <edtavinor@posteo.de>
;; Version 0.0.1
;; Package-Requires: ((emacs "24"))
;; Keywords: extensions, lisp
;; URL: https://github.com/ehrt74/parent-dir.el


(defun parent-dir ()
  "replace filepath at point with parent directory.
I like to add this to `minibuffer-mode-map` with
`(bind-key (kbd "C-^") #'mia/minibuffer-up-directory 'minibuffer-mode-map)`
"
  (interactive)
  (save-excursion
    (let ((bounds (bounds-of-thing-at-point 'filename)))
      (goto-char (cdr bounds))
      (if (search-backward "/" (car bounds) t 2)
	  (progn
	    (search-forward "/" (cdr bounds) t 1)
	    (delete-region (point) (line-end-position)))
	(let ((filename (buffer-substring (car bounds) (cdr bounds))))
	  (when (string-equal (substring filename 0 1) "~")
	    (progn
	      (replace-string-in-region "~" (expand-file-name "~") (car bounds) (1+ (car bounds)))
	      (parent-dir))))))))

(provide 'parent-dir)
;;; parent-dir.el ends here
