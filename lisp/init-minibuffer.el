;;; init-minibuffer.el --- Config for minibuffer completion       -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package vertico
  :config
  (add-hook 'after-init-hook 'vertico-mode))

(use-package nerd-icons-completion
  :hook (vertico-mode . nerd-icons-completion-mode))

(use-package embark
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

(use-package consult
  :bind (([remap switch-to-buffer] . consult-buffer)
         ([remap switch-to-buffer-other-window] . consult-buffer-other-window)
         ([remap switch-to-buffer-other-frame] . consult-buffer-other-frame)
         ([remap goto-line] . consult-goto-line)
         ([remap Info-search] . consult-info)
         ([remap isearch-forward] . consult-line)
         ("C-c c t" . consult-theme))
  :hook (completion-list-mode . consult-preview-at-point-mode)
  :init
  (setq register-preview-delay 0.5
        register-preview-function #'consult-register-format)

  (advice-add #'register-preview :override #'consult-register-window))

(use-package embark-consult
  :after embark
  :bind (:map minibuffer-mode-map
              ("C-c C-o" . embark-export))
  :hook (embark-collect-mode . consult-preview-at-point-mode)
  :config
  (add-hook 'embark-collect-mode-hook 'embark-consult-preview-minor-mode))

(use-package marginalia
  :config
  (add-hook 'after-init-hook 'marginalia-mode))

(provide 'init-minibuffer)
;;; init-minibuffer.el ends here
