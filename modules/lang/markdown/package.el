(use-package markdown-mode
  :ensure t
  :defer t
  :mode ("\\.md\\'" . markdown-mode)
  :init
  (setq markdown-enable-wiki-links t
        markdown-italic-underscore t)
  :general
  (:keymaps 'markdown-mode-map :states 'normal
            [tab] 'markdown-cycle))

(use-package markdown-toc
  :ensure t
  :defer t)

(use-package pandoc-mode
  :after markdown-mode
  :hook (markdown-mode . pandoc-mode))
