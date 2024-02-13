;;; init-dired.el --- Dired customisations -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package dired
  :ensure nil
  :config
  (setq dired-dwim-target t
	      dired-hide-details-hide-symlink-targets nil
	      dired-auto-revert-buffer #'dired-buffer-stale-p
	      dired-recursive-copies 'always
	      dired-recursive-deletes 'always)
  (when (or (memq system-type '(gnu gnu/linux))
	    (string= (file-name-nondirectory insert-directory-program) "gls"))
    (setq dired-listing-switches
	        (concat dired-listing-switches " -- group-directories-first -v"))))

(use-package dired-quick-sort)

(use-package dired-x
  :defer nil
  :commands dired-kill-buffer-jump
  :bind (("C-c f j" . dired-jump)
	 ("C-x C-j" . dired-jump)
	 ("C-x C-j" . dired-jump))
  :init
  (add-hook 'dired-mode-hook #'dired-omit-mode)
  :after dired
  :config
  (setq dired-omit-verbose nil))

(use-package diredfl
  :hook (dired-mode . diredfl-mode))

(use-package nerd-icons-dired
  :diminish
  :hook (dired-mode . nerd-icons-dired-mode))

(use-package ranger
  :after dired
  :init (setq ranger-override-dired t)
  :config
  (setq ranger-cleanup-on-disable t
	ranger-deer-show-details t
	ranger-max-preview-size 10
	ranger-show-literal nil
	ranger-hide-cursor nil))

(provide 'init-dired)
;;; init-dired.el ends here
