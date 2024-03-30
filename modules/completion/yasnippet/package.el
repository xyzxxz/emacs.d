(use-package yasnippet
  :ensure t
  :config
  (add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets/")
  (yas-global-mode 1))

(use-package yasnippet-snippets
  :ensure nil)
