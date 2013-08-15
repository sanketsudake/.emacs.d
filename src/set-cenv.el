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

;; @@autocomplete and yasnippet mode
;;************************************************************
(require 'auto-complete)
(require 'yasnippet)
(yas-global-mode 1)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
             "~/.emacs.d/dict")
(ac-config-default)
(set-default 'ac-sources
             '(ac-source-abbrev
               ac-source-dictionary
               ac-source-yasnippet
               ac-source-words-in-buffer
               ac-source-words-in-same-mode-buffers
               ac-source-semantic
			   ac-source-clang
			   ac-source-clang-async
			   ))
(dolist (m '(c-mode c++-mode java-mode))
  (add-to-list 'ac-modes m))
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")
(global-auto-complete-mode t)

;;************************************************************

;; Eldoc mode
;;************************************************************
(setq c-eldoc-includes "`pkg-config gtk+-2.0 --cflags` -I./ -I../ -I/usr/include/opencv -I/usr/include/GL")
(load "c-eldoc")
(add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)
(add-hook 'c++-mode-hook 'c-turn-on-eldoc-mode)

(provide 'set-cenv.el)
