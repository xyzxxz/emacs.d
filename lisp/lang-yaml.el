;;; lang-yaml.el --- yaml file configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package yaml-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode)))

(provide 'lang-yaml)
;;; lang-yaml.el ends here
