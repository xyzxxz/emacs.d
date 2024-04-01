(use-package eglot
  :ensure t
  :init (setq completion-category-overrides '((eglot (styles orderless))))
  :commands eglot
  :general
  (:keymaps 'eglot-mode-map :states 'normal
   "gd" 'xref-find-definitions
   "gr" 'xref-find-references
   "K"  'eldoc-doc-buffer))

(use-package consult-eglot
  :ensure t
  :after eglot)
