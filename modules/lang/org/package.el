(use-package org
  :straight (:type built-in)
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


  (setq org-adapt-indentation nil)
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
  :ensure t
  :after org
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(use-package org-cliplink
  :ensure t
  :after org)

(use-package writeroom-mode
  :ensure t)

(use-package org-barin
  :ensure t)

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
