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
;;
;; Stop for errors during init loading.
(setq debug-on-error t)
(add-hook 'after-init-hook '(lambda () (setq debug-on-error nil)))
;; Cask setup
(require 'cask "~/.cask/cask.el")
(cask-initialize)
;; Disable Arrow Keys
(mapc
 (lambda (ss-keyval) (global-set-key (kbd ss-keyval) 'disabled-key))
 (list "<up>" "<down>" "<left>" "<right>" "<home>" "<end>"))
;; Set No UI
(defun ss-no-ui ()
  (dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
    (when (fboundp mode) (funcall mode -1))))
(ss-no-ui)
;; Coding style
(defun ss-encoding ()
  (prefer-coding-system 'utf-8)
  (setq buffer-file-coding-system 'utf-8
	coding-system-for-write 'utf-8
	file-name-coding-system 'utf-8)
  (setq default-process-coding-system '(utf-8 . utf-8))
  (set-language-environment 'UTF-8)
  (set-default-coding-systems 'utf-8)
  (set-keyboard-coding-system 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (set-clipboard-coding-system 'utf-8)
  (set-selection-coding-system 'utf-8))
(ss-encoding)
;; Completion ignores filenames ending in any string in this list.
(setq completion-ignored-extensions
      '(".o" ".elc" "~" ".bin" ".class" ".exe" ".ps" ".abs" ".mx"
        ".~jv" ".rbc" ".pyc" ".beam" ".aux" ".out" ".pdf"))
;; Ido mode
(defvar ido-enable-flex-matching t)
(defvar ido-everywhere t)
(defvar ido-vertical-mode t)
(defvar ido-completion-map)
;; This tab override shouldn't be necessary given ido's default
;; configuration, but minibuffer-complete otherwise dominates the
;; tab binding because of my custom tab-completion-everywhere
;; configuration.
(add-hook 'ido-setup-hook
          (lambda ()
            (define-key ido-completion-map [tab] 'ido-complete)))
(ido-mode 1)
;; stop creating those backup~ files
(setq make-backup-files nil)
;; stop creating those #autosave# files
(setq auto-save-default nil)
;; autopair mode
(require 'autopair)
(autopair-global-mode 1)
(setq autopair-autowrap t)
;; Save emacs session before exit
(defvar desktop-save 'if-exists)
(desktop-save-mode 1)
;; Powerline Mode
(require 'powerline)
(powerline-default-theme)
;;; cc mode setup
(require 'cc-mode)
(setq-default c-basic-offset 4 c-default-style "linux")
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
(setq indent-tabs-mode nil)
(global-linum-mode 1)
;; Company mode customization
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(add-to-list 'company-backends 'company-c-headers)
(defvar company-clang-arguments '("-I/usr/include" "-I/usr/src/linux-headers-3.13.0-24/include"))
;; Flycheck mode
(add-hook 'after-init-hook #'global-flycheck-mode)

;;; init.el ends here.
