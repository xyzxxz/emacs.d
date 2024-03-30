(use-package cc-mode
  :ensure t
  :defer t
  :init
  (setq-default c-basic-offset 4))

(use-package ccls
  :ensure t
  :defer t)

(use-package clang-format
  :ensure nil
  :defer t)

