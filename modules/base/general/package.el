(use-package general
  :ensure t
  :config
  (general-evil-setup)
  
  (general-create-definer xyz/leader-keys
    :states '(normal insert visual emacs)
    :keymaps 'override
    :prefix "SPC"
    :global-prefix "M-SPC")

  (general-create-definer xyz/local-leader-keys
    :states '(normal insert visual emacs)
    :keymaps 'override
    :prefix ","
    :global-prefix "M-,")

  (general-define-key
   :states 'insert
   "C-g" 'evil-normal-state)

  ;; unbind some annoying default bindings
  (general-unbind
    "C-x C-r"   ;; unbind find file read only
    "C-x C-z"   ;; unbind suspend frame
    "C-x C-d"   ;; unbind list directory
    "<mouse-2>") ;; pasting with mouse wheel click

  (xyz/leader-keys
   "SPC" '(execute-extended-command :wk "execute command")
   "TAB" '(:keymap tab-prefix-map :wk "tab"))

  (xyz/leader-keys
   "h" '(:ignore t :wk "help"))

  ;; file
  (xyz/leader-keys
    "f" '(:ignore t :wk "file")
    "ff" '(find-file :wk "find file") ;; gets overridden by consult
    "fs" '(save-buffer :wk "save file"))

  ;; buffer
  ;; see 'bufler' and 'popper'
  (xyz/leader-keys
    "b" '(:ignore t :wk "buffer")
    "bb" '(switch-to-buffer :wk "switch buffer") ;; gets overridden by consult
    "bk" '(kill-this-buffer :wk "kill this buffer")
    "br" '(revert-buffer :wk "reload buffer")))
