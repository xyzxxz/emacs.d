(use-package emmet-mode
  :ensure t
  :defer t)

(use-package web-mode
  :ensure t
  :defer t
  :mode ("\\.html\\'")
  :config
  (setq web-mode-markup-indent-offset 4))

(use-package web-beautify
  :after web-mode
  :bind (:map web-mode-map
              ("C-c b" . web-beautify-html)))
