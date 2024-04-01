(use-package orderless
  :ensure t
  :after vertico
  :config
  (setq completion-styles '(orderless basic)))

(use-package corfu
  :ensure t
  :bind ("M-/" . completion-at-point)
  :general
  (:keymaps 'corfu-map
            "SPC" 'corfu-insert-separator)
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
  (corfu-terminal-mode))

(use-package nerd-icons-corfu
  :ensure t
  :after corfu
  :init
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(use-package cape
  :ensure t
  :general
  ("M-p p" 'completion-at-point ;; capf
   "M-p t" 'complete-tag ;; etags
   "M-p d" 'cape-dabbrev ;; dabbrev
   "M-p h" 'cape-history
   "M-p f" 'cape-file
   "M-p k" 'cape-keyword
   "M-p s" 'cape-symbol
   "M-p a" 'cape-abbrev
   "M-p i" 'cape-ispell
   "M-p l" 'cape-line
   "M-p w" 'cape-dict
   "M-p \\" 'cape-tex
   "M-p &" 'cape-sgml
   "M-p r" 'cape-rfc1345)
  :init
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev))
