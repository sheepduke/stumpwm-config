;; function
;;
;; Common functions and commands.

(in-package :stumpwm)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                          Applications                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defcommand firefox () ()
  (run-or-raise "firefox" '(:class "Firefox")))

(defcommand urxvt () ()
  (run-or-raise "urxvt" '(:class "URxvt")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                             Utility                              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun now ()
  "Return the current local timestamp as string."
  (local-time:format-timestring
   nil (local-time:now)
   :format '((:year 4) "-" (:month 2) "-" (:day 2) "_"
             (:hour 2) "." (:min 2) "." (:sec 2))))

(defun command-exists-p (shell-command)
  "Return T if given SHELL-COMMAND is in the search path."
  (> (length (run-shell-command (format nil "which ~A" shell-command) t)) 0))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                           Screenshot                             ;;
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
;;                             Volume                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun volume-get-sinks ()
  "Return a list containing all available sinks."
  (let ((result (run-shell-command "pactl list short sinks | ag -o '^[0-9]+'" t)))
    (str:split #\newline result)))

(defun volume-add (percent)
  (check-type percent string)
  (dolist (sink (volume-get-sinks))
    (run-shell-command
     (format nil "pactl set-sink-volume ~A ~A" sink percent))))

(defcommand volume-set (percent)
    ((:number "Enter the percentage: "))
  "Raise the volume for all sinks."
  (volume-add
   (format nil "~A~A%"
           (if (>= percent 0) "+" "")
           percent)))
