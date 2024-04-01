(use-package helpful
  :ensure t
  :general
  (xyz/leader-keys
    "hc" '(helpful-command :wk "helpful command")
    "hf" '(helpful-callable :wk "helpful callable")
    "hh" '(helpful-at-point :wk "helpful at point")
    "hF" '(helpful-function :wk "helpful function")
    "hv" '(helpful-variable :wk "helpful variable")
    "hk" '(helpful-key :wk "helpful key")))
