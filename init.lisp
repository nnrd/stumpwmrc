;; ASDF
;;(push #p"/home/nnrd/src/lisp/systems/" asdf:*central-registry*)

;; QuickLisp
(load "/home/nnrd/quicklisp/setup.lisp")

(in-package :stumpwm)
(ql:quickload :swank)

;; (ql:quickload :clx-truetype)
;; (load-module "ttf-fonts")
;; (xft:cache-fonts)
;; (set-font (make-instance 'xft:font :family "Droid Sans Mono" :subfamily "Regular" :size 10))
(set-font "-*-terminus-medium-r-normal-*-14-*-*-*-*-*-iso10646-1")

(defvar *wallpaper* "~/Картинки/обои/aaa/1777531278467323433.jpg")0

(defvar *confdir* "/home/nnrd/.stumpwm.d")
(defun load-conf-file (filename)
  (load (format nil "~A/~A" *confdir* filename)))

(load-conf-file "cursor.lisp")
(load-conf-file "modeline.lisp")
(load-conf-file "keys.lisp")
(load-conf-file "groups.lisp")
(load-conf-file "windows.lisp")

(setf *mouse-focus-policy* :sloppy)

(defcommand swank () ()
  ;; (setf stumpwm:*top-level-error-action* :break)
  ;; (when (not (getf (swank:connection-info) :pid))
  (swank:create-server :port 4005
                       :style swank:*communication-style*
                       :dont-close t)
  (echo-string
   (current-screen)
   "Starting swank. M-x slime-connect RET RET, then (in-package :stumpwm)."))

(run-shell-command (format nil "wmsetbg ~A" *wallpaper*))

(ql:quickload :xembed)
(load-module "stumptray")
(stumptray:stumptray)
