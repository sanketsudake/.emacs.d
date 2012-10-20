;;@@Requirements
(add-to-list 'load-path "~/.emacs.d/auto-complete-1.3.1")
(add-to-list 'load-path "~/.emacs.d/plugins/")

;;auto-complete mode
;;************************************************************
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)
;; (set-default 'ac-sources '(
;;                           ac-source-abbrev
;;                           ac-source-words-in-buffer
;;                          ac-source-files-in-current-dir
;;                          ac-source-symbols
;;                          ))
;; Examples
(set-face-background 'ac-candidate-face "lightgray")
(set-face-underline 'ac-candidate-face "darkgray")
(set-face-background 'ac-selection-face "steelblue")
;;******************************************************************

;;Animate_emacs on startup
;;*******************************************************
(defconst animate-n-steps 10)
  (defun emacs-reloaded ()
    (animate-string (concat ";; Initialization successful, welcome to "
			    (substring (emacs-version) 0 16)
			    ".")
		    0 0)
    (newline-and-indent) (newline-and-indent))
(add-hook 'after-init-hook 'emacs-reloaded)
;;******************************************************************

;;Ido-mode
;;*********************************************************
(require 'ido)
(ido-mode t)
;;*********************************************************

;;Turn on electric mode for me
;;*********************************************************
(electric-indent-mode t) ;Auto Indent Any Lang Code
(electric-pair-mode t) ;Auto Pair
(electric-layout-mode t) ;Set Layout For My Text
;;*********************************************************

;;Full-Screen
;;**********************************************************************
(defun switch-full-screen ()
  (interactive)
  (shell-command "wmctrl -r :ACTIVE: -btoggle,maximized_vert,maximized_horz" ))
(global-set-key (kbd "<f11>") 'switch-full-screen)
;;**********************************************************************

;;Customize
;;**********************************************************************
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq-default indent-tabs-mode nil)
(transient-mark-mode 1)
(setq-default fill-column 80)
(setq-default indicate-empty-line t)
(global-font-lock-mode t)
(mouse-wheel-mode t)
(show-paren-mode t)
(display-time-mode)
(global-auto-revert-mode 1)
(setq disable-command-hook nil)
(setq inhibit-startup-message t)
(global-hl-line-mode t)
(global-linum-mode t)
;;**********************************************************************

;;************************************************************
;;Disable Arrow Keys
(global-set-key (kbd "<up>") 'disabled-key)
(global-set-key (kbd "<down>") 'disabled-key)
(global-set-key (kbd "<left>") 'disabled-key)
(global-set-key (kbd "<right>") 'disabled-key)

(global-set-key (kbd "<C-up>") 'disabled-key)
(global-set-key (kbd "<C-down>") 'disabled-key)
(global-set-key (kbd "<C-left>") 'disabled-key)
(global-set-key (kbd "<C-right>") 'disabled-key)
(global-set-key (kbd "<home>") 'disabled-key)
(global-set-key (kbd "<end>") 'disabled-key)
;;End of init.el
;;************************************************************
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
;;************************************************************
