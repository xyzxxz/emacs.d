;;; init-lisp.el --- Emacs lisp settings, and common config for other lisps -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(setq-default debugger-bury-or-kill 'kill)


;; Make C-x C-e run 'eval-region if the region is active
(defun eval-last-sexp-or-region (prefix)
  "Eval region from BEG to END if active, otherwise the last sexp."
  (interactive "P")
  (if (and (mark) (use-region-p))
      (eval-region (min (point) (mark)) (max (point) (mark)))
    (pp-eval-last-sexp prefix)))

(global-set-key [remap eval-expression] 'pp-eval-expression)

(with-eval-after-load 'lisp-mode
  (define-key emacs-lisp-mode-map (kbd "C-x C-e") 'eval-last-sexp-or-region)
  (define-key emacs-lisp-mode-map (kbd "C-c C-e") 'pp-eval-expression))


(defun load-this-file ()
  "Load the current file or buffer.
The current directory is temporarily added to `load-path'.
When there is no current file, eval the current buffer."
  (interactive)
  (let ((load-path (cons default-directory load-path))
	(file (buffer-file-name)))
    (if file
	(progn
	  (save-some-buffers nil (apply-partially 'derived-mode-p 'emacs-lisp-mode))
	  (load-file (buffer-file-name))
	  (message "Loaded %s" file))
      (eval-buffer)
      (message "Evaluated %s" (current-buffer)))))

(with-eval-after-load 'lisp-mode
  (define-key emacs-lisp-mode-map (kbd "C-c C-l") 'load-this-file))


(provide 'lang-lisp)
;;; init-lisp.el ends here
