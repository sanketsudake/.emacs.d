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
;; (add-hook 'after-init-hook #'global-flycheck-mode)


(setq autopair-autowrap t)

(setq-default fill-column 80)
(setq-default indicate-empty-line t)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq c-eldoc-includes "-I./ -I../ -I/usr/include -I/lhome/ssudake/work/comms/gab/include -I/lhome/ssudake/work/comms/llt/include")
(add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)

(require 'popup-switcher)
(global-set-key [f2] 'psw-switch-buffer)
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

(setq indent-tabs-mode t)
(setq sh-basic-offset 8)
(setq sh-indentation 8)

;; autopair mode
(require 'autopair)
(autopair-global-mode 1)
(setq autopair-autowrap t)

(require 'ggtags)
(add-hook 'c-common-mode-hook
	  (lambda ()
	    (when (derived-mode-p 'c-mode 'c++-mode))))

(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)

(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)

;; (setq-local imenu-create-index-function #'ggtags-build-imenu-index)
;; (require 'helm-config)
;; (require 'helm)
;; (helm-mode 't)

;; C specific changes
