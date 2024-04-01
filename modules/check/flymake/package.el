(use-package flymake
  :straight (:type built-in)
  :general
  (xyz/leader-keys
    :keymaps 'flymake-mode-map
    "cf" '(consult-flymake :wk "consult flymake") ;; depends on consult
    "cc" '(flymake-mode :wk "toggle flymake")) ;; depends on consult
  :hook
  (TeX-mode . flymake-mode) ;; this is now working
  (emacs-lisp-mode . flymake-mode)
  :custom
  (flymake-no-changes-timeout nil)
  :general
  (general-nmap "] !" 'flymake-goto-next-error)
  (general-nmap "[ !" 'flymake-goto-prev-error)
  (general-nmap (kbd "RET") 'flymake-goto-diagnostic))
