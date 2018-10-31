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
