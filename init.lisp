;; .stumpwmrc
;; 
;; Author: YUE Daian, David Bjergaard <dbjergaard@gmail.com>
;;
;;
(in-package :stumpwm)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                             Loader                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun conf-dir ()
  (merge-pathnames ".stumpwm.d/"
                   (user-homedir-pathname)))

(defun conf-file-path (filename)
  (merge-pathnames filename
                    (conf-dir)))


(defun load-file (filename)
  (load (conf-file-path filename)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                          Quicklisp                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Install or setup quicklisp.
#-quicklisp
(let ((quicklisp-setup (conf-file-path "quicklisp/setup.lisp")))
  (if (probe-file quicklisp-setup)
      (load-file quicklisp-setup)
      (load-file "quicklisp-install.lisp")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                             Swank                                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Start swank server.
(ql:quickload :swank)
(swank-loader:init)
(swank:create-server :dont-close t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                             Setup                                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load-file "env.lisp")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;; Global variable  ;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Default programs for various functions

;; Load swank.
;;*prefix-key* ; swank will kick this off

;; (defun cat (&rest strings) "Concatenates strings, like the Unix command 'cat'. A shortcut for (concatenate 'string foo bar)."
;;   (apply 'concatenate 'string strings))

;; ;(setf *window-border-style* :TIGHT)
;; ;(set-win-bg-color 

;; (defparameter WEB-BROWSER "exec firefox"
;;   "Set default web browser")
;; ;(defparameter X-IMAGE-VIEWER "exec gqview"
;; ;  "Client Image Viewer" )
;; (setf *shell-program* (stumpwm:getenv "SHELL"))


;; ;; Set font for input box
;; ;(set-font "-lispm-fixed-medium-r-normal-*-13-*-*-*-*-*-*-*")

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;;;;;;;;; Functions aliases and macros ;;;;;;;;;;;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ; --- process management ----------------------------------------
;; (defun ps-exists (ps)
;;   (let ((f "ps -ef | grep ~S | grep -v -e grep -e stumpish | wc -l"))
;;     (< 0 (parse-integer (run-shell-command (format nil f ps) t)))))

;; (defun start-uniq-command-ps (command &key op (bg t))
;;   (unless (ps-exists command)
;;     (run-shell-command
;;      (concat command " " (or op "") " " (if bg "&" "")))))

;; (defun kill-ps-command (command)
;;   (format nil "kill -TERM `ps -ef | grep ~S | grep -v grep | awk '{print $2}'`"
;;           command))

;; (defun kill-ps (command)
;;   (run-shell-command (kill-ps-command command)))



;; (defun shell-command (command) "Run a shell command and display output to screen.
;;    This must be used in a functional side-effects-free style! If a program does not
;;    exit of its own accord, Stumpwm might hang!"
;;           (check-type command string)
;;           (echo-string (current-screen) (run-shell-command command t)))
   
;; (define-stumpwm-command "shell-command" ((command :string "sh: " :string))
;;      (check-type command string)
;;      (shell-command command))

;; (defun replace-all (string part replacement &key (test #'char=))
;; "Returns a new string in which all the occurences of the PART is replaced with REPLACEMENT."
;; (with-output-to-string (out)
;;   (loop with part-length = (length part)
;;        for old-pos = 0 then (+ pos part-length)
;;        for pos = (search part string 
;; 			 :start2 old-pos
;; 			 :test test)
;;        do (write-string string out 
;; 			:start old-pos
;; 			:end (or pos (length string)))
;;        when pos do (write-string replacement out)
;;        while pos)))
;; (defun browse-url (url-string)
;;   "Browse url using WEB-BROWSER"
;;   (check-type url-string string)
;;   (run-shell-command (concat WEB-BROWSER "\"" url-string "\"")))

;; (defcommand browser-find (url-string) ((:string "Browse to: "))  
;;   (check-type url-string string)
;;   (browse-url url-string))
;; (defcommand setup-phy () ()
;;   "Setup display and keyboard for my office at work"
;;   (run-shell-command "xrandr --output HDMI1 --off --output LVDS1 --mode 1366x768 --pos 0x0 --rotate normal --output DP1 --off --output VGA1 --off")
;;   (run-shell-command "xrandr --output HDMI1 --off --output LVDS1 --mode 1366x768 --pos 0x0 --rotate normal --output DP1 --off --output VGA1 --mode 1920x1080 --pos 1366x0 --rotate normal")
;;   (run-shell-command "xmodmap .xmodmap")
;;   (run-shell-command "xset b off")
;; ;set wallpaper
;;   (run-shell-command "sleep 2 && feh --bg-fill /home/dave/Dropbox/Photos/cherry_blossoms.jpg"))

;; (define-key *top-map* (kbd "F12")   "setup-phy")


;; (defcommand google (search-string) ((:string "Search for: "))
;;   "Ask user for a search string and search Google for it."
;;   (check-type search-string string)
;;   (run-shell-command (cat "surfraw google " search-string)))
;; (defcommand google-ifl (search-string) ((:string "Jump to: "))
;;   "Same as GOOGLE, but with i'm feeling lucky on"
;;   (check-type search-string string)
;;   (run-shell-command (cat "surfraw google -l " search-string)))


;; (define-stumpwm-command "google-selection" ()
;;   "Get the X selection and search for it through Google."
;;   (run-shell-command (cat "exec surfraw google " (get-x-selection))))


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Multimedia functions ;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (defcommand notify-caps () ()
;;   "Notify caps lock status when button is pressed"
;;   (run-shell-command "~/Dropbox/notify_caps.sh"))

;; (defcommand vol-up () ()
;;   "Increase the volume from the shell"
;;   (run-shell-command 
;;    "pacmd set-sink-volume 0 $(printf '0x%x' $(( $(pacmd dump|grep set-sink-volume|cut -f3 -d' ') + 0xf00)) ) &> /dev/null"))
;; (defcommand vol-down () () 
;;   "Decrease the volume  from the shell"
;;   (run-shell-command 
;;    "pacmd set-sink-volume 0 $(printf '0x%x' $(( $(pacmd dump|grep set-sink-volume|cut -f3 -d' ') - 0xf00)) ) &> /dev/null"))
;; ;; FIXME: Implement this function
;; (defcommand vol-mute () () 
;;   "toggle mute"
;;   (run-shell-command 
;;    "pacmd set-sink-mute 0 $(if [ $(pacmd dump |grep set-sink-mute | cut -f 3 -d' ' ]; then echo yes; else echo no; fi;)"))

;; (define-key *root-map* (kbd "Print")
;;   "exec import -window root png:$HOME/screenshot_$(date +%F_%H-%M-%S).png")
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;;;;;;;;;;;;;;;; Startup programs ;;;;;;;;;;;;;;;;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; Enable X11 zap
;; (run-shell-command "setxkbmap -option terminate:ctrl_alt_bksp")
;; ;; Disable annoying accessiblity features
;; (run-shell-command "xkbset -a")
;; ;; Turn on the screensaver
;; ;(run-shell-command "xscreensaver-command -exit; killall xscreensaver 2>/dev/null; xscreensaver -no-splash") 


;; ;; Set font dir to include lispm font since Xorg.conf doesn't seem to cut it
;; ;;(run-shell-command "xset fp+ /usr/local/share/fonts/bitmap")

;; ;; Start pulseaudio so that we have sound!
;; (run-shell-command "pulseaudio --start")
;; ;(run-shell-command "gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh")
;; (run-shell-command "xmodmap ~/.xmodmap") 

;; ;; Load Xresources for custom fonts/colors in different programs
;; (run-shell-command "xrdb -load ~/.Xresources -quiet")
;; ;; Must run after Xresources to make sure that the settings in xresources get read into the daemon.
;; (run-shell-command "urxvtd -q -f -o")

;; ;; Set up dropbox to sync files (especially the .emacs and .stumpwmrc!)
;; (run-shell-command "sh /home/dave/.dropbox-dist/dropboxd &> /dev/null &")

;; (run-shell-command "nm-applet &> /dev/null &")
;; (run-shell-command "xfce4-panel &> /dev/null &")

;; (run-shell-command "xfce4-volumed &> /dev/null &")
;; (run-shell-command "xfce4-power-manager &> /dev/null &")
;; (run-shell-command "/usr/lib/notify-osd/notify-osd &> /dev/null &")

;; ;; Set the background image aka wallpaper /usr/share/backgrounds/InthedarkRedux.jpg
;; (run-shell-command "feh --bg-scale /home/dave/Dropbox/Photos/cherry_blossoms.jpg")

;; ;; Disable annoying system bell
;; (run-shell-command "xset b off")

;; ;;;;;;;;;;;;;;;;;;;;;
;; ;; Start Up groups ;;
;; ;;;;;;;;;;;;;;;;;;;;;
;; (run-commands "gnewbg email"
;; 	      "gnewbg music"
;; 	      "gnewbg chat")

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;;;;;;;;; Keybindings and re-definitions;;;;;;;;;;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; change the prefix key
;; (set-prefix-key (kbd "C-q"))

;; ;; Set up terminals
;; ;; \"-lispm-fixed-medium-r-normal-*-13-*-*-*-*-*-*-*\"

;; (defparameter X-TERM "exec urxvt"
;; "X-TERM command definition so we can launch a terminal emulator")
;; ;"exec emacsclient -c -e '(shell-switcher-new-shell)'" 

;; (define-key *root-map* (kbd "c") X-TERM)
;; (define-key *root-map* (kbd "C-c") X-TERM) 
;; ;; Set up emacs client
;; (define-key *root-map* (kbd "e") "exec emacsclient -c ")

;; ;; Browsing
;; (define-key *root-map* (kbd "C-f") WEB-BROWSER)
;; (define-key *root-map* (kbd "f") "exec conkeror")
;; (define-key *root-map* (kbd "F") "google-ifl")

;; ;; Surfraw
;; (define-key *root-map* (kbd "G") "google")

;; ;; Multimedia!!
;; ;(define-key *top-map*  (kbd "Caps Lock") "notify-caps")
;; (define-key *top-map* (kbd "XF86AudioLowerVolume")   "vol-down")
;; (define-key *top-map* (kbd "XF86AudioRaiseVolume")   "vol-up")
;; (define-key *top-map* (kbd "C-(")  "vol-down")
;; (define-key *top-map* (kbd "C-)")  "vol-up")
;; (define-key *top-map* (kbd "C-*")  "vol-mute")

