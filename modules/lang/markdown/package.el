(use-package markdown-mode
  :ensure t
  :mode ("\\.md\\'" . markdown-mode)
  :init
  (setq markdown-enable-wiki-links t
        markdown-italic-underscore t))
