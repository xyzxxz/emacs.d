;;; lang-yaml.el ---Support yaml file -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package yaml-mode
  :mode ("\\.yml\\erb\\'". yaml-mode)
  :config
  (add-hook 'yaml-mode-hook 'goto-address-prog-mode))

(provide 'lang-yaml)
;;; lang-yaml.el ends here
