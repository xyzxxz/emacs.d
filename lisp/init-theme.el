;;; init-theme.el --- Defaults for themes -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; 主题
(use-package doom-themes
  :ensure t
  :init
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
  (load-theme 'doom-oceanic-next t)
  :config
  (doom-themes-visual-bell-config)
  (doom-themes-org-config))

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
  :hook (((treemacs-mode
	   eshell-mode shell-mode
	   term-mode vterm-mode
	   lsp-ui-imenu-mode
	   pdf-annot-list-mode) . turn-on-hide-mode-line-mode)
	 (dired-mode . (lambda ()
			 (and (bound-and-true-p hide-mode-line-mode)
			      (turn-off-hide-mode-line-mode))))))

(use-package minions
  :hook (doom-modeline-mode . minions-mode))

(use-package nerd-icons
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

(provide 'init-theme)
;;; init-theme.el ends here
