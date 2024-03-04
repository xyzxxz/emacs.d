;;; init-isearch.el --- isearch settings -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Show number of matches while searching
(use-package anzu
  :config
  (add-hook 'after-init-hook 'global-anzu-mode)
  (setq anzu-mode-lighter "")
  (global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp)
  (global-set-key [remap query-replace] 'anzu-query-replace))

(with-eval-after-load 'isearch
  (define-key isearch-mode-map [remap isearch-delete-char] 'isearch-del-char))

(provide 'init-isearch)
;;; init-isearch.el ends here
