(use-package web-mode
  :config
  (setq web-mode-css-indent-offset 4
        web-mode-code-indent-offset 4))

(use-package add-node-modules-path
  :hook ((web-mode js-mode js2-mode) . add-node-modules-path))
