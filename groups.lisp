(in-package :stumpwm)

(defun make-groups-bg (&rest names)
  (let ((ns (mapcar #'(lambda (n) (concatenate 'string "gnewbg " n)) names)))
    (apply #'run-commands ns)))

(run-commands "grename α")
(make-groups-bg "β" "γ" "δ" "ε" "ζ")

(loop
   for group from 1 to 10
   do (let ((key-num (mod group 10)))
        (define-key
          *top-map*
          (kbd (format nil "s-~A" key-num))
          (format nil "gselect ~A" group))
        (define-key
          *top-map*
          (kbd (format nil "C-s-~A" key-num))
          (format nil "gmove ~A" group))))
