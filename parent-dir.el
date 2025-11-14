;;; parent-dir.el --- replace filepath at point with parent directory -*- lexical-binding: t; -*-

;; Author: Ed Tavinor <edtavinor@posteo.de>
;; Maintainer: Ed Tavinor <edtavinor@posteo.de>
;; Version 0.0.2
;; Package-Requires: ((emacs "24"))
;; Keywords: extensions, lisp
;; URL: https://github.com/ehrt74/parent-dir.el


(defun parent-dir ()
  "replace filepath at point with parent directory.
Can be installed with
`(use-package parent-dir
  :vc (:url \"https://github.com/ehrt74/parent-dir.el.git\"
       :rev :newest)
  :bind (:map minibuffer-mode-map
         (\"C-^\" . #'parent-dir)))`
"
  (interactive)
    (let* ((bounds (bounds-of-thing-at-point 'filename))
	   (filename (buffer-substring (car bounds) (cdr bounds)))
	   (replaced-filename (if (string-equal "~/" filename) (expand-file-name filename) filename))
	   (new-filename (file-name-directory (directory-file-name replaced-filename))))
      (replace-string-in-region filename new-filename (car bounds) (cdr bounds))
      (goto-char (+ (car bounds) (length new-filename)))))

(provide 'parent-dir)
;;; parent-dir.el ends here
