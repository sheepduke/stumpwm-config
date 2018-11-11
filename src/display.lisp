(in-package :stumpwm)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                              Fonts                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load-module "ttf-fonts")
(xft:cache-font-file "fonts/wqy-MicroHei.ttf")

(handler-case (set-font
               (make-instance 'xft:font
                              :family "WenQuanYi Micro Hei"
                              :subfamily "Regular"
                              :size 12))
  (error () (message "Font not found.")))
