;;; init-flymake.el --- Configure Flymake global behaviour -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(with-eval-after-load 'flymake
  (add-hook 'flymake-mode-hook
	    (lambda ()
	      (add-hook 'eldoc-documentation-function
			'flymake-eldoc-function nil t))))

(provide 'init-flymake)
;;; init-flymake.el ends here
