;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

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
;; ustc
(setq package-archives '(("gnu" . "https://mirrors.ustc.edu.cn/elpa/gnu/")
                         ("melpa" . "https://mirrors.ustc.edu.cn/elpa/melpa/")
                         ("nongnu" . "https://mirrors.ustc.edu.cn/elpa/nongnu/")))

;; emcs-china
;;(setq package-archives '(("gnu"   . "http://1.15.88.122/gnu/")
;;                         ("melpa" . "http://1.15.88.122/melpa/")))
;;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://1.15.88.122/org") t)
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

(defalias 'yes-or-no #'y-or-n-p)

;; Settings for tracking recent files
(add-hook 'after-init-hook 'recentf-mode)
(setq-default recentf-max-saved-items 1000)

(require 'diminish)

(require 'init-config)
(require 'init-func)

(xyz/init-modules)
;; load env file

;; set auto-mode-alist
;;(require 'init-module)

;; load base modules
;;(load-module (xyz/get-module "base"))
(xyz/load-module "base")

(provide 'init)
;;; init.el ends here
