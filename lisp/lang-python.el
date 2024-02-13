;;; init-python.el --- Python editing -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package python
  :ensure nil
  :config
  (setq python-indent-guess-indent-offset-verbose nil)
  (when (and (executable-find "python")
	     (string= python-shell-interpreter "python"))
    (setq python-shell-interpreter "python3"))

  (with-eval-after-load 'exec-path-from-shell
    (exec-path-from-shell-copy-env "PYTHONPATH")))

(use-package anaconda-mode
  :defer t
  :hook (python-mode . anaconda-mode)
  :init
  (setq anaconda-mode-installation-directory (concat user-emacs-directory "../../../anaconda3/")
	      anaconda-mode-eldoc-as-single-line t)
  :config
  (eval-after-load "company"
    '(add-to-list 'company-backends 'company-anaconda))
  (add-hook 'anaconda-mode-hook #'anaconda-eldoc-mode))

(use-package pipenv
  :hook (python-mode . pipenv-mode)
  :init (setq pipenv-with-projectile nil))

;; (use-package conda
;;   :after python
;;   :config
;;   (setq conda-anaconda-home (concat user-emacs-directory "../../../anaconda3/"))
;;   (conda-env-initialize-interactive-shells)
;;   (with-eval-after-load 'eshell
;;     (conda-env-initialize-eshell))
;;   (add-to-list 'global-mode-string
;; 	       '(conda-env-current-name (" conda:" conda-env-current-name " "))
;; 	       'append))

(use-package poetry
  :after python
  :init
  (setq poetry-tracking-strategy 'switch-buffer)
  (add-hook 'python-mode-hook #'poetry-tracking-mode))

(provide 'lang-python)
;;; init-python.el ends here
