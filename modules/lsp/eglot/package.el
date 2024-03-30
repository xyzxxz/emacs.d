(use-package eglot
  :ensure t
  :init (setq completion-category-overrides '((eglot (styles orderless))))
  :commands eglot)

(use-package consult-eglot
  :ensure t
  :after eglot)
