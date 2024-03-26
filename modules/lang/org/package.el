(use-package org-cliplink)

(define-key global-map (kbd "C-c l") 'org-store-link)
(define-key global-map (kbd "C-c a") 'org-agenda)

(setq org-log-done t
      org-catch-invisible-edits 'show
      org-export-coding-system 'utf-8 
      org-html-validation-link nil
      org-export-kill-product-buffer-when-displayed t
      org-tags-column 80)

;; Re-align tags when window shape changes
(with-eval-after-load 'org-agenda
  (add-hook 'org-agenda-mode-hook
            (lambda ()
              (add-hook 'window-configuration-change-hook
                        'org-agenda-align-tags nil t))))

(use-package writeroom-mode)

(setq org-support-shift-select t)

(global-set-key (kbd "C-c c") 'org-capture)

(setq org-refile-use-cache nil)

;; Targets include this file and any file contributing to the agenda - up to 5 levels deep
(setq org-refile-targets '((nil :maxlevel . 5) (org-agenda-files :maxlevel . 5)))

(with-eval-after-load 'org-agenda
  (add-to-list 'org-agenda-after-show-hook 'org-show-entry))

(advice-add 'org-refile :after (lambda (&rest _) (org-save-all-org-buffers)))

;; Targets start with the file name - allows creating level 1 tasks
;;(setq org-refile-use-outline-path (quote file))
(setq org-refile-use-outline-path t)
(setq org-outline-path-complete-in-steps nil)

;; Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes 'confirm)


(setq-default org-agenda-clockreport-parameter-plist '(:link t :maxlevel 3))

(add-hook 'org-agenda-mode-hook 'hl-line-mode)

;;; Org clock

;; Save the running clock and all clock history when exiting Emacs, load it on startup
(with-eval-after-load 'org
  (org-clock-persistence-insinuate))
(setq org-clock-persist t)
(setq org-clock-in-resume t)

;; Save clock data and notes in the LOGBOOK drawer
(setq org-clock-into-drawer t)
;; Save state changes in the LOGBOOK drawer
(setq org-log-into-drawer t)
;; Removes clocked tasks with 0:00 duration
(setq org-clock-out-remove-zero-time-clocks t)

;; Show clock sums as hours and minutes, not "n days" etc.
(setq org-time-clocksum-format
      '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t))

(with-eval-after-load 'org-clock
  (define-key org-clock-mode-line-map [header-line mouse-2] 'org-clock-goto)
  (define-key org-clock-mode-line-map [header-line mouse-1] 'org-clock-menu))

(use-package org-pomodoro
  :after org-agenda
  :config
  (setq org-pomodoro-keep-killed-pomodoro-time t)
  (define-key org-agenda-mode-map (kbd "P") 'org-pomodoro))

;; Prettify UI
(use-package org-modern
  :hook ((org-mode . org-modern-mode)
         (org-agenda-finalize . org-modern-agenda)))

;; Preview
(require 'org-auctex)

(use-package org-preview-html
  :diminish
  :bind (:map org-mode-map
              ("C-c C-h" . org-preview-html-mode)))

(use-package org-tree-slide
  :diminish
  :functions (org-display-inline-images
              org-remove-inline-images)
  :init
  (setq org-tree-slide-header nil
        org-tree-slide-slide-in-effect t
        org-tree-slide-heading-emphasis nil
        org-tree-slide-cursor-init t
        org-tree-slide-modeline-display 'outside
        org-tree-slide-skip-done nil
        org-tree-slide-skip-comments t
        org-tree-slide-skip-outline-level 3))

;; Roam
(use-package org-roam)

(use-package org-roam-ui
  :bind ("C-c n u" . org-roam-ui-mode))