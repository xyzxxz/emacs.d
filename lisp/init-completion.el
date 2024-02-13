;;; init-completion.el --- Configure company -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package emacs
  :init
  (setq completion-cycle-threshold 3)
  (setq tab-always-indent 'complete))

(use-package orderless
  :ensure t 
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion))))
  (orderless-component-separator #'orderless-escapable-split-on-space))

(use-package vertico
  :hook (after-init . vertico-mode))

;(use-package vertico-posframe
;  :hook (vertico-mode . vertico-posframe-mode)
;  :init (setq vertico-posframe-poshandler
;	      #'posframe-poshandler-frame-center-near-bottom
;	      vertico-posframe-parameters
;	      '((left-fringe . 8)
;		(right-fringe . 8))))

(use-package nerd-icons-completion
  :hook (vertico-mode . nerd-icons-completion-mode))

(use-package marginalia
  :hook (after-init . marginalia-mode))

(use-package consult
  :bind (("C-c M-x" . consult-mode-command)
	 ("C-c h"   . consult-history)
	 ("C-c m"   . consult-man)
	 ("C-c i"   . consult-info)
	 ("C-c t"   . consult-theme)
	 ("C-c c e" . consult-colors-emacs)
	 ([remap Info-search] . consult-info)
	 ([remap imenu] . consult-imenu)
	 ([remap isearch-forward] . consult-line)
	 ([remap recentf-open-files] . consult-recent-file)
	 ("C-x b"   . consult-buffer)

	 :map minibuffer-local-map
	 ("C-s" . (lambda ()
		    "Insert the selected region or current symbol at point."
		    (interactive)
		    (insert (with-current-buffer
				(window-buffer (minibuffer-selected-window))
			      (or (and transient-mark-mode mark-active (/= (point) (mark))
				       (buffer-substring-no-properties (point) (mark)))
				  (thing-at-point 'symbol t)
				  ""))))))
  :hook (completion-list-mode . consult-preview-at-point-mode)
  :init
  (setq register-preview-delay 0.5
	register-preview-function #'consult-register-format)
  (advice-add #'register-preview :override #'consult-register-window)
  (with-eval-after-load 'xref
    (setq xref-show-xrefs-function #'consult-xref
	  xref-show-definitions-function #'consult-xref))
  (autoload 'list-colors-duplicates "facemenu")
  (autoload 'consult--read "consult"))

(use-package consult-yasnippet)

(use-package embark)

(use-package embark-consult)

(use-package corfu
  :custom
  (corfu-auto t)
  (corfu-auto-prefix 2)
  (corfu-preview-current nil)
  (corfu-auto-delay 0.2)
  (corfu-popupinfo-delay '(0.4 . 0.2))
  :custom-face
  (corfu-border ((t (:inherit region :background "gray"))))
  :hook ((after-init . global-corfu-mode)
	 (global-corfu-mode . corfu-popupinfo-mode)))

(use-package nerd-icons-corfu
  :after corfu
  :init
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(use-package yasnippet
  :ensure t
  :defer t
  :diminish (yas-minor-mode . " Y")
  :init
  (setq yas-snippet-dirs '("D:/xyzxxz/emacs.d/snippets")))


(provide 'init-completion)
;;; init-completion.el ends here
