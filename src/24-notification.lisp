(in-package :stumpwm)

(defcommand dunst-pause () ()
  (run-shell-command
   "killall -SIGUSR1 dunst")
  (message "Dunst paused."))

(defcommand dunst-resume () ()
  (run-shell-command
   "killall -SIGUSR2 dunst")
  (message "Dunst resumed."))

(define-key *top-map* (kbd "s-<") "dunst-pause")
(define-key *top-map* (kbd "s->") "dunst-resume")
