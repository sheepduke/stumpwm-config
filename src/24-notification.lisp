(in-package :stumpwm)

(defcommand dunst-pause () ()
  (run-shell-command
   "killall -SIGUSR1 dunst"))

(defcommand dunst-resume () ()
  (run-shell-command
   "killall -SIGUSR2 dunst"))

(define-key *top-map* (kbd "s-<") "dunst-pause")
(define-key *top-map* (kbd "s->") "dunst-resume")
