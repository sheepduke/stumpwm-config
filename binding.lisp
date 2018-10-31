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
;;                              Groups                              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-key *top-map* (kbd "s-1") "gselect 1")
(define-key *top-map* (kbd "s-2") "gselect 2")

(define-key *root-map* (kbd "C-p") "next")
(define-key *root-map* (kbd "C-n") "prev")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                              Windows                             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar *split-map* (make-sparse-keymap))
(define-key *split-map* (kbd "2") "hsplit")
(define-key *split-map* (kbd "3") "vsplit")
(define-key *split-map* (kbd "1") "only")
(define-key *split-map* (kbd "0") "remove-split")

(define-key *root-map* (kbd "s") '*split-map*)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                               Focus                              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-key *top-map* (kbd "s-h") "move-focus left")
(define-key *top-map* (kbd "s-l") "move-focus right")
(define-key *top-map* (kbd "s-p") "move-focus up")
(define-key *top-map* (kbd "s-n") "move-focus down")


(define-key *top-map* (kbd "s-f") "fullscreen")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                             Volume                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-key *top-map* (kbd "s-Up") "volume-set 10")
(define-key *top-map* (kbd "s-Down") "volume-set -10")
(define-key *top-map* (kbd "s-Left") "volume-set -2")
(define-key *top-map* (kbd "s-Right") "volume-set 2")
