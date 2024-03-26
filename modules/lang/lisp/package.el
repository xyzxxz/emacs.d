(setq-default debugger-bury-or-kill 'kill)

(use-package elisp-slime-nav)

(dolist (hook '(emacs-lisp-mode-hook ielm-mode-hook))
  (add-hook hook 'elisp-slime-nav-mode))
(add-hook 'emacs-lisp-mode-hook (lambda () (setq mode-name "ELisp")))

(setq-default initial-scratch-message
              (concat ";; Happy hacking, " user-login-name " - Emacs ♥ you!\n\n"))

(use-package ipretty
  :config
  (add-hook 'after-init-hook 'ipretty-mode))

(setq load-prefer-newer t)

(use-package immortal-scratch
  :config
  (add-hook 'after-init-hook 'immortal-scratch-mode))

(require 'derived)

(use-package macrostep
  :config
  (with-eval-after-load 'lisp-mode
    (define-key emacs-lisp-mode-map (kbd "C-c x") 'macrostep-expand)))

;; A quick way to jump to the definition of a function given its key binding
(global-set-key (kbd "C-h K") 'find-function-on-key)

(use-package rainbow-mode
  :config
  (add-hook 'help-mode-hook 'rainbow-mode))

(use-package highlight-quoted
  :config
  (add-hook 'emacs-lisp-mode-hook 'highlight-quoted-mode))

(use-package cl-libify)

(use-package cask-mode)
