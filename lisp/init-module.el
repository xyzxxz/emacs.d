;;; init-module.el --- set major mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(defun cc-mode () )

(defun css-mode () )

(defun elisp-mode () )

(defun go-mode () )

(defun html-mode () )

(defun js-mode () )

(defun json-mode () )

(defun lua-mode () )

(defun latex-mode () )

(defun markdown-mode () )

(defun org-mode ()
  (xyz/load-module "org"))

(defun python-mode () )

(defun react-mode () )

(defun sh-mode () )

(defun toml-mode () )

(defun ts-mode () )

(defun vue-mode () )

(defun yaml-mode () )

(xyz/lazy-module "\\(\\.css\\'\\|\\.less\\'\\|\\.sass\\'\\|\\.scss\\'\\)" css-mode)

(xyz/lazy-module "\\(\\.go\\'\\)" go-mode)

(xyz/lazy-module "\\(\\.html\\'\\|\\.htm\\'\\)" html-mode)

(xyz/lazy-module "\\(\\.js\\'\\)" js-mode)

(xyz/lazy-module "\\(\\.json\\'\\)" json-mode)

(xyz/lazy-module "\\(\\.lua\\'\\)" lua-mode)

(xyz/lazy-module "\\(\\.md\\'\\)" markdown-mode)

(xyz/lazy-module "\\(\\.py\\'\\)" python-mode)

(xyz/lazy-module "\\(\\.jsx\\'\\|\\.tsx\\'\\)" react-mode)

(xyz/lazy-module "\\(\\.sh\\'\\|\\.bash\\'\\|\\.bashrc\\'\\|\\.zsh\\'\\|\\.zshrc\\'\\)" sh-mode)

(xyz/lazy-module "\\(\\.toml\\'\\)" toml-mode)

(xyz/lazy-module "\\(\\.ts\\'\\)" ts-mode)

(xyz/lazy-module "\\(\\.vue\\'\\)" vue-mode)

(xyz/lazy-module "\\(\\.yaml\\'\\|\\.yml\\'\\)" yaml-mode)

(provide 'init-module)
