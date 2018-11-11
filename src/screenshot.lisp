;; screenshot.lisp
;;
;; Stores functions related to screenshot.


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                            Commands                              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun screenshot-path ()
  "Return the file path of screen shot."
  (uiop:merge-pathnames* (now) *screenshot-dir*))

(defcommand take-screenshot () ()
  "Take screenshot without asking for file name."
  (cond
    ((command-exists-p "maim")
     (run-shell-command
      (format nil "maim --format jpg ~A.jpg" (screenshot-path))))
    (t
     (screenshot:screenshot (screenshot-path)))))

(defcommand take-screenshot-selection () ()
  "Take screenshot with selection."
  (cond
    ((command-exists-p "maim")
     (run-shell-command
      (format nil "maim --format jpg -s ~A.jpg" (screenshot-path))))
    (t
     (message "Not supported!"))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                            Bindings                              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-key *top-map* (kbd "SunPrint_Screen") "take-screenshot")
(define-key *top-map* (kbd "Sys_Req") "take-screenshot-selection")
