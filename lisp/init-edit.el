;;; init-edit.el --- Day-to-day editing helpers -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
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

(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(add-hook 'after-init-hook 'show-paren-mode)

(when (fboundp 'repeat-mode)
  (add-hook 'after-init-hook 'repeat-mode))

;;; Cut/copy the current line if no region is active
(use-package whole-line-or-region
  :config
  (add-hook 'after-init-hook 'whole-line-or-region-global-mode))

(global-set-key (kbd "M-j") 'join-line)

(use-package which-key
  :diminish which-key-mode
  :config
  (add-hook 'after-init-hook 'which-key-mode)
  (setq-default which-key-idle-delay 1.5))

;;; Support code and region folding
(use-package origami
  :config
  (define-key origami-mode-map (kbd "C-c f") 'origami-recursively-toggle-node)
  (define-key origami-mode-map (kbd "C-c F") 'origami-toggle-all-nodes))

(provide 'init-edit)
;;; init-edit.el ends here
