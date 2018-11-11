;; binding
;;
;; Key bindings.

(in-package :stumpwm)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                          Applications                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-key *root-map* (kbd "f") "exec firefox")
(define-key *root-map* (kbd "C-f") "firefox")
(define-key *root-map* (kbd "u") "exec urxvt")
(define-key *root-map* (kbd "C-u") "urxvt")
(define-key *top-map* (kbd "C-s-l") "exec slock")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                             Volume                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-key *top-map* (kbd "s-Up") "volume-set 10")
(define-key *top-map* (kbd "s-Down") "volume-set -10")
(define-key *top-map* (kbd "s-Left") "volume-set -2")
(define-key *top-map* (kbd "s-Right") "volume-set 2")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                          Screenshot                              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-key *top-map* (kbd "SunPrint_Screen") "take-screenshot")
(define-key *top-map* (kbd "Sys_Req") "take-screenshot-selection")
