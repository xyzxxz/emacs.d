;;; config.el --- default load modules -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(defconst xyz-default-modules '("general"
                                "evil"
                                "which-key"
                                "modus-theme"
                                "doom-modeline"
                                "dashboard"
                                "corfu"
;;                                "flymake"
                                "vertico"
                                "consult"
                                "embark"
                                "helpful"
                                "eglot"
                                "dired"
                                "terminal"
;;                                "cc"
                                "lisp"
                                "org"
                                "markdown"))

;;; Some basic preferences
(setq-default blink-cursor-interval 0.4
	      case-fold-search t
	      column-number-mode t
	      indent-tabs-mode nil
	      create-lockfiles nil
	      auto-save-default nil
	      make-backup-files nil
	      mouse-yank-at-point t
	      scroll-preserve-screen-position 'always
	      tooltip-delay 1.5)

(add-hook 'after-init-hook 'delete-selection-mode)
(add-hook 'after-init-hook 'global-auto-revert-mode)

(with-eval-after-load 'autorevert
  (diminish 'auto-revert-mode))

(add-hook 'after-init-hook 'transient-mark-mode)

(when (fboundp 'display-line-numbers-mode)
  (setq-default display-line-numbers-width 3)
  (add-hook 'prog-mode-hook 'display-line-numbers-mode))

(setq use-file-dialog nil)
(setq use-dialog-box nil)
(setq inhibit-startup-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t
      initial-scratch-message nil)

;; Window size and features
(setq-default window-resize-pixelwise t
              frame-resize-pixelwise t)

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'set-scroll-bar-mode)
  (set-scroll-bar-mode nil))

(menu-bar-mode -1)

(let ((no-border'(internal-border-width . 0)))
  (add-to-list 'default-frame-alist no-border)
  (add-to-list 'initial-frame-alist no-border))

(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

(add-hook 'term-mode-hook
          (lambda ()
            (setq line-spacing 0)))

(setq default-frame-alist
      (append (list
               '(top . 0.5)
               '(height     . 0.8)
               '(width  . 0.628)
               '(left      . 0.5)
               '(internal-border-width . 24)
               '(left-fringe  . 1)
               '(right-fringe . 1)
               '(fullscreen))))

(add-hook 'after-init-hook 'show-paren-mode)

(when (fboundp 'repeat-mode)
  (add-hook 'after-init-hook 'repeat-mode))

;;; config.el ends here
