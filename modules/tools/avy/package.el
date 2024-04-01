(use-package avy
  :init
  (defun xyz/avy-action-insert-newline (pt)
    (save-excursion
      (goto-char pt)
      (newline))
    (select-window
     (cdr
      (ring-ref avy-ring 0))))

  (defun xyz/avy-action-kill-whole-line (pt)
    (save-excursion
      (goto-char pt)
      (newline))
    (select-window
     (cdr
      (ring-ref avy-ring 0))))
  :config
  (setf (alist-get ?i avy-dispatch-alist) 'xyz/avy-action-insert-newline
        (alist-get ?K avy-dispatch-alist) 'xyz/avy-action-kill-whole-line))

