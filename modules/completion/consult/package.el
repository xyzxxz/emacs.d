(use-package consult
  :ensure t
  :bind (([remap switch-to-buffer] . consult-buffer)
         ([remap switch-to-buffer-other-window] . consult-buffer-other-window)
         ([remap switch-to-buffer-other-frame] . consult-buffer-other-frame)
         ([remap goto-line] . consult-goto-line)
         ([remap Info-search] . consult-info)
         ([remap isearch-forward] . consult-line)
         ("C-c c t" . consult-theme))
  :hook (completion-list-mode . consult-preview-at-point-mode)
  :init
  (setq register-preview-delay 0.5
        register-preview-function #'consult-register-format)
  (advice-add #'register-preview :override #'consult-register-window)
  :config
  (setq consult-preview-key '("M-." "C-SPC"))
  (setq consult-line-start-from-top nil
        consult-narrow-key "<"
        read-buffer-completion-ignore-case t
        read-file-name-completion-ignore-case t
        completion-ignore-case t))
