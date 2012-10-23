;;@@Package Setup
;;************************************************************
(require 'package)
(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)
;;************************************************************

;;@@Requirement Paths
;;************************************************************
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete-1.3.1")
(add-to-list 'load-path "~/.emacs.d/plugins/python-mode")
(add-to-list 'load-path "~/.emacs.d/plugins/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
************************************************************

;;@@Yasnippet-bundle
;;************************************************************
(require 'yasnippet-bundle)
;;************************************************************

;;@@flyspell mode
;;************************************************************
(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))
(dolist (hook '(change-log-mode-hook log-edit-mode-hook))
  (add-hook hook (lambda () (flyspell-mode -1))))
(add-hook 'c-mode
          (lambda()
            (flyspell-prog-mode)
            ))
(add-hook 'python-mode
          (lambda()
            (flyspell-prog-mode)
            ))
;;************************************************************

;;@@auto-complete mode
;;************************************************************
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)
;; (set-default 'ac-sources '(
;;                           ac-source-abbrev
;;                           ac-source-words-in-buffer
;;                          ac-source-files-in-current-dir
;;                          ac-source-symbols
;;                          ))
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)
;;******************************************************************

;;@@Animate_emacs on startup
;;*******************************************************
;;Primarily Turned Off because Slow startup of emacs
;; (defconst animate-n-steps 10)
;;   (defun emacs-reloaded ()
;;     (animate-string (concat ";; Initialization successful, welcome to "
;; 			    (substring (emacs-version) 0 16)
;; 			    ".")
;; 		    0 0)
;;     (newline-and-indent) (newline-and-indent))
;; (add-hook 'after-init-hook 'emacs-reloaded)
;;******************************************************************

;;************************************************************

;;@@Ido-mode
;;*********************************************************
;; I have require Ido mode for better file manupilation.
(require 'ido)
(ido-mode t)
;;*********************************************************

;;@@Turn on Electric Indent Mode
;;*********************************************************
(electric-indent-mode t) ;Auto Indent Any Lang Code
(electric-pair-mode t) ;Auto Pair
(electric-layout-mode t) ;Set Layout For My Text
;;*********************************************************

;;@@Set F11 for Full-Screen
;;**********************************************************************
(defun switch-full-screen ()
  (interactive)
  (shell-command "wmctrl -r :ACTIVE: -btoggle,maximized_vert,maximized_horz" ))
(global-set-key (kbd "<f11>") 'switch-full-screen)
;;**********************************************************************

;;@@Menu Customization
;;**********************************************************************
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq-default indent-tabs-mode nil)
(transient-mark-mode 1)
(setq-default fill-column 80)
(setq-default indicate-empty-line t)
(global-font-lock-mode t)
(mouse-wheel-mode t)
(show-paren-mode t)
(display-time-mode)
(global-auto-revert-mode 1)
(setq disable-command-hook nil)
(setq inhibit-startup-message t)
(global-hl-line-mode t)
(global-linum-mode t)
;;**********************************************************************

;;@@Disable Arrow Keys
;;************************************************************
(global-set-key (kbd "<up>") 'disabled-key)
(global-set-key (kbd "<down>") 'disabled-key)
(global-set-key (kbd "<left>") 'disabled-key)
(global-set-key (kbd "<right>") 'disabled-key)
(global-set-key (kbd "<C-up>") 'disabled-key)
(global-set-key (kbd "<C-down>") 'disabled-key)
(global-set-key (kbd "<C-left>") 'disabled-key)
(global-set-key (kbd "<C-right>") 'disabled-key)
(global-set-key (kbd "<home>") 'disabled-key)
(global-set-key (kbd "<end>") 'disabled-key)
;;************************************************************

;;@@Set No UI
;;************************************************************
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
;;************************************************************

;;@@ERC doctor
;;************************************************************
(require 'erc)
(setq erc-remove-parsed-property nil)
(autoload 'doctor-doc "doctor")
(autoload 'make-doctor-variables "doctor")
(defvar erc-doctor-id " ")
(defun erc-cmd-DOCTOR (&optional last-sender &rest ignore)
  "Get the last message in the channel and doctor it."
  (let ((limit (- (point) 1000))
        (pos (point))
        doctor-buffer
        last-message
        text)
    ;; Make sure limit is not negative
    (when (< limit 0) (setq limit 0))
    ;; Search backwards for text from someone
    (while (and pos (not (let ((data (get-text-property pos 'erc-parsed)))
                           (and data
                                (string= (aref data 3) "PRIVMSG")
                                (or (not last-sender)
                                    (string= (car (split-string (aref data 2) "!"))
                                             last-sender))))))
      (setq pos (previous-single-property-change
                 pos 'erc-parsed nil limit))
      (when (= pos limit)
        (error "No appropriate previous message to doctor")))
    (when pos
      (setq last-sender (car (split-string
                              (aref (get-text-property
                                     pos 'erc-parsed) 2) "!"))
            doctor-buffer (concat "*ERC doctor: " last-sender "*")
            last-message (split-string
                          ;; Remove punctuation from end of sentence
                          (replace-regexp-in-string
                           "[ .?!;,/]+$" ""
                           (aref (get-text-property pos
                                                    'erc-parsed) 5)))
            text (mapcar (lambda (s)
                           (intern (downcase s)))
                         ;; Remove salutation if it exists
                         (if (string-match
                              (concat "^" erc-valid-nick-regexp
                                      "[:,]*$\\|[:,]+$")
                              (car last-message))
                             (cdr last-message)
                           last-message))))
    (erc-send-message
     (concat erc-doctor-id
             ;; Only display sender if not in a query buffer
             (if (not (erc-query-buffer-p))
                 (concat last-sender ": "))
             (save-excursion
               (if (get-buffer doctor-buffer)
                   (set-buffer doctor-buffer)
                 (set-buffer (get-buffer-create doctor-buffer))
                 (make-doctor-variables))
               (erase-buffer)
               (doctor-doc text)
               (buffer-string))))))
;;************************************************************

;;@@Python-Mode From Lanuchpad
;;************************************************************
(setq py-install-directory "~/.emacs.d/plugins/python-mode")
(require 'python-mode)
(setq py-shell-name "ipython")
(setq py-shell-name "/usr/bin/ipython2.7")
;;************************************************************

;;@@Theme Settings
;;************************************************************
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes (quote (zenburn)))
 '(custom-safe-themes (quote ("be7eadb2971d1057396c20e2eebaa08ec4bfd1efe9382c12917c6fe24352b7c1" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;************************************************************
