(use-package modus-themes
  :ensure t
  :config
  (setq modus-themes-italic-constructs t
        modus-themes-bold-constructs t
        modus-themes-mixed-fonts t
        modus-themes-headings '((1 . (1.5))
                                (2 . (1.3))
                                (t . (1.1))))
  :init
  (load-theme 'modus-vivendi-deuteranopia :no-confirm))

