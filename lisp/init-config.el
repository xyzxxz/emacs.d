;;; init-config.el --- xyz emacs init config file -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defgroup xyz nil
  "Xyzxxz customizations."
  :group 'emacs
  :prefix 'xyz-)

;; ~/.emacs.d
(defconst xyz-start-directory
  (concat (file-name-directory (or load-file-name buffer-file-name)) "../"))

;; load env file
(defconst xyz-env-file
  "~/.emacs.d/.xyz.env")

;; config modules
;; ~/.emacs.d/modules
(defconst xyz-module-directory
  "~/.emacs.d/modules/")

(defvar xyz-modules '())

(defvar xyz-used-modules '()
  "A non-sorted list of used modules.")

(defvar xyz-used-packages '()
  "A list of used packages.")

;; Font config
(defconst xyz-default-font "Hack Nerd Font-14")

(provide 'init-config)
;;; init-config.el ends here
