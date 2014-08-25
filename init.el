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

(provide 'set-packages.el)
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (dolist (source '(
		    ("marmalade" . "http://marmalade-repo.org/packages/")
		    ("melpa" . "http://melpa.milkbox.net/packages/")
		    ))
    (add-to-list 'package-archives source)))

;;Package Setup
(defvar prelude-packages
  '(ack-and-a-half expand-region
		   flycheck
		   clues-theme
		   yasnippet c-eldoc company
		   golden-ratio powerline
		   popup-switcher autopair
		   xcscope multiple-cursors
		   )
  "A list of packages to ensure are installed at launch.")

(defun prelude-packages-installed-p ()
  (loop for p in prelude-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(unless (prelude-packages-installed-p)
  ;; check for new packages (package versions)
  (message "%s" "Emacs Prelude is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p prelude-packages)
    (when (not (package-installed-p p))
      (package-install p))))
(require 'cl)
(setq debug-on-error t)
(add-hook 'after-init-hook '(lambda () (setq debug-on-error nil)))
;; Cask setup
;; (require 'cask "~/.cask/cask.el")
;; (cask-initialize)
;; ;; Disable Arrow Keys
;; (mapc
;;  (lambda (ss-keyval) (global-set-key (kbd ss-keyval) 'disabled-key))
;;  (list "<up>" "<down>" "<left>" "<right>"))
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
(setq-default c-basic-offset 8 c-default-style "linux")
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)

(global-linum-mode 1)
;; Company mode customization
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(add-to-list 'company-backends 'company-c-headers)
(defvar company-clang-arguments '("-I/usr/include" "-I/usr/src/linux-headers-3.13.0-24/include"))
;; Flycheck mode
;;(add-hook 'after-init-hook #'global-flycheck-mode)

(require 'golden-ratio)
(golden-ratio-mode 1)
(load-theme 'wombat t)

(setq autopair-autowrap t)

(setq-default fill-column 80)
(setq-default indicate-empty-line t)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(display-time-mode)

(require 'xcscope)
(cscope-setup)
(setq cscope-do-not-update-database t)

(setq c-eldoc-includes "-I./ -I../ -I/usr/include -I/lhome/ssudake/work/4/comms/gab/include/")
(add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)

(require 'popup-switcher)
(global-set-key [f2] 'psw-switch-buffer)
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

(setq cscope-initial-directory "/lhome/ssudake/work/4/comms/gab/")

(setq indent-tabs-mode t)
(setq sh-basic-offset 8)
(setq sh-indentation 8)
;; (require 'semantic)
;; (global-set-key [f8] 'semantic-ia-fast-jump) ;; jump to definition.
;; (global-set-key [S-f8]                       ;; jump back
;;                 (lambda ()
;;                   (interactive)
;;                   (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
;;                      (error "Semantic Bookmark ring is currently empty"))
;;                   (let* ((ring (oref semantic-mru-bookmark-ring ring))
;;                          (alist (semantic-mrub-ring-to-assoc-list ring))
;;                          (first (cdr (car alist))))
;;                     (if (semantic-equivalent-tag-p (oref first tag)
;;                                                    (semantic-current-tag))
;;                         (setq first (cdr (car (cdr alist)))))
;;                     (semantic-mrub-switch-tags first))))
;;; init.el ends here.
