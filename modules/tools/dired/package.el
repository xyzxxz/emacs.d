(setq-default dired-dwim-target t)

;; Prefer g-prefixed coreutils version of standard utilities when available
(let ((gls (executable-find "gls")))
  (when gls (setq insert-directory-program gls)))

(use-package diredfl
  :after dired
  :config
  (diredfl-global-mode)
  (require 'dired-x))

;; Hook up dired-x global bindings without loading it up-front
(define-key ctl-x-map "\C-j" 'dired-jump)
(define-key ctl-x-4-map "\C-j" 'dired-jump-other-window)

(with-eval-after-load 'dired
  (setq dired-recursive-deletes 'top))

(use-package dired
  :straight (:type built-in)
  :general
  (:keymaps 'dired-mode-map :states 'normal
            "q" 'quit-window
            "j" 'dired-next-line
            "k" 'dired-previous-line
            )
  :hook
  (dired-mode . dired-hide-details-mode))

(use-package nerd-icons-dired
  :ensure t
  :diminish
  :hook (dired-mode . nerd-icons-dired-mode))

(use-package ranger
  :ensure t
  :after dired
  :init (setq ranger-override-dired t)
  :config
  (setq ranger-cleanup-on-disable t
	ranger-deer-show-details t
	ranger-max-preview-size 10
	ranger-show-literal nil
	ranger-hide-cursor nil))


(use-package dired-hide-dotfiles
  :ensure t
  :hook (dired-mode . dired-hide-dotfiles-mode))
