(use-package js2-mode
  :ensure t
  :mode "\\.\\js'" 
  :config
  (setq-default js-indent-level 2)
  (setq-default js2-bounce-indent-p nil
                js2-mode-show-parse-errors t
                js2-mode-show-strict-warnings t
                js2-ignored-warnings '("msg.extra.trailing.comma"))
  (when (derived-mode-p 'js-mode)
    (js2-minor-mode 1))
  (js2-imenu-extras-setup))

(add-to-list 'interpreter-mode-alist (cons "node" 'js2-mode))

(require 'derived)

(use-package npm-mode
  :ensure nil
  :defer t
  :init
  (add-hook 'js2-mode-hook #'npm-mode))

(use-package js-doc
  :ensure t
  :defer t)

(use-package js2-refactor
  :ensure t
  :defer t
  :config
  (add-hook 'js2-mode-hook 'js2-refactor-mode))

(use-package prettier-js
  :ensure t
  :config
  (add-hook 'js2-mode-hook 'prettier-js-mode))
