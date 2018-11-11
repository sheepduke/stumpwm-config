;; .stumpwmrc
;; 
;; Author: YUE Daian, David Bjergaard <dbjergaard@gmail.com>
;;
;;
(in-package :stumpwm)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                              Util                                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun conf-dir ()
  (merge-pathnames ".stumpwm.d/"
                   (user-homedir-pathname)))

(defun quicklisp-dir ()
  (merge-pathnames "quicklisp/"
                   (conf-dir)))

(defun conf-file-path (filename)
  (merge-pathnames (str:concat "src/" filename)
                   (conf-dir)))

(defun load-file (filename)
  (load (conf-file-path filename)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                             Loader                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Load modules.
(load-module "screenshot")

;; Load configuration files.
(load-file "global.lisp")
(load-file "startup.lisp")
(load-file "function.lisp")
(load-file "binding.lisp")
(load-file "hook.lisp")
(load-file "window.lisp")
(load-file "screenshot.lisp")
(load-file "display.lisp")
