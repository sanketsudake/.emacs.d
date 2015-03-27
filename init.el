(setq user-full-name "Sanket Sudake"
      user-mail-address "sanketsudake@gmail.com")
(setq debug-on-error t)
(add-hook 'after-init-hook '(lambda () (setq debug-on-error nil)))

;; Ask "y" or "n" instead of "yes" or "no"
(fset 'yes-or-no-p 'y-or-n-p)

;; Highlight corresponding parenthesis when cursor is on one
(show-paren-mode t)

;; Highlight tabulations
(setq-default highlight-tabs t)

;; Show trailing white spaces
(setq-default show-trailing-whitespace t)

;; Remove useless whitespace before saving file
(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'before-save-hook (lambda() delete-trailing-whitespace))

;; Save backup files to specific directory
(setq backup-directory-alist '(("~/saves")))

;; Set locale to utf-8
(set-language-environment 'utf-8)
(set-terminal-coding-system 'utf-8)
(set locale-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(setq-default c-basic-offset 8 c-default-style "linux")

(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; Set theme
(load-theme 'dichromacy)


;; Set No UI
(defun ss-no-ui ()
  (dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
    (when (fboundp mode) (funcall mode -1))))
(ss-no-ui)
