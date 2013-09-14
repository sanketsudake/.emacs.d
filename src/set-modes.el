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

;;@@ ecb code browser
;;************************************************************
(require 'ecb)
(require 'ecb-autoloads)
(setq ecb-layout-name "left8")
(setq ecb-show-sources-in-directories-buffer 'always)
(setq ecb-compile-window-height 12)
;;; activate and deactivate ecb
(global-set-key (kbd "C-x C-;") 'ecb-activate)
(global-set-key (kbd "C-x C-'") 'ecb-deactivate)
;;; show/hide ecb window
(global-set-key (kbd "C-;") 'ecb-show-ecb-windows)
(global-set-key (kbd "C-'") 'ecb-hide-ecb-windows)
;;; quick navigation between ecb windows
(global-set-key (kbd "C-)") 'ecb-goto-window-edit1)
(global-set-key (kbd "C-!") 'ecb-goto-window-directories)
(global-set-key (kbd "C-@") 'ecb-goto-window-sources)
(global-set-key (kbd "C-#") 'ecb-goto-window-methods)
(global-set-key (kbd "C-$") 'ecb-goto-window-compilation)
;;; replacement for built-in ecb-deactive, ecb-hide-ecb-windows and
;;; ecb-show-ecb-windows functions
;;; since they hide/deactive ecb but not restore the old windows for me
(defun tmtxt/ecb-deactivate ()
  "deactive ecb and then split emacs into 2 windows that contain 2 most recent buffers"
  (interactive)
  (ecb-deactivate)
  (split-window-right)
  (switch-to-next-buffer)
  (other-window 1))
(defun tmtxt/ecb-hide-ecb-windows ()
  "hide ecb and then split emacs into 2 windows that contain 2 most recent buffers"
  (interactive)
  (ecb-hide-ecb-windows)
  (split-window-right)
  (switch-to-next-buffer)
  (other-window 1))
(defun tmtxt/ecb-show-ecb-windows ()
  "show ecb windows and then delete all other windows except the current one"
  (interactive)
  (ecb-show-ecb-windows)
  (delete-other-windows))
(global-set-key (kbd "C-x C-'") 'tmtxt/ecb-deactivate)
(global-set-key (kbd "C-;") 'tmtxt/ecb-show-ecb-windows)
(global-set-key (kbd "C-'") 'tmtxt/ecb-hide-ecb-windows)
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
(provide 'set-modes.el)
