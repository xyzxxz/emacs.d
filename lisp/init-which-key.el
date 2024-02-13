;;; init-which-key.el --- config which-key plugin -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package which-key
  :ensure t
  :init (which-key-mode)
  :config
  (setq which-key-idle-delay 0.3
	which-key-sort-order 'which-key-prefix-then-key-order))

(provide 'init-which-key)
;;; init-which-key.el ends here
