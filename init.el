;; Sanket Sudake
;; 15 July 2013

(require 'cl)
(load "~/.emacs.d/cinesp.el")
;;@@Add load-path
;;************************************************************
(add-to-list 'load-path (cons "~/.emacs.d/elisp" load-path))
(add-to-list 'load-path (cons "~/.emacs.d" load-path))
;;************************************************************

;;Text mode and Auto Fill mode
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; Ido mode
(ido-mode t)
(setq ido-enable-flex-matching t) ; fuzzy matching is a must have
;; This tab override shouldn't be necessary given ido's default
;; configuration, but minibuffer-complete otherwise dominates the
;; tab binding because of my custom tab-completion-everywhere
;; configuration.
(add-hook 'ido-setup-hook
          (lambda ()
            (define-key ido-completion-map [tab] 'ido-complete)))

;; Stop autobackup
(setq make-backup-files nil) ;stop creating those backup~ files
(setq auto-save-default nil) ;stop creating those #autosave# files

;; Mail mode
; To enter mail mode, type `C-x m'
; To enter RMAIL (for reading mail),
; type `M-x rmail'
(setq mail-aliases t)





;;@@Set F11 for Full-Screen
;;**********************************************************************
(defun switch-full-screen ()
  (interactive)
  (shell-command "wmctrl -r :ACTIVE: -btoggle,maximized_vert,maximized_horz" ))
(global-set-key (kbd "<f11>") 'switch-full-screen)
;;**********************************************************************

;;@@Menu Customization
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
(global-hl-line-mode 1)
(global-linum-mode t)
(global-visual-line-mode 1) ; 1 for on, 0 for off
;;**********************************************************************

;;@@Disable Arrow Keys
;;************************************************************
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
;;************************************************************

;;@@Set No UI
;;************************************************************
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
;;************************************************************

;;@@Set theme
;;************************************************************
;;************************************************************

;;Coding system
;;************************************************************
(prefer-coding-system 'utf-8)
;;************************************************************

;; Set theme clues
(load-theme 'clues t)
