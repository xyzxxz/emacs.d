;;; lang-html.el --- Editing HTML -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package tagedit
  :after sgml-mode
  :config
  (tagedit-add-paredit-like-keybindings)
  (define-key tagedit-mode-map (kbd "M-?") nil)
  (define-key tagedit-mode-map (kbd "M-s") nil)
  (add-hook 'sgml-mode-hook (lambda () (tagedit-mode 1))))

(provide 'lang-html)
;;; lang-html.el ends here
