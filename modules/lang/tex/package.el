(use-package tex
  :ensure auctex
  :defer t
  :config
  (setq TeX-parse-self t
        TeX-auto-save t
        TeX-clean-confirm nil)
  (setq-default TeX-master nil
                TeX-engine 'xelatex
                TeX-PDF-mode t)
  (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

(use-package tex-mode
  :ensure auctex
  :defer t)

(use-package latex
  :ensure auctex
  :defer t
  :general
  (xyz/local-leader-keys
    :keymaps 'LaTeX-mode-map
    ;; "TAB" 'TeX-complete-symbol ;; FIXME let's 'TAB' do autocompletion (but it's kind of useless to be honest)
    "=" '(reftex-toc :wk "reftex toc")
    "(" '(reftex-latex :wk "reftex label")
    ")" '(reftex-reference :wk "reftex ref")
    "m" '(LaTeX-macro :wk "insert macro")
    "s" '(LaTeX-section :wk "insert section header")
    "e" '(LaTeX-environment :wk "insert environment")
    "p" '(preview-at-point :wk "preview at point")
    "f" '(TeX-font :wk "font")
    "c" '(TeX-command-run-all :wk "compile"))
  :config
  (add-hook 'LaTeX-mode-hook #'LaTeX-math-mode))

(use-package auctex
  :no-require t
  :mode ("\\.tex\\'" . LaTeX-mode)
  :defer t
  :init
  (setq TeX-auto-save t
        TeX-parse-self t
        TeX-source-corrlate-start-server nil
        LaTeX-fill-break-at-separators nil)
  (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
  (add-hook 'LaTeX-mode-hook 'TeX-source-corrlate-mode)
  (add-hook 'LaTeX-mode-hook 'TeX-PDF-mode))

(use-package evil-tex
  :hook (LaTeX-mode . evil-tex-mode))

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

(use-package math-symbol-lists
  :ensure t
  :defer t)
