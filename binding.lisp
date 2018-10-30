(in-package :stumpwm)

;; Run or raise some applications.
(define-key *root-map* (kbd "f") "exec firefox")
(define-key *root-map* (kbd "C-f") "firefox")
(define-key *root-map* (kbd "u") "exec urxvt")
(define-key *root-map* (kbd "C-u") "urxvt")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                               Focus                              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-key *top-map* (kbd "s-h") "move-focus left")
(define-key *top-map* (kbd "s-l") "move-focus right")
(define-key *top-map* (kbd "s-p") "move-focus up")
(define-key *top-map* (kbd "s-n") "move-focus down")


(define-key *top-map* (kbd "s-f") "fullscreen")
(define-key *top-map* (kbd "C-s-l") "exec slock")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                             Volume                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-key *top-map* (kbd "s-Up") "volume-set 10")
(define-key *top-map* (kbd "s-Down") "volume-set -10")
(define-key *top-map* (kbd "s-Left") "volume-set -2")
(define-key *top-map* (kbd "s-Right") "volume-set 2")
