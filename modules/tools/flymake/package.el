(use-package flymake
  :ensure t
  :pretty-hydra
  ((:title "flymake command" :color teal :quit-key "q")
   ("Command"
    (("cf" consult-flymake "consult flymake")
     ("fm" flymake-mode "toggle flymake"))))
  :bind ("SPC" . flymake-hydra/pretty-body)
  :hook
  (TeX-mode . flymake-mode) ;; this is now working
  (emacs-lisp-mode . flymake-mode)
  :custom
  (flymake-no-changes-timeout nil))
