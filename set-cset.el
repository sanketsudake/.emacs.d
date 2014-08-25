;;; cc mode setup
(require 'cc-mode)
(setq-default c-basic-offset 8 c-default-style "linux")
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)

;; Company mode customization
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(add-to-list 'company-backends 'company-c-headers)
(defvar company-clang-arguments '("-I/usr/include" "-I/usr/src/linux-headers-3.13.0-24/include"))
;; Flycheck mode
;;(add-hook 'after-init-hook #'global-flycheck-mode)


(setq autopair-autowrap t)

(setq-default fill-column 80)
(setq-default indicate-empty-line t)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(display-time-mode)


(setq c-eldoc-includes "-I./ -I../ -I/usr/include ")
(add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)

(require 'popup-switcher)
(global-set-key [f2] 'psw-switch-buffer)
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

(setq indent-tabs-mode t)
(setq sh-basic-offset 8)
(setq sh-indentation 8)


;; C specific changes
