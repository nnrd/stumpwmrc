(in-package :stumpwm)

(set-prefix-key (kbd "s-q"))

(defvar *terminal* "konsole"
  "Command to start a terminal.")

(defcommand exec-term (cmd) (:string)
    (run-commands (format nil "exec ~A -e ~A" *terminal* cmd)))

(defcommand void-cmd () () nil)

(define-key *top-map* (kbd "s-RET")
  (format nil "exec ~A" *terminal*))

(define-key *root-map* (kbd "RET")
  (format nil "exec ~A" *terminal*))

(define-key *top-map* (kbd "s-l") "mode-line")
(define-key *root-map* (kbd "l") "mode-line")

;; execute apps map
(undefine-key *root-map* (kbd "c"))

(defvar *exec-map* nil)
(setf *exec-map*
  (let ((c (make-sparse-keymap)))
    (define-key c (kbd "t") "exec konsole")
    (define-key c (kbd "b") "exec chromium")
    (define-key c (kbd "p") "exec pavucontrol")
    (define-key c (kbd "o") "exec qpaeq")
    (define-key c (kbd "m") "exec pcmanfm")
    (define-key c (kbd "e") "exec emacs")
    (define-key c (kbd "d") "exec deadbeef")
    c))

(define-key *root-map* (kbd "q") '*exec-map*)

(define-key *top-map* (kbd "s-ESC") "delete-window")
(define-key *top-map* (kbd "S-s-ESC") "kill-window")
(define-key *top-map* (kbd "s-SunPageUp") "pull-hidden-next")
(define-key *top-map* (kbd "s-SunPageDown") "pull-hidden-previous")
(define-key *top-map* (kbd "s-TAB") "next")
(define-key *top-map* (kbd "S-s-TAB") "prev")

(define-key *root-map* (kbd "C-Left") "exchange-direction left")
(define-key *root-map* (kbd "C-Right") "exchange-direction right")
(define-key *root-map* (kbd "C-Up") "exchange-direction up")
(define-key *root-map* (kbd "C-Down") "exchange-direction down")

(define-key *top-map* (kbd "s-m") "only")

(define-key *top-map* (kbd "s-p") "exec pavucontrol")
(define-key *top-map* (kbd "s-o") "exec qpaeq")
(define-key *top-map* (kbd "s-w") "exec chromium")
(define-key *top-map* (kbd "S-s-RET") "exec pcmanfm")

;; some control commands

;; (define-key *top-map* (kbd "s-Down") "run-shell-command amixer -c0 set Master 3dB-")
;; (define-key *top-map* (kbd "s-Up") "run-shell-command amixer -c0 set Master 3dB+")

;; (define-key *top-map* (kbd "s-/") "run-shell-command ncmpcpp toggle")
;; (define-key *top-map* (kbd "s-.") "run-shell-command ncmpcpp next")
;; (define-key *top-map* (kbd "s-,") "run-shell-command ncmpcpp prev")

;; (define-key *root-map* (kbd "SunPrint_Screen") "run-shell-command scrot-pics")
;; (define-key *root-map* (kbd "C-SunPrint_Screen") "run-shell-command scrot-pics -s")

;; (define-key *root-map* (kbd "d") "exec-term sdcv")
;; (define-key *root-map* (kbd "D") "exec-term sdcv-sel")

;; (define-key *root-map* (kbd "M") "now-playing")
