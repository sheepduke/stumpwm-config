;;;; This file contains functions to enable fullscreen automatically when newly
;;;; created window satisfies specific rule.

(in-package :stumpwm)

(defvar *fullscreen-class-list* '()
  "The list of window classes that shall be fullscreen.")

(push "URxvt" *fullscreen-class-list*)
(push "Emacs" *fullscreen-class-list*)
(push "Firefox" *fullscreen-class-list*)

(defun enable-fullscreen-by-class (window)
  "Enable fullscreen by window class."
  (when (member (window-class window) *fullscreen-class-list*
                :test #'string=)
    (activate-fullscreen window)))

(push 'enable-fullscreen-by-class *new-window-hook*)
