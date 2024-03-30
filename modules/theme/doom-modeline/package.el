;; modeline
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :config
  (setq doom-modeline-height 25
        doom-modeline-bar-width 4
        doom-modeline-buffer-file-name-style 'auto
        doom-modeline-icon t
        doom-modeline-major-mode-icon t
        doom-modeline-major-mode-color-icon t
        doom-modeline-workspace-name t
        doom-modeline-time t
        doom-modeline-minor-modes t
        doom-modeline-window-width-limit 110))

(use-package hide-mode-line
  :ensure t
  :hook (((treemacs-mode
           eshell-mode shell-mode
           term-mode vterm-mode
           lsp-ui-imenu-mode
           pdf-annot-list-mode) . turn-on-hide-mode-line-mode)
         (dired-mode . (lambda ()
                         (and (bound-and-true-p hide-mode-line-mode)
                              (turn-off-hide-mode-line-mode))))))

(use-package minions
  :ensure t
  :hook (doom-modeline-mode . minions-mode))
