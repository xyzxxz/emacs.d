;;; init-gui-frames.el --- Behaviour specific to non-TTY frames -*- lexical-binding : t -*-
;;; Commentary:
;;; Code:
;; Suppress GUI features
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

;; Change global font size easily
(use-package default-text-scale
  :config
  (add-hook 'after-init-hook 'default-text-scale-mode))

(require 'disp-table)

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

(provide 'init-gui-frames)
;;; init-gui-frames.el ends here
