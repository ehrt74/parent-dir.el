# parent-dir.el

Replace filepath at point with parent directory.

## install

    (use-package parent-dir
      :vc (:url "https://github.com/ehrt74/parent-dir.el.git"
           :rev :newest)
      :bind (:map minibuffer-mode-map
         (\"C-^\" . #'parent-dir)))
