(in-package :stumpwm)

;; Install or setup quicklisp.
#-quicklisp
(let ((quicklisp-setup (conf-file-path "quicklisp/setup.lisp")))
  (if (probe-file quicklisp-setup)
      (load-file quicklisp-setup)
      (load-file "quicklisp-install.lisp")))

;; Start swank server.
(ql:quickload :swank)
(swank-loader:init)
(swank-create-server :dont-close t)
