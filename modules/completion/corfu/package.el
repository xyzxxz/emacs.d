(use-package orderless
  :ensure t
  :after vertico
  :config
  (setq completion-styles '(orderless basic)))

(use-package corfu
  :ensure t
  :bind ("M-/" . completion-at-point)
  :hook (after-init . global-corfu-mode)
  :config
  (setq corfu-auto t
        corfu-auto-prefix 2
        corfu-preview-current nil
        corfu-auto-delay 0.2
        corfu-popupinfo-delay '(0.4 . 0.2))
  (with-eval-after-load 'eshell
    (add-hook 'eshell-mode-hook (lambda () (setq-local corfu-auto nil))))
  (setq-default corfu-quit-no-match 'separator))


;; Make Corfu also work in terminals, without disturbing usual behaviour in GUI
(unless (display-graphic-p)
  (require 'corfu-terminal)
  (add-hook 'global-corfu-mode 'corfu-terminal-mode))

(use-package nerd-icons-corfu
  :ensure t
  :after corfu
  :init
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

