(use-package anaconda-mode
  :ensure nil
  :defer t)

(use-package code-cells
  :ensure nil
  :defer t
  :commands (code-cells-mode)
  :hook (python-mode . code-cells-mode))

(use-package blacken
  :ensure nil
  :defer t)

(use-package pipenv
  :ensure t
  :defer t
  :commands (pipenv-activate
             pipenv-shell
             pipenv-open
             pipenv-install
             pipenv-uninstall))

(use-package poetry
  :ensure t
  :defer t
  :commands (poetry-venv-toggle))

(use-package pip-requirements
  :ensure t
  :defer t)

(use-package py-isort
  :ensure t
  :defer t)

(use-package pydoc
  :ensure t
  :defer t)

(use-package pyenv-mode
  :ensure nil
  :commands (pyenv-mode-versions))

(use-package pyvenv
  :ensure nil
  :defer t
  :init
  (add-hook 'python-mode-hook #'pyvenv-tracking-mode))
