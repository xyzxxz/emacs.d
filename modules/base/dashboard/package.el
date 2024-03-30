(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-banner-logo-title "Welcome to Emacs"
        dashboard-startup-banner 'logo
        dashboard-icon-type 'nerd-icons
        dashboard-items '((recents . 7)
                          (agenda . 7))
        dashboard-item-names '(("Recent Files:" . "Recently open files:")
                               ("Agenda for today:". "Today's Agenda:"))
        dashboard-set-file-icons t
        dashboard-set-heading-icons t
        dashboard-set-navigator t
        dashboard-set-footer nil))
