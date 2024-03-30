(use-package json-mode
  :ensure t
  :defer t
  :config
  (progn
    (setf json-reformat:pretty-string? t
          json-reformat:indent-width 4)))

(use-package json-reformat
  :ensure t
  :defer t
  :bind
  (("C-c x j" . json-reformat-region)))
