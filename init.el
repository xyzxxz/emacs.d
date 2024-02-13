;;; init.el --- load the full configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(setenv "HOME" "/home/vmxyz/")
(setenv "PATH" "/home/vmxyz/.emacs.d/")
(setq user-emacs-directory "~/")

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; user emacs file
;; (setq custom-file (locate-user-emacs-file "custom.el"))

(require 'package)
(setq package-archives '(("gnu"   . "http://1.15.88.122/gnu/")
                         ("melpa" . "http://1.15.88.122/melpa/")))
;;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)


(global-set-key (kbd "<escape>") 'keypad-escape-quit)

(add-to-list 'default-frame-alist
             '(font . "Fira Code-14"))

;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package)
  (setq use-package-verbose t))

(require 'diminish)
(require 'bind-key)
(require 'subr-x)

;; Environment fixup
(use-package exec-path-from-shell
  :ensure t
  :if (and (eq system-type 'darwin) (display-graphic-p))
  :config
  (progn
    (when (string-match-p "/zsh$" (getenv "SHELL"))
      (setq exec-path-from-shell-arguments '("-l")))
    (dolist (var '("PYTHONPATH"
		   "JAVA_OPTS"
		   ))
      (add-to-list 'exec-path-from-shell-variables var))
    (exec-path-from-shell-initialize)))

(setq make-backup-files nil)

(require 'init-dashboard)
(require 'init-ui)
(require 'init-which-key)
;(require 'init-evil)
(require 'init-keybindings)
;(require 'init-ivy)
(require 'init-completion)
;(require 'init-dired)
;(require 'init-flymake)
;(require 'init-lsp)
;(require 'init-terminal)
;(require 'init-treemacs)
;(require 'lang-c-cpp)
;(require 'lang-cmake)
;(require 'lang-java)
;(require 'lang-json)
(require 'lang-latex)
;(require 'lang-lisp)
;(require 'lang-lua)
;(require 'lang-markdown)
(require 'lang-org)
;(require 'lang-python)
;(require 'lang-rust)
;(require 'lang-web)
(require 'lang-yaml)

(provide 'init)
;;; init.el ends here
