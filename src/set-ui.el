;; Filename: set-ui.el
;; Author: Sanket Sudake <sanketsudake at gmail.com>
;; Licence: GNU GPL v3

;;;; Disable Arrow Keys
;; (global-set-key (kbd "<up>") 'disabled-key)
;; (global-set-key (kbd "<down>") 'disabled-key)
;; (global-set-key (kbd "<left>") 'disabled-key)
;; (global-set-key (kbd "<right>") 'disabled-key)
;;(global-set-key (kbd "<C-up>") 'disabled-key)
;;(global-set-key (kbd "<C-down>") 'disabled-key)
;;(global-set-key (kbd "<C-left>") 'disabled-key)
;;(global-set-key (kbd "<C-right>") 'disabled-key)
(global-set-key (kbd "<home>") 'disabled-key)
(global-set-key (kbd "<end>") 'disabled-key)

;;;; Set No UI
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

;;;; Menu Customization
(setq-default fill-column 80)
(setq-default indicate-empty-line t)
(setq disable-command-hook nil)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-message t)
(mouse-wheel-mode t)
(show-paren-mode t)
(display-time-mode)
(transient-mark-mode 1)
(global-font-lock-mode t)
(global-auto-revert-mode 1)
(global-hl-line-mode 1)
(global-linum-mode t)
(global-visual-line-mode 1)

;;;; Set F11 for Full-Screen
(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)
(set-frame-parameter (selected-frame) 'alpha '(95 100))
(add-to-list 'default-frame-alist '(alpha 95 100))

;;;; Set theme
(load-theme 'molokai t)

;;;; Coding style
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

;; yes or no becomes y or n
(defalias 'yes-or-no-p 'y-or-n-p)

;; Set highlight color
;;(set-face-background 'hl-line "#663366")
(set-face-foreground 'hl-line "#f8ff")
;;(set-cursor-color "#ccccff")

(provide 'set-ui)
;; set-ui ends here
