;;; lang-json.el --- JSON file configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package json-mode
  :ensure t 
  :defer t
  :config
  (progn
    (setf json-reformat:pretty-string? t
	  json-reformat:indent-width 4)

    (add-hook 'json-mode-hook
	      (lambda ()
		(setq-local js-indent-level 4)))))

(use-package json-reformat
  :ensure t
  :defer t
  :bind
  (("C-c x j" . json-reformat-region)))

(provide 'lang-json)
;;; lang-json.el ends here
	 
