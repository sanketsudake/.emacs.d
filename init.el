;; "You don't have to like Emacs to like it. "

;; Filename: init.el
;; Author: Sanket Sudake <sanketsudake at gmail.com>
;; Licence: GNU GPL v3

;; Common-lisp support
(require 'cl)

;;;; add-directories to LOAD-PATH
;; load-path already contains directories
;; from elpa packages
(add-to-list 'load-path "~/.emacs.d/src")

;;;; Load all custom modes
(setq custom-load-list '("set-packages.el" "set-ui.el" "set-modes.el" "set-org.el"
						 "set-cenv.el" "set-python.el" "set-irc.el" "set-keybindings.el"))

(defun load-modes (custom-list)
  "Loads all *.el files mentioned in CUSTOM-LIST"
  (dolist (item custom-list t)
	(when (string= (file-name-extension item) "el")
	  (load item))))
(load-modes custom-load-list)

;;;; Start server if not running
(server-start)
(unless (server-running-p) (server-start))
