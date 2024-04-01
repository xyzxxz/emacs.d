(use-package electric
  :straight (:type built-in)
  :init
  (electric-pair-mode +1) ;; automatically insert closing parens
  (setq electric-pair-preserve-balance nil)) ;; more annoying than useful

;; Change global font size easily
(use-package default-text-scale
  :ensure t
  :config
  (add-hook 'after-init-hook 'default-text-scale-mode))

(require 'disp-table)

(use-package smartparens
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'smartparens-mode))

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package rainbow-mode
  :ensure t
  :config
  (setq rainbow-x-colors nil)
  (add-hook 'prog-mode-hook 'rainbow-mode))

;;; Cut/copy the current line if no region is active
(use-package whole-line-or-region
  :ensure t
  :config
  (add-hook 'after-init-hook 'whole-line-or-region-global-mode))

(use-package nerd-icons
  :ensure t
  :init
  (set-frame-font "Hack Nerd Font-14" t)
  (setq nerd-icons-font-family "Hack Nerd Font Mono"))

(use-package display-line-numbers
  :ensure nil
  :hook ((prog-mode yaml-mode conf-mode) . display-line-numbers-mode)
  :init
  (setq display-line-numbers-width-start t))


(use-package highlight-numbers
  :ensure t
  :defer t
  :init
  (add-hook 'prog-mode-hook #'highlight-numbers-mode))

;;(load-default-modules)
(dolist (m xyz-default-modules)
  (xyz/load-module m))
