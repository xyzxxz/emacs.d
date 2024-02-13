;;; init-git.el --- config git -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package magit
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

(use-package evil-magit
  :after magit)

(use-package forge)

(provide 'init-git)
;;; init-git.el ends here
