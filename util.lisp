(in-package :stumpwm)

(defun conf-dir ()
  (merge-pathnames ".stumpwm.d/"
                   (user-homedir-pathname)))

(defun conf-file-path (filename)
  (merge-pathnames filename
                    (conf-dir)))


(defun load-file (filename)
  (load (conf-file-path filename)))
