(use-package embark
  :ensure t
  :after vertico
  :general
  (patrl/leader-keys
     "." 'embark-act) ;; easily accessible 'embark-act' binding.
  ("C-;" 'embark-dwim)
  (:keymaps 'vertico-map
            "C-." 'embark-act)
  (:keymaps 'embark-heading-map
            "l" 'org-id-store-link)
  :config
  (define-key vertico-map (kbd "C-c C-o") 'embark-export)
  (define-key vertico-map (kbd "C-c C-c") 'embark-act)
  (setq prefix-help-command #'embark-prefix-help-command)
  (with-eval-after-load 'which-key
    (setq embark-indicators
          '(embark-which-key-indicator
            embark-highlight-indicator
            embark-isearch-highlight-indicator))))

(use-package embark-consult
  :ensure t
  :after (embark consult)
  :demand t
  :bind (:map minibuffer-mode-map
              ("C-c C-o" . embark-export))
  :hook (embark-collect-mode . consult-preview-at-point-mode))
