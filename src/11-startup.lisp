;; startup
;;
;; Starts some programs.

(in-package :stumpwm)

(run-shell-command "ibus-daemon -dx")
(run-shell-command "syncthing --no-browser")
(run-shell-command "pulseaudio --start")
(run-shell-command "aria2c -D --conf-path=~/.aria2.conf")
(run-shell-command "unclutter -display $DISPLAY -idle 1")
(run-shell-command "setxkbmap -option ctrl:nocaps")
(run-shell-command "firefox")
(run-shell-command "keepassxc")
(run-shell-command "telegram-desktop")
(run-shell-command "slack")
(run-shell-command "emacs")
(run-shell-command "urxvt")

(defun startup-welcome ()
  "Show welcome message."
  (message "All system online.
Welcome, commander!"))

(push 'startup-welcome *start-hook*)
