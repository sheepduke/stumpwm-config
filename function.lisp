(in-package :stumpwm)

(defcommand firefox () ()
  (run-or-raise "firefox" '(:class "Firefox")))

(defcommand urxvt () ()
  (run-or-raise "urxvt" '(:class "URxvt")))
