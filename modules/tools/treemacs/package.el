(use-package treemacs
  :ensure t
  :defer t
  :bind (("M-0"     . treemacs-select-window)
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
  :ensure t
  :demand t
  :config
  (treemacs-load-theme "nerd-icons"))

(use-package treemacs-magit
  :ensure nil
  :after treemacs magit
  :defer t
  :hook ((magit-post-commit
          git-commit-post-finish
          magit-post-stage
          magit-post-unstage)
          . treemacs-magit--schedule-update))

(use-package treemacs-tab-bar
  :ensure t
  :demand t
  :config
  (treemacs-set-scope-type 'Tabs))
