;;; lang-web.el --- Editing HTML -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package rainbow-mode
  :init
  (dolist (hook '(css-mode-hook html-mode-hook sass-mode-hook js2-mode-hook web-mode))
    (add-hook hook 'rainbow-mode)))

(use-package auto-rename-tag)
(auto-rename-tag-mode t)

(use-package emmet-mode
  :hook
  (css-mode web-mode html-mode haml-mode nxml-mode rjsx-mode reason-mode)
  :config
  (when (require 'yasnippet nil t)
    (add-hook 'emmet-mode-hook #'yas-minor-mode-on))
  (setq emmet-move-cursor-between-quotes t)
  (define-key emmet-mode-keymap (kbd "C-RET") 'emmet-expand)

  (add-to-list 'company-backends '(company-web-html company-css)))

(use-package css-mode
  :init
  (setq css-indent-offset 4))

(use-package scss-mode
  :init
  (setq scss-compile-at-save nil))

(use-package js2-mode)

(use-package web-mode
  :config
  (setq web-mode-css-indent-offset 4
	web-mode-code-indent-offset 4))

(use-package add-node-modules-path
  :hook ((web-mode js-mode js2-mode) . add-node-modules-path))

;; bootstrap5 completion

;; jquery

;; angular

;; vue3

;; react



(provide 'lang-web)
;;; lang-web.el ends here
