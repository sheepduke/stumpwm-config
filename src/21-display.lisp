(in-package :stumpwm)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                              Fonts                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load-module "ttf-fonts")

(xft:cache-font-file
 (merge-pathnames "fonts/wqy-MicroHei.ttf"
                  +root-dir+))

(handler-case (set-font
               (make-instance 'xft:font
                              :family "WenQuanYi Micro Hei"
                              :subfamily "Regular"
                              :size 14))
  (error () (message "Font not found.")))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                            Date/Time                             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setf *time-format-string-default* "%Y-%m-%d %H:%M:%S")
