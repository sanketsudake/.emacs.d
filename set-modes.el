;; Filename :set-modes.el

;;Text mode and Auto Fill mode
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; Ido mode
(ido-mode t)
(setq ido-enable-flex-matching t) ; fuzzy matching is a must have
;; This tab override shouldn't be necessary given ido's default
;; configuration, but minibuffer-complete otherwise dominates the
;; tab binding because of my custom tab-completion-everywhere
;; configuration.
(add-hook 'ido-setup-hook
          (lambda ()
            (define-key ido-completion-map [tab] 'ido-complete)))
;; Stop autobackup
(setq make-backup-files nil) ;stop creating those backup~ files
(setq auto-save-default nil) ;stop creating those #autosave# files

;; Mail mode
; To enter mail mode, type `C-x m'
; To enter RMAIL (for reading mail),
; type `M-x rmail'
(setq mail-aliases t)

(provide 'set-modes.el)
