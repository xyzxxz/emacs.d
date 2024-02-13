;;; init-keybindings.el --- config key mappings -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package hydra
  :hook (emacs-lisp-mode . hydra-add-imenu)
  :ensure t
  :init
  (setq hydra-hint-display-type 'posframe))
;  (with-eval-after-load 'posframe
;    (defun hydra-set-posframe-show-params ()
;      "Set hydra-posframe style."
;      (setq hydra-posframe-show-params
;	    `(:left-fringe 8
;	      :right-fringe 8
;	      :internal-border-width 2
;	      :internal-border-color ,(face-background 'posframe-border nil t)
;	      :background-color ,(face-foreground 'tooltip nil t)
;	      :lines-truncate t
;	      :poshandler posframe-poshandler-frame-center-near-bottom)))
;    (hydra-set-posframe-show-params)
;    (add-hook 'after-load-theme-hook #'hydra-set-posframe-show-params t)))

(use-package pretty-hydra
  )

(provide 'init-keybindings)
;;; init-keybindings.el ends here
