(use-package ibuffer-vc
  :config
  (add-hook 'ibuffer-hook (lambda ()
			    (ibuffer-vc-set-filter-groups-by-vc-root)
			    (unless (eq ibuffer-sorting-mode 'filename/process)
			      (ibuffer-do-sort-by-filename/process)))))

(setq-default ibuffer-show-empty-filter-groups nil)

(with-eval-after-load 'ibuffer
  (define-ibuffer-column size-h
    (:name "Size" :inline t)
    (file-size-human-readable (buffer-size))))

;; Modify the default ibuffer-formats
(setq ibuffer-formats
      '((mark modified read-only vc-status-mini " "
	      (name 22 22 :left :elide)
	      " "
	      (size-h 9 -1 :right)
	      " "
	      (mode 12 12 :left :elide)
	      " "
	      vc-relative-file)
	(mark modified read-only vc-status-mini " "
	      (name 22 22 :left :elide)
	      " "
	      (size-h 9 -1 :right)
	      " "
	      (mode 14 14 :left :elide)
	      " "
	      (vc-status 12 12 :left)
	      " "
	      vc-relative-file)))

(setq ibuffer-filter-group-name-face 'font-lock-doc-face)

(global-set-key (kbd "C-x C-b") 'ibuffer)