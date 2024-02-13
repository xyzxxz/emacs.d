;;; init-ivy.el --- config ivy -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package helm
  :ensure t
  :bind (("C-x C-f" . helm-find-files)
	 ("C-h SPC" . helm-all-mark-rings))
  :init
  ;; (bind-keys
  ;;  :map helm-map
  ;;  ("C-w" . backward-kill-word)
  ;;  ("M-w" . helm-yank-text-at-point)
  ;;  ("C-z" . helm-select-action)
  ;;  ("C-i" . helm-execute-persistent-action)
  ;;  ("C-j" . helm-maybe-exit-minibuffer)
  ;;  ("C-<return>" . helm-execute-persistent-action))
  ;; (bind-keys
  ;;  :prefix-map help-helm-map
  ;;  :prefix "C-c h"
  ;;  ("a" . helm-apropos)
  ;;  ("b" . helm-buffers-list)
  ;;  )
  (helm-mode 1)
  (with-eval-after-load 'helm-config
    (warn "`helm-config' loaded! Get rid of it ASAP!"))
  :config
  (setq helm-split-window-in-side-p t)
  (setq helm-always-two-windows nil
	helm-truncate-lines t
	helm-full-frame nil
	)
  :diminish helm-mode)

(use-package helm-descbinds
  :ensure t
  :bind ("C-h C-b" . describe-bindings)
  :init
  (helm-descbinds-mode))

(use-package helm-command
  :ensure helm
  :defer t
  :bind
  (([remap execute-extended-command] . helm-M-x)))

(use-package helm-buffers
  :ensure helm
  :defer t
  :bind (([remap switch-to-buffer] . helm-mini))
  :config
  (setq helm-buffers-fuzzy-matching t))

(use-package helm-files
  :ensure helm
  :defer t
  :bind (([remap find-file] . helm-find-files)
	 ("C-c f f" . helm-for-files)
	 ("C-c f r" . helm-recentf))
  :config
  (setq helm-recentf-fuzzy-match t
	helm-ff-file-name-history-use-recentf t
	helm-ff-search-library-in-sexp t)
  )

(use-package helm-swoop
  :ensure t
  :bind (("C-c s s" . helm-swoop)
	 ("C-c s S" . helm-multi-swoop)
	 ("C-c s C-s" . helm-multi-swoop-all)
	 ([remap swoop] . helm-swoop))
  :init
  (bind-keys
   :map isearch-mode-map
   ("<tab>" . helm-swoop-from-isearch)
   ("C-i" . helm-swoop-from-isearch)))
(provide 'init-ivy)
;;; init-ivy.el ends here
