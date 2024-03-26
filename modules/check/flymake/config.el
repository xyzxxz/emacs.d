(with-eval-after-load 'flymake
  (add-hook 'flymake-mode-hook
	    (lambda ()
	      (add-hook 'eldoc-documentation-function
			'flymake-eldoc-function nil t))))