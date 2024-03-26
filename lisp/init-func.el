;;; init-func.el ---  configure load event -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'init-config)

(defvar xyz-temp nil)

(defun xyz/init-modules ()
  "Init variable xyz-modules."
  (dolist (cate (directory-files xyz-module-directory t directory-files-no-dot-files-regexp))
    (dolist (m (directory-files cate t directory-files-no-dot-files-regexp))
      (let (module)
        (setq module (list m (file-name-nondirectory m)))
        (add-to-list 'xyz-modules module)))))


(defun xyz/get-module (module-name)
  (interactive)
  (setq res nil)
  (dolist (module xyz-modules)
    (if (string= module-name (car (cdr module)))
      (setq res module)))
  res)
               
(defun xyz/load-module (module-name)
  (interactive)
  (dolist (module xyz-modules)
    (if (string= module-name (car (cdr module)))
      (let ((module-path (car module)))
        (load-file (concat module-path "/config.el"))
        (load-file (concat module-path "/func.el"))
        (load-file (concat module-path "/package.el"))
        (add-to-list 'xyz-used-modules module-name)))))


;;(defun load-module (module)
;;  (interactive)
;;  (let ((module-path (car module))
;;        (module-name (car (cdr module))))
;;    (setq xyz-temp module-name)
;;    (load-file (concat module-path "/config.el"))
;;    (load-file (concat module-path "/func.el"))
;;    (load-file (concat module-path "/package.el"))
;;    (add-to-list 'xyz-used-modules module-name)))


(defun show-used-modules ()
  )

(defun show-used-packages ()
  )
(provide 'init-func)
;;; init-func.el ends here
