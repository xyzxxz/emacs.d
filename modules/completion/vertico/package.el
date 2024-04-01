(use-package vertico
  :ensure t
  :hook (after-init . vertico-mode)
  :config
  (setq enable-recursive-minibuffers t)
  (setq vertico-resize nil
        vertico-count 20
        vertico-cycle t
        completion-ignore-case t
        read-file-name-completion-ignore-case t
        read-buffer-completion-ignore-case t)
  (vertico-mode))

(use-package nerd-icons-completion
  :ensure t
  :hook (vertico-mode . nerd-icons-completion-mode))

(use-package orderless
  :ensure t
  :init
  (setq completion-styles '(orderless)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

(use-package marginalia
  :ensure t
  :after vertico
  :config
  (marginalia-mode))
