(use-package which-key
  :ensure t
  :diminish which-key-mode
  :config
  (add-hook 'after-init-hook 'which-key-mode)
  (setq-default which-key-idle-delay 0.5)
  (setq which-key-popup-type 'minibuffer))

