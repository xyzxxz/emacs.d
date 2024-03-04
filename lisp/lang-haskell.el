;;; lang-haskell.el --- Support the Haskell language -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package haskell-mode
  :config
  (add-hook 'haskell-mode-hook 'subword-mode)
  (add-hook 'haskell-cabal-mode 'subword-mode)

  (add-hook 'haskell-mode-hook 'interactive-haskell-mode)

  ;; Indentation
  (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

  ;; Source code helpers
  (add-hook 'haskell-mode-hook 'haskell-auto-insert-module-template)

  (use-package reformatter
    :config
    (reformatter-define hindent
      :program "hindent"
      :lighter " Hin")

    (defalias 'hindent-mode 'hindent-on-save-mode)

    (reformatter-define ormolu
      :program "ormolu"
      :lighter " Orm"))

  (with-eval-after-load 'haskell-mode
    (define-key haskell-mode-map (kbd "C-c h") 'hoogle)
    (define-key haskell-mode-map (kbd "C-o") 'open-line))

  (with-eval-after-load 'page-break-lines
    (add-to-list 'page-break-lines-modes 'haskell-mode)))

(use-package dhall-mode)



(provide 'lang-haskell)
;;; lang-haskell.el ends here
