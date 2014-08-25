;;; init.el -- My init file
;; Filename: init.el
;; Description:
;; Author: Sanket Sudake
;; Email: <sanketsudake@gmail.com>
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;  My init.el file.
;;  Disable GUI, disabled arrow keys.
;;  Set of customizations for different modes.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:
;; Common lisp support and debug settings
(require 'cl)
(setq debug-on-error t)
(add-hook 'after-init-hook '(lambda () (setq debug-on-error nil)))
;; Stop for errors during init loading.
(add-to-list 'load-path "~/.emacs.d")
(load "set-packages.el")
(load "set-ui.el")
(load "set-keybind.el")
(load "set-cset.el")
(load "set-extra.el")
;;; init.el ends here
