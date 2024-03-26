(use-package yaml-mode
  :mode ("\\.yml\\erb\\'". yaml-mode)
  :config
  (add-hook 'yaml-mode-hook 'goto-address-prog-mode))
