;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(defconst *is-a-win* (eq system-type 'darwin))

;; Adjust garbage collection threshold for warly startup
(setq gc-cons-threshold (* 128 1024 1024))

;; Process preformance tuning
(setq read-process-output-max (* 4 1024 1024))
(setq process-adaptive-read-buffering nil)

;;; Bootstrap config
;; user emacs file
(setq custom-file (locate-user-emacs-file "custom.el"))

(setq warning-minimum-level :emergency)

(require 'package)
(setq package-archives '(("gnu"   . "http://1.15.88.122/gnu/")
                         ("melpa" . "http://1.15.88.122/melpa/")))
;;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)
;; site-lisp
(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))

;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package)
  (setq use-package-verbose t))

;; Environment fixup
(use-package exec-path-from-shell
  :ensure t
  :config
  (when (or (memq window-system '(mac ns x pgtk))
	    (unless (memq system-type '(ms-dos windows-nt))
	      (daemonp)))
    (exec-path-from-shell-initialize)))

;; General performance tuning
(use-package gcmh
  :ensure t
  :config
  (setq gcmh-high-cons-threshold (* 128 1024 1024))
  (add-hook 'after-init-hook (lambda ()
			       (gcmh-mode)
			       (diminish 'gcmh-mode))))

(setq jit-lock-defer-time 0)

(require 'diminish)

;; Settings for tracking recent files
(add-hook 'after-init-hook 'recentf-mode)
(setq-default recentf-max-saved-items 1000)

(require 'init-theme)
(require 'init-gui-frames)
(require 'init-hydra)
(require 'init-dired)
(require 'init-isearch)
(require 'init-ibuffer)
(require 'init-flymake)
(require 'init-eglot)
(require 'init-minibuffer)
;;Settings for hippie-expand
(global-set-key (kbd "M-/") 'hippie-expand)
(setq hippie-expand-try-functions-list '(try-complete-file-name-partially
					 try-complete-file-name
					 try-expand-dabbrev
					 try-expand-dabbrev-all-buffers
					 try-expand-dabbrev-from-kill))
(require 'init-corfu)
(require 'init-edit)
(require 'init-treemacs)
(require 'init-projectile)
(require 'init-terminal)

(require 'lang-css)
(require 'lang-haskell)
(require 'lang-html)
(require 'lang-javascript)
(require 'lang-lisp)
(require 'lang-lua)
(require 'lang-markdown)
(require 'lang-org)
(require 'lang-python)
(require 'lang-rust)
(require 'lang-toml)
(require 'lang-yaml)

(use-package sudo-edit)

;;(require 'init-evil)
;;(require 'init-treemacs)
;;(require 'lang-c-cpp)
;;(require 'lang-cmake)
;;(require 'lang-java)
;;(require 'lang-latex)

(provide 'init)
;;; init.el ends here
