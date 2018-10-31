;; hook
;;
;; Hook functions.

(in-package :stumpwm)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                             Startup                              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun startup-welcome ()
  "Show welcome message."
  (message "All system online.
Welcome, commander!"))

(setf *start-hook*
      '(startup-welcome))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                              Window                              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Make newly created windows full screen.
(defun new-window-activate-fullscreen (window)
  "Activate full screen for newly created windows."
  (activate-fullscreen window))

(setf *new-window-hook*
      '(new-window-activate-fullscreen))
