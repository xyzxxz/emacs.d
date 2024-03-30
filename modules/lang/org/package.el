(use-package org
  :init
  (setq org-auto-align-tags nil
            org-tags-column 0
            org-catch-invisible-edits 'show-and-error
            org-special-ctrl-a/e t ;; special navigation behaviour in headlines
            org-insert-heading-respect-content t)

  ;; styling, hide markup, etc.
  (setq org-hide-emphasis-markers t
            org-src-fontify-natively t ;; fontify source blocks natively
            org-highlight-latex-and-related '(native) ;; fontify latex blocks natively
            org-pretty-entities t
            org-ellipsis "…")

  ;; agenda styling
  (setq org-agenda-tags-column 0
            org-agenda-block-separator ?─
            org-agenda-time-grid
            '((daily today require-timed)
              (800 1000 1200 1400 1600 1800 2000)
              " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
            org-agenda-current-time-string
            "⭠ now ─────────────────────────────────────────────────")

  ;; todo setup
  (setq org-todo-keywords
            ;; it's extremely useful to distinguish between short-term goals and long-term projects
            '((sequence "TODO(t)" "SOMEDAY(s)" "|" "DONE(d)")
              (sequence "TO-READ(r)" "READING(R)" "|" "HAVE-READ(d)")
              (sequence "PROJ(p)" "|" "COMPLETED(c)")))


  (setq org-adapt-indentation nil) ;; interacts poorly with 'evil-open-below')
  :general
  (xyz/local-leader-keys
        :keymaps 'org-mode-map
        "a" '(org-archive-subtree :wk "archive")
        "l" '(:ignore t :wk "link")
        "ll" '(org-insert-link t :wk "link")
        "lp" '(org-latex-preview t :wk "prev latex")
        "h" '(consult-org-heading :wk "consult heading")
        "d" '(org-cut-special :wk "org cut special")
        "y" '(org-copy-special :wk "org copy special")
        "p" '(org-paste-special :wk "org paste special")
        "b" '(:keymap org-babel-map :wk "babel")
        "t" '(org-todo :wk "todo")
        "s" '(org-insert-structure-template :wk "template")
        "e" '(org-edit-special :wk "edit")
        "i" '(:ignore t :wk "insert")
        "ih" '(org-insert-heading :wk "insert heading")
        "is" '(org-insert-subheading :wk "insert heading")
        "f" '(org-footnote-action :wk "footnote action")
        ">" '(org-demote-subtree :wk "demote subtree")
        "<" '(org-promote-subtree :wk "demote subtree"))
  (:keymaps 'org-agenda-mode-map
                "j" '(org-agenda-next-line)
                "h" '(org-agenda-previous-line)))

(use-package evil-org
  :after org
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(use-package org-cliplink
  :ensure t
  :after org
  :general
  (xyz/local-leader-keys
    :keymaps 'org-mode-map
    "lc" '(org-cliplink :wk "cliplink")))

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

(use-package writeroom-mode
  :ensure t)

(use-package org-barin
  :ensure t)

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
  :ensure t
  :after org-agenda
  :defer t 
  :config
  (setq org-pomodoro-keep-killed-pomodoro-time t)
  (define-key org-agenda-mode-map (kbd "P") 'org-pomodoro))

;; Prettify UI
(use-package org-modern
  :ensure t
  :config
  (setq org-modern-keyword nil
        org-modern-table nil)
  (global-org-modern-mode))

;; Preview
(use-package org-auctex
  :hook
  (org-mode . org-auctex-mode))

(use-package org-fragtog
  :load-path "site-lisp/"
  :after org
  :hook (org-mode . org-fragtog-mode)
  :config
  (setq org-startup-with-latex-preview t))

(setq-default line-spacing 3)

(use-package org-preview-html
  :ensure nil
  :diminish
  :bind (:map org-mode-map
              ("C-c C-h" . org-preview-html-mode)))

(use-package org-tree-slide
  :ensure nil
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
(use-package org-roam
  :ensure t
  :general
  (xyz/leader-keys
    "nr" '(:ignore t :wk "roam")
    "nri" '(org-roam-node-insert t :wk "insert node")
    "nrt" '(org-roam-buffer-toggle t :wk "roam buffer toggle")
    "nrc" '(org-roam-capture t :wk "roam capture")
    "nrf" '(org-roam-node-find :wk "find node")
    "nrd" '(:ignore t :wk "dailies")
    "nrdt" '(org-roam-dailies-goto-today :wk "today")
    "nrdt" '(org-roam-dailies-goto-yesterday :wk "today")
    "nrdT" '(org-roam-dailies-goto-tomorrow :wk "today")
    "nrdd" '(org-roam-dailies-goto-date :wk "goto date"))
  :config
  (setq org-roam-completion-everywhere t))

(use-package org-roam-ui
  :ensure t
  :bind ("C-c n u" . org-roam-ui-mode))
