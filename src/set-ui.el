
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
(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)
(set-frame-parameter (selected-frame) 'alpha '(95 100))
(add-to-list 'default-frame-alist '(alpha 95 100))
;;**********************************************************************

;;@@Set theme
;;************************************************************
(load-theme 'clues t)
;;************************************************************

;;@@Coding style
;;************************************************************
(prefer-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(set-language-environment 'UTF-8)
(set-default-coding-systems 'utf-8)
(setq file-name-coding-system 'utf-8)
(setq buffer-file-coding-system 'utf-8)
(setq coding-system-for-write 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
;; Completion ignores filenames ending in any string in this list.
(setq completion-ignored-extensions
      '(".o" ".elc" "~" ".bin" ".class" ".exe" ".ps" ".abs" ".mx"
        ".~jv" ".rbc" ".pyc" ".beam" ".aux" ".out" ".pdf"))
;;************************************************************

;;@@Set Linum Format
;;************************************************************
(setq linum-format "%4d")
;;************************************************************


;; yes or no becomes y or n
(defalias 'yes-or-no-p 'y-or-n-p)

;; Set highlight color
(set-face-background 'hl-line "#663366")
(set-face-foreground 'hl-line "#fff")
(set-cursor-color "#ccccff")
(provide 'set-ui.el)
;; set-ui.el ends here
