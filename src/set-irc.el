;; Filename: set-irc.el
;; Author: Sanket Sudake <sanketsudake at gmail.com>
;; Licence: GNU GPL v3

;;; Set irc login and connect to required channels
(require 'rcirc)

;; Set config for irc
(setq rcirc-default-nick "tripples"
	  rcirc-default-user-name "Sanket"
	  rcirc-default-full-name "Sanket Sudake"
	  rcirc-debug-flag t
	  rcirc-log-directory  "~/.emacs.d/rcirc-log"
	  rcirc-log-flag t
	  rcirc-time-format "%Y-%m-%d %H:%M "
	  rcirc-server-alist '(("irc.freenode.net"
							:channels (
										 "#emacs"
										 "#valu"
										 "#vit_te"))))

(defun config-rcirc (password)
  "Set authentication for rcirc"
  (interactive "sPassword: ")
  rcirc-authinfo '(("freenode" nickserv "tripples" password))
  )

;; Don't print /away messages.
;; This does not require rcirc to be loaded already,
;; since rcirc doesn't define a 301 handler (yet).
(defun rcirc-handler-301 (process cmd sender args)
  "/away message handler.")

;; Turn on spell checking.
(add-hook 'rcirc-mode-hook 'turn-on-flyspell)

;; Keep input line at bottom.
(add-hook 'rcirc-mode-hook
          (lambda ()
            (set (make-local-variable 'scroll-conservatively)
                 8192)))

;; Adjust the colours of one of the faces.
(set-face-foreground 'rcirc-my-nick "red" nil)

;;; rcirc/reconnect command - EmacsWiki
(eval-after-load 'rcirc
  '(defun-rcirc-command reconnect (arg)
     "Reconnect the server process."
     (interactive "i")
     (unless process
       (error "There's no process for this target"))
     (let* ((server (car (process-contact process)))
            (port (process-contact process :service))
            (nick (rcirc-nick process))
            channels query-buffers)
       (dolist (buf (buffer-list))
         (with-current-buffer buf
           (when (eq process (rcirc-buffer-process))
             (remove-hook 'change-major-mode-hook
                          'rcirc-change-major-mode-hook)
             (if (rcirc-channel-p rcirc-target)
                 (setq channels (cons rcirc-target channels))
               (setq query-buffers (cons buf query-buffers))))))
       (delete-process process)
       (rcirc-connect server port nick
                      rcirc-default-user-name
                      rcirc-default-full-name
                      channels))))

;;; track activity when I'm in another buffer
(eval-after-load 'rcirc '(rcirc-track-minor-mode))

(provide 'set-irc)
;;set-irc ends here.
