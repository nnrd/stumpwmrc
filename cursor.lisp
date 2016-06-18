(ql:quickload :clx-cursor)

(clx-cursor:set-theme *display*)
(dolist (screen (xlib:display-roots *display*))
  (let ((root (xlib:screen-root screen)))
    (setf (xlib:window-cursor root)
          (clx-cursor:cursor root :left-ptr))))
(xlib:display-finish-output *display*)
