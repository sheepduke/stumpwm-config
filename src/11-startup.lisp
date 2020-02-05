;; startup
;;
;; Starts some programs.

(in-package :stumpwm)

;; Applications
(run-shell-command "emacs")
(run-shell-command "urxvt")
(run-shell-command "firefox")
(run-shell-command "keepassxc")

(defun startup-welcome ()
  "Show welcome message."
  (message "All system online.
Welcome, commander!"))

(push 'startup-welcome *start-hook*)
