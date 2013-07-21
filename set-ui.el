
;; Filename: set-ui.el
;; Purpose: Customizing ui and basic functional changes

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

;;@@Set F11 for Full-Screen
;;**********************************************************************
(defun switch-full-screen ()
  (interactive)
  (shell-command "wmctrl -r :ACTIVE: -btoggle,maximized_vert,maximized_horz" ))
(global-set-key (kbd "<f11>") 'switch-full-screen)
;;**********************************************************************

;;@@Set theme
;;************************************************************
(load-theme 'clues t)
;;************************************************************

;;@@Coding style
;;************************************************************
(prefer-coding-system 'utf-8)
;;************************************************************

;;@@Set Linum Format
;;************************************************************
(setq linum-format "%4d")
;;************************************************************

(provide 'set-ui.el)
;; set-ui.el ends here
