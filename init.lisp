;; .stumpwmrc
;; 
;; Author: YUE Daian, David Bjergaard <dbjergaard@gmail.com>
;;
;;
(in-package :stumpwm)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                              Util                                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *root-dir*
  (merge-pathnames ".stumpwm.d/" (user-homedir-pathname))
  "Directory of StumpWM configuration.")

(defparameter *conf-dir*
  (merge-pathnames "src/" *root-dir*))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                             Loader                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Load modules.
(load-module "screenshot")

;; Load configuration files.
(mapcar #'load
        (uiop:directory-files *conf-dir* "*.lisp"))
