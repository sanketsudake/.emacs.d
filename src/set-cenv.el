;; Filename: set-cenv.el

(require 'cl)

;;@@cc mode setup
;;************************************************************
(require 'cc-mode)
(setq-default c-basic-offset 4 c-default-style "linux")
(setq-default tab-width 4 indent-tabs-mode t)
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
;;************************************************************

;; @@autopair mode
;;************************************************************
(require 'autopair)
(autopair-global-mode 1)
(setq autopair-autowrap t)
;;************************************************************

;; @@yasnippet mode
;;************************************************************
;;(require 'yasnippet)
;;(yas-global-mode 1)
;;************************************************************

;; @@autocomplete and yasnippet mode
;;************************************************************
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(ac-flyspell-workaround)
(add-to-list 'ac-dictionary-directories
             "~/.emacs.d/dict")
(add-to-list 'load-path "~/.emacs.d/src/clang")
(require 'auto-complete-clang-async)
(defun ac-cc-mode-setup ()
  (setq ac-clang-complete-executable
		"~/.emacs.d/src/clang/clang-complete")
  (setq ac-sources '(ac-source-clang-async))
  (ac-clang-launch-completion-process)
)
(defun my-ac-config ()
  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'c++-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))
(my-ac-config)
(setq ac-use-menu-map t)
;; Default settings
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)
;;************************************************************

;; Eldoc mode
;;************************************************************
;;(setq c-eldoc-includes "`pkg-config gtk+-2.0 --cflags` -I./ -I../ -I/usr/include/opencv -I/usr/include/GL -I/usr/include")
;;(load "c-eldoc")
;;(add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)
;;(add-hook 'c++-mode-hook 'c-turn-on-eldoc-mode)

(provide 'set-cenv.el)
