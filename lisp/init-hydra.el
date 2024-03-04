;;; init-hydra.el -*- lexical-binding: t -*-
;;; Commmentary:
;;; Code:
(use-package hydra
  :hook (emacs-lisp-mode . hydra-add-imenu)
  :init
  (setq hydra-hint-display-type 'posframe)
  (with-eval-after-load 'posframe
    (setq hydra-posframe-show-param
          `(:left-fringe 8
                         :right-fringe 8
                         :internal-border-width 2
                         :internal-border-color ,(face-background 'posframe-border nil t)
                         :background-color ,(face-background 'tooltip nil t)
                         :foreground-color ,(face-foreground 'tooltip nil t)
                         :lines-truncate t
                         :poshandler posframe-poshandler-frame-center-near-bottom))))


(provide 'init-hydra)
;;; init-hydra.el ends here
