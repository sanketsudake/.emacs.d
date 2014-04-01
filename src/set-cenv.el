;; Filename: set-cenv.el
;; Author: Sanket Sudake <sanketsudake at gmail.com>
;; Licence: GNU GPL v3

;;;; cc mode setup
(require 'cc-mode)
(setq-default c-basic-offset 4 c-default-style "linux")
;;(setq-default tab-width 4 indent-tabs-mode t)
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)

;;;; doc mode
(require 'doc-mode)
(add-hook 'c-mode-common-hook 'doc-mode)
(add-hook 'c++-mode-hook 'doc-mode)

;;;; autocomplete and yasnippet mode
(require 'yasnippet)
(yas-global-mode 1)
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(ac-flyspell-workaround)
(add-to-list 'ac-dictionary-directories
             "~/.emacs.d/dict")
(add-to-list 'load-path "~/.emacs.d/src/clang")
(require 'auto-complete-clang-async)
(setq ac-ignore-case 'smart)
(set-face-background 'ac-candidate-face "lightgray")
(set-face-underline 'ac-candidate-face "darkgray")
(set-face-background 'ac-selection-face "steelblue")
(defun ac-cc-mode-setup ()
  (setq ac-clang-complete-executable
		"~/.emacs.d/src/clang/clang-complete")
  (setq ac-sources '(ac-source-clang-async
					 ac-source-words-in-buffer
					 ac-source-words-in-same-mode-buffers
					 ac-source-filename
					 ac-source-files-in-current-dir
					 ac-source-yasnippet
					 ac-source-dictionary
					 ac-source-semantic
					 ac-source-gtags
					 ac-source-jedi-direct
					 ac-source-css-property
					 ))
  (ac-clang-launch-completion-process))
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

;;;; Eldoc mode
(setq c-eldoc-includes "`pkg-config gtk+-2.0 --cflags` -I./ -I../ -I/usr/include/opencv -I/usr/include/GL -I/usr/include")
(load "c-eldoc")
(add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)
(add-hook 'c++-mode-hook 'c-turn-on-eldoc-mode)

(provide 'set-cenv)
