;; startup
;;
;; Starts some programs.

(in-package :stumpwm)

(run-shell-command "ibus-daemon -rdx")
(run-shell-command "syncthing --no-browser")
(run-shell-command "pulseaudio --start")
(run-shell-command "aria2c -D --conf-path=~/.aria2.conf")
(run-shell-command "unclutter -display $DISPLAY -idle 1")
(run-shell-command "setxkbmap -option ctrl:nocaps")
