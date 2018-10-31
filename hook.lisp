;; hook
;;
;; Hook functions.

(in-package :stumpwm)

(defun new-window-activate-fullscreen (window)
  "Activate full screen for newly created windows."
  (activate-fullscreen window))

(setf *new-window-hook*
      '(new-window-activate-fullscreen))
