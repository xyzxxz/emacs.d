(use-package vertico
  :ensure t
  :config
  (add-hook 'after-init-hook 'vertico-mode))

(use-package nerd-icons-completion
  :ensure t
  :hook (vertico-mode . nerd-icons-completion-mode))
