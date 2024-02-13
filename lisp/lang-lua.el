;;; init-lua.el --- lua language config -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package lua-mode
  :defer t
  :init
  (setq lua-indent-level 2))

(use-package moonscript
  :defer t)

(provide 'lang-lua)
;;; init-lua.el ends here
