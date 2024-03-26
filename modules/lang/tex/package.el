(use-package tex-site
  :ensure auctex)

(use-package tex
  :ensure auctex
  :defer t
  :config
  (setq TeX-parse-self t
        TeX-auto-save t
        TeX-clean-confirm nil)
  (setq-default TeX-master nil
                TeX-engine 'xelatex
                TeX-PDF-mode t))

(use-package tex-mode
  :ensure auctex
  :defer t)

(use-package latex
  :ensure auctex
  :defer t
  :config
  (add-hook 'LaTeX-mode-hook #'LaTeX-math-mode))

(use-package auctex
  :defer t
  :init
  (setq TeX-auto-save t
        TeX-parse-self t
        TeX-source-corrlate-start-server nil
        LaTeX-fill-break-at-separators nil)
  (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
  (add-hook 'LaTeX-mode-hook 'TeX-source-corrlate-mode)
  (add-hook 'LaTeX-mode-hook 'TeX-PDF-mode))

(use-package auctex-latexmk
  :ensure t
  :defer t
  :after latex
  :config (auctex-latexmk-setup))

(use-package bibtex
  :defer t
  :config
  (add-hook 'bibtex-mode-hook (lambda () (run-hooks 'prog-mode-hook)))
  (bibtex-set-dialect 'biblatex))
