(require 'init-func)

(defun load-default-modules ()
  "Load default modules."
  (dolist (module xyz-default-modules)
    (xyz/load-module module)))
  
  
