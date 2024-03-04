;;; init-corfu.el --- Interactive completion in buffers -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(setq tab-always-indent 'complete)
(use-package orderless
  :after vertico
  :config
  (setq completion-styles '(orderless basic)))

(setq completion-category-defaults nil
      completion-category-overrides nil)
(setq completion-cycle-threshold 4)

(use-package corfu
  :bind ("M-/" . completion-at-point)
  :hook ((after-init . global-corfu-mode)
         (global-corfu-mode . corfu-popupinfo-mode))
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
  (use-package corfu-terminal
    :hook (global-corfu-mode . corfu-terminal-mode)))

(use-package nerd-icons-corfu
  :after corfu
  :init
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(provide 'init-corfu)
;;; init-corfu.el ends here
