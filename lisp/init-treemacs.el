;;; init-treemacs.el --- Initialize treeamcs -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package treemacs
  :bind (("M-0"    . treemacs-select-window)
	 ("C-x t 1" . treeamcs-delete-other-windows) 
	 ("C-x t t" . treemacs)
	 ("C-x t f" . treemacs-find-file)
	 :map treemacs-mode-map
	 ([mouse-1] . treemacs-single-click-expand-action))
  :config
  (setq treemacs-collapse-dirs (if treemacs-python-executable 3 0)
	treemacs-missing-project-action 'remove
	treemacs-sorting 'alphabetic-asc
	treemacs-follow-after-init t
	treemacs-width 40)
  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t))

(use-package treemacs-nerd-icons
  :demand t
  :config
  (treemacs-load-theme "nerd-icons"))

(use-package treemacs-tab-bar
  :demand t
  :config
  (treemacs-set-scope-type 'Tabs))


(provide 'init-treemacs)
;;; init-treemacs.el ends here