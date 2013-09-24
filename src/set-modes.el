;; Filename :set-modes.el

(require 'cl)

;;@@Text mode and Auto Fill mode
;;************************************************************
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
;;************************************************************

;; @@Ido mode
;;************************************************************
;; fuzzy matching is a must have
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
;; This tab override shouldn't be necessary given ido's default
;; configuration, but minibuffer-complete otherwise dominates the
;; tab binding because of my custom tab-completion-everywhere
;; configuration.
(add-hook 'ido-setup-hook
          (lambda ()
            (define-key ido-completion-map [tab] 'ido-complete)))
(ido-mode 1)
;;************************************************************

;;@@ Stop autobackup
;;************************************************************
;;stop creating those backup~ files
(setq make-backup-files nil)
;;stop creating those #autosave# files
(setq auto-save-default nil)
;;************************************************************

;; Mail mode
;;************************************************************
; To enter mail mode, type `C-x m'
; To enter RMAIL (for reading mail),
; type `M-x rmail'
(setq mail-aliases t)
;;************************************************************

;;@@emms-mode
;;************************************************************
(require 'emms-setup)
;;(emms-standard)
(emms-devel)
(emms-default-players)

;; Show the current track each time EMMS
;; starts to play a track with "NP : "
(add-hook 'emms-player-started-hook 'emms-show)
(setq emms-show-format "Now Playing: %s")
;; Default name f
 (setq emms-playlist-buffer-name "*Music*")
;; When asked for emms-play-directory,
;; always start from this one
(setq emms-source-file-default-directory "~/Music/")
(setq emms-mode-line-format " %s ")

;; Want to use alsa with mpg321 ?
(setq emms-player-mpg321-parameters '("-o" "alsa"))

;;************************************************************

;; golden ratio and desktop
;;************************************************************
(add-to-list 'load-path
             "~/.emacs.d/src")
(require 'golden-ratio)
(golden-ratio-mode 1)
(desktop-save-mode 1)
;;************************************************************


;; Powerline Mode
;;************************************************************
(require 'powerline)
(powerline-default-theme)
;;(custom-set-faces
;; '(mode-line ((t (:foreground "#030303" :background "#bdbdbd" :box nil))))
;; '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil)))))
;;************************************************************

;;************************************************************
(require 'popup-switcher)
(global-set-key [f2] 'psw-switch-buffer)
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)
;;(global-set-key [f3] 'psw-switch-recentf)
;;(global-set-key [f4] 'psw-switch-function)
;;************************************************************
(provide 'set-modes.el)
