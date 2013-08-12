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
(require 'auto-complete-clang)
(require 'auto-complete-clang-async)
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

;;@@auto-complete-clang setup
;;************************************************************
;;(require 'auto-complete-clang)
;;(define-key c++-mode-map (kbd "C-.") 'ac-complete-clang)
;; replace C-S-<return> with a key binding that you want


;;************************************************************

;;@@member-function
;;************************************************************
(require 'member-function)
(setq mf--source-file-extension "cpp")
;;************************************************************

(provide 'set-cenv.el)
