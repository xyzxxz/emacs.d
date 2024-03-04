;;; lang-markdown.el --- Markdown support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package markdown-mode
  :mode ("\\.md\\'" . markdown-mode)
  :init
  (setq markdown-enable-wiki-links t
	markdown-italic-underscore t))

(provide 'lang-markdown)
;;; lang-markdown.el ends here
