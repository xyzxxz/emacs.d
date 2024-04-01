;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))

;; Adjust garbage collection threshold for warly startup
(setq gc-cons-threshold (* 128 1024 1024))

;; Process preformance tuning
(setq read-process-output-max (* 4 1024 1024))
(setq process-adaptive-read-buffering nil)

;;; Bootstrap config
;; user emacs file
(setq custom-file (locate-user-emacs-file "custom.el"))

(setq warning-minimum-level :emergency)

;; straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (load bootstrap-file nil 'nomessage))

(setq package-enable-at-startup nil)

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

;; use-package
(straight-use-package 'use-package)

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
(xyz/load-module "base")

(add-hook 'org-mode-hook (lambda ()
                           (xyz/load-module "org")))

(provide 'init)
;;; init.el ends here
