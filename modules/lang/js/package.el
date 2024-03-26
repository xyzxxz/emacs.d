(use-package json-mode)

(use-package js2-mode
  :mode ("\\.\\(js\\|es6\\)\\(\\.erb\\)?\\'" . js-mode)
  :config
  (setq-default js-indent-level 2)
  (setq-default js2-bounce-indent-p nil
                js2-mode-show-parse-errors t
                js2-mode-show-strict-warnings t)
  (when (derived-mode-p 'js-mode)
    (js2-minor-mode 1))
  (js2-imenu-extras-setup))

(add-to-list 'interpreter-mode-alist (cons "node" 'js2-mode))

(require 'derived)
