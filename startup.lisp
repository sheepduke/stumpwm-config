(in-package :stumpwm)

(run-shell-command "ibus-daemon -rdx")
(run-shell-command "syncthing --no-browser")
(run-shell-command "compton -b")
(run-shell-command "pulseaudio --start")
(run-shell-command "aria2c -D --conf-path=~/.aria2.conf")
