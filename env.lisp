;; env
;;
;; Set environment variables.

(in-package :stumpwm)

(setf (getenv "XIM") "ibus")
(setf (getenv "XIM_PROGRAM") "ibus")
(setf (getenv "XMODIFIERS") "@im=ibus")
(setf (getenv "GTK_IM_MODULE") "ibus")
(setf (getenv "QT_IM_MODULE") "ibus")
(setf (getenv "LC_CTYPE") "zh_CN.UTF-8")

(defvar *screenshot-dir*
  (uiop:merge-pathnames* "pictures/screenshots/" (user-homedir-pathname))
  "Directory of screenshots")
