;;; init-org.el --- Org-mode config -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package org
  :ensure nil
  :init
  (setq org-startup-with-inline-images t
	org-latex-prefer-use-labels t
	org-image-actual-width nil
	org-src-fontify-natively t
	org-src-tab-acts-natively t 
	org-imenu-depth 8)
  :config
  (setq org-ellipsis " ▾")
  ;; yasnippet and org-mode compatibility issues
  (add-hook 'org-mode-hook
	    (lambda ()
	      (setq-local yas/trigger-key [tab])
	      (define-key yas/keymap [tab] 'yas/next-field-or-maybe-expand))))

(use-package org-mime
  :defer t)

(use-package org-modern
  :defer t
  :init
  (add-hook 'org-mode-hook 'org-modern-mode))

(use-package org-cliplink
  :defer t )

(use-package org-rich-yank
  :ensure t
  :demand t)

(use-package org-journal
  :defer t
  :commands (org-journal-new-entry org-journal-search-forever))

;; (use-package org-roam
;;   :defer t
;;   :diminish
;;   :bind (("C-c n l" . org-roam-buffer-toggle
;;           "C-c n f" . org-roam-node-find
;;           "C-c n g" . org-roam-graph
;;           "C-c n i" . org-roam-node-insert)))

;; (use-package org-roam-ui
;;   :after org-roam
;;   :bind ("C-c n u" . org-roam-ui-mode)
;;   :config
;;   (setq org-roam-ui-sync-theme t
;;         org-roam-ui-follow t
;;         org-roam-ui-update-on-save t
;;         org-roam-ui-open-on-start t ))

(provide 'lang-org)
;;; init-org.el ends here
