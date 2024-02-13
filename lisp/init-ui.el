;;; init-ui.el --- Defaults for themes -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; 关闭工具栏，菜单栏，滚动条
(tool-bar-mode -1)
(set-scroll-bar-mode nil)
(menu-bar-mode -1)
(tooltip-mode -1)
(setq visible-bell t)
(setq use-file-dialog nil
      use-dialog-box nil
      inhibit-startup-screen t
      inhibit-startup-echo-area-message user-login-name
      inhibit-default-init t
      initial-scratch-message nil)
(unless (daemonp)
  (advice-add #'display-startup-echo-area-message :override #'ignore))

;; (use-package all-the-icons
;;   :init
;;   (set-frame-font "Hack Nerd Font" t))


;; 主题
(use-package doom-themes
  :ensure t
  :init
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
  (load-theme 'doom-oceanic-next t)
  (doom-themes-visual-bell-config)
  (doom-themes-org-config))

;; modeline
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :init (doom-modeline-mode 1)
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

;(setq default-frame-alist '((alpha 80 50)))

(use-package rainbow-delimiters
  :ensure t
  :defer t 
  :init
  (dolist (hook '(text-mode-hook prog-mode-hook))
    (add-hook hook #'rainbow-delimiters-mode)))

(use-package highlight-numbers
  :ensure t
  :defer t
  :init
  (add-hook 'prog-mode-hook #'highlight-numbers-mode))

(use-package rainbow-mode
  :ensure t
  :bind (("C-c t r" . rainbow-mode))
  :config (add-hook 'css-mode-hook #'rainbow-mode))


;;(use-package helpful
;;  :defer t 
;;  :custom
;;  (counsel-describe-function-function #'helpful-callable)
;;  (counsel-describe-variable-function #'helpful-variable)
;;  :bind
;;  ([remap describe-function] . counsel-describe-function)
;;  ([remap describe-command] . helpful-command)
;;  ([remap describe-variable] . counsel-describe-variable)
;;  ([remap describe-key] . helpful-key))

(provide 'init-ui)
;;; init-ui.el ends here
