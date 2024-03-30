(use-package embark
  :ensure t
  :after vertico
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
