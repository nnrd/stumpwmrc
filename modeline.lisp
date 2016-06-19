(in-package :stumpwm)

(setf *bar-med-color* "^B^8")
(setf *bar-hi-color* "^B^3")
(setf *bar-crit-color* "^B^1")

(setf *colors*
      '("black"
       "red"
       "green"
       "yellow"
       "blue"
       "magenta"
       "cyan"
       "white"
       "GreenYellow"
       "#009696"))
(update-color-map (current-screen))

(setf *group-format* " %t ")
(setf *window-format* "%m%n%s%30t ")
(setf *mode-line-timeout* 2)

(defun get-date-modeline ()
  (multiple-value-bind (second minute hour date month year day-of-week dst-p tz) (get-decoded-time)
    (format nil "~2,'0d:~2,'0d ~d.~2,'0d.~d" hour minute date month year)))

;; (defun get-layout-modeline ()
;;   (if (= 0 (get-current-layout *display*))
;;       "^3 en ^n"
;;       "^3^R ru ^r^n"))

(setf *screen-mode-line-format*
      (list "^B^3%g^n^b %W"
            ;; "^5|"
            ;; '(:eval (get-layout-modeline))
            "^n^b^>"
            '(:eval (get-date-modeline))
            "        "
            ))

(setf *mode-line-border-width* 0)
(setf *mode-line-background-color* "#101010")
(setf *mode-line-foreground-color* "DeepSkyBlue")

(ql:quickload :xembed)
(load-module "stumptray")

(defcommand tray-enable ()
  ()
  "Enable systray"
  (stumptray::add-mode-line-hooks))

(defcommand tray-disable ()
  ()
  "Disable systray"
  (stumptray::remove-mode-line-hooks))

(tray-enable)

(if (not (head-mode-line (current-head)))
    (toggle-mode-line (current-screen) (current-head)))
