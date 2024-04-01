(use-package dashboard
  :ensure t
  :general
  (xyz/leader-keys :keymaps 'dashboard-mode-map :states 'normal
    "j"  'dashboard-next-line
    "k"  'dashboard-previous-line
    "gj" 'dashboard-next-section
    "gk" 'dashboard-previous-section)
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-banner-logo-title "Welcome to Emacs"
        dashboard-startup-banner 'logo
        dashboard-display-icons-p t
        dashboard-icon-type 'all-the-icons
        dashboard-items '((recents . 7)
                          (project . 7)
                          (agenda  . 7))
        dashboard-item-names '(("Recent Files:" . "Recently open files:")
                               ("Agenda for today:". "Today's Agenda:"))
        dashboard-set-file-icons t
        dashboard-set-heading-icons t
        dashboard-set-navigator t
        dashboard-set-footer nil))
