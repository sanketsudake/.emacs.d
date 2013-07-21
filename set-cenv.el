
;; Filename: set-cenv.el

(require 'cc-mode)
(setq-default c-basic-offset 4 c-default-style "linux")
(setq-default tab-width 4 indent-tabs-mode t)
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)

;;(require 'autopair)
;;(autopair-global-mode 1)
;;(setq autopair-autowrap t)

(require 'auto-complete-clang)
(define-key c++-mode-map (kbd "C-.") 'ac-complete-clang)
;; replace C-S-<return> with a key binding that you want


;;(require 'member-function)
;;(setq mf--source-file-extension "cpp")




(provide 'set-cenv.el)
