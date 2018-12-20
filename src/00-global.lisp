;; env
;;
;; Set environment variables.

(in-package :stumpwm)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                           Environment                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setf (getenv "XIM") "ibus")
(setf (getenv "XIM_PROGRAM") "ibus")
(setf (getenv "XMODIFIERS") "@im=ibus")
(setf (getenv "GTK_IM_MODULE") "ibus")
(setf (getenv "QT_IM_MODULE") "ibus")
(setf (getenv "LC_CTYPE") "zh_CN.UTF-8")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                              Global                              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter +screenshot-dir+
  (uiop:merge-pathnames* "pictures/screenshots/" (user-homedir-pathname))
  "Directory of screenshots")

(defparameter *rule-file*
  (merge-pathnames "window-rules" (uiop:temporary-directory)))
