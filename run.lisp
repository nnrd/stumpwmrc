(defvar *autorun-list*
  (list
   "conky"
   "nm-applet"
   "goldendict"))

(defcommand autorun ()
  ()
  "Autorun programs on stumpwm start"
  (loop for app in *autorun-list* do (run-shell-command app)))

(autorun)
