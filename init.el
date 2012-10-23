;;@@Requirements
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete-1.3.1")
(add-to-list 'load-path "~/.emacs.d/plugins/python-mode")
(add-to-list 'load-path "~/.emacs.d/plugins/")


(require 'erc)
;;Yasnippet-bundle
;;************************************************************
(require 'yasnippet-bundle)
;;************************************************************

;;flyspell mode
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
(add-hook 'python-mode
          (lambda()
            (flymake-mode)
            ))

;;************************************************************

;;auto-complete mode
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
;; Examples
;; (set-face-background 'ac-candidate-face "lightgray")
;; (set-face-underline 'ac-candidate-face "darkgray")
;; (set-face-background 'ac-selection-face "steelblue")
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)
;;******************************************************************

;;Animate_emacs on startup
;;*******************************************************
(defconst animate-n-steps 10)
  (defun emacs-reloaded ()
    (animate-string (concat ";; Initialization successful, welcome to "
			    (substring (emacs-version) 0 16)
			    ".")
		    0 0)
    (newline-and-indent) (newline-and-indent))
(add-hook 'after-init-hook 'emacs-reloaded)
;;******************************************************************

;;************************************************************

;;Ido-mode
;;*********************************************************
(require 'ido)
(ido-mode t)
;;*********************************************************

;;Turn on electric mode for me
;;*********************************************************
(electric-indent-mode t) ;Auto Indent Any Lang Code
(electric-pair-mode t) ;Auto Pair
(electric-layout-mode t) ;Set Layout For My Text
;;*********************************************************

;;Full-Screen
;;**********************************************************************
(defun switch-full-screen ()
  (interactive)
  (shell-command "wmctrl -r :ACTIVE: -btoggle,maximized_vert,maximized_horz" ))
(global-set-key (kbd "<f11>") 'switch-full-screen)
;;**********************************************************************

;;Customize
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

;;************************************************************
;;Disable Arrow Keys
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
;;End of init.el
;;************************************************************
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
;;************************************************************
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (misterioso))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;ERC doctor
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
(setq py-install-directory "~/.emacs.d/plugins/python-mode")
(require 'python-mode)
(setq py-shell-name "ipython")
(setq py-shell-name "/usr/bin/ipython2.7")
