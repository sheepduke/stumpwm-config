(in-package :stumpwm)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                              Groups                              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Create 9 more groups.
(dotimes (i 9)
  (run-commands (format nil "gnew ~A" (+ i 2))))
(run-commands "gselect 1")

(define-key *top-map* (kbd "s-1") "gselect 1")
(define-key *top-map* (kbd "s-2") "gselect 2")
(define-key *top-map* (kbd "s-3") "gselect 3")
(define-key *top-map* (kbd "s-4") "gselect 4")
(define-key *top-map* (kbd "s-5") "gselect 5")
(define-key *top-map* (kbd "s-6") "gselect 6")
(define-key *top-map* (kbd "s-7") "gselect 7")
(define-key *top-map* (kbd "s-8") "gselect 8")
(define-key *top-map* (kbd "s-9") "gselect 9")
(define-key *top-map* (kbd "s-0") "gselect 10")

(define-key *top-map* (kbd "s-!") "gmove 1")
(define-key *top-map* (kbd "s-@") "gmove 2")
(define-key *top-map* (kbd "s-#") "gmove 3")
(define-key *top-map* (kbd "s-$") "gmove 4")
(define-key *top-map* (kbd "s-%") "gmove 5")
(define-key *top-map* (kbd "s-^") "gmove 6")
(define-key *top-map* (kbd "s-&") "gmove 7")
(define-key *top-map* (kbd "s-*") "gmove 8")
(define-key *top-map* (kbd "s-(") "gmove 9")
(define-key *top-map* (kbd "s-)") "gmove 10")

(define-key *root-map* (kbd "p") "gprev")
(define-key *root-map* (kbd "P") "gprev-with-window")
(define-key *root-map* (kbd "n") "gnext")
(define-key *root-map* (kbd "N") "gnext-with-window")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                              Windows                             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar *split-map* (make-sparse-keymap))
(define-key *root-map* (kbd "s") '*split-map*)
(define-key *split-map* (kbd "3") "hsplit")
(define-key *split-map* (kbd "2") "vsplit")
(define-key *split-map* (kbd "1") "only")
(define-key *split-map* (kbd "0") "remove-split")

(define-key *root-map* (kbd "C-p") "prev")
(define-key *root-map* (kbd "C-n") "next")

(load-module "globalwindows")

(define-key *root-map* (kbd "C-w") "global-windowlist (%3n) [%c] %s %t")
(define-key *root-map* (kbd "w") "windowlist (%3n) [%c] %s %t")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                               Focus                              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-key *top-map* (kbd "s-h") "move-focus left")
(define-key *top-map* (kbd "s-l") "move-focus right")
(define-key *top-map* (kbd "s-p") "move-focus up")
(define-key *top-map* (kbd "s-n") "move-focus down")

(define-key *top-map* (kbd "s-H") "move-window left")
(define-key *top-map* (kbd "s-L") "move-window right")
(define-key *top-map* (kbd "s-P") "move-window up")
(define-key *top-map* (kbd "s-N") "move-window down")

(define-key *top-map* (kbd "s-f") "fullscreen")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                               Rule                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-frame-preference "2"
    (0 t t
       :class "Firefox"
       :create t))

(dump-window-placement-rules *rule-file*)

(defcommand restore-window-rules () ()
  "Restore window rules and delete rule file."
  (restore-window-placement-rules *rule-file*)
  (delete-file *rule-file*)
  (message "Rule restored."))

(defcommand forget-window-rules () ()
  "Restore rules to file and forget window rules."
  (dump-window-placement-rules *rule-file*)
  (forget))

(defvar *rule-map* (make-sparse-keymap))
(define-key *root-map* (kbd "r") *rule-map*)
(define-key *rule-map* (kbd "f") "forget-window-rules")
(define-key *rule-map* (kbd "r") "restore-window-rules")
