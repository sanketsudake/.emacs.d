;; Completion ignores filenames ending in any string in this list.
(setq completion-ignored-extensions
      '(".o" ".elc" "~" ".bin" ".class" ".exe" ".ps" ".abs" ".mx"
        ".~jv" ".rbc" ".pyc" ".beam" ".aux" ".out" ".pdf"))
;; Ido mode
(defvar ido-enable-flex-matching t)
(defvar ido-everywhere t)
(defvar ido-vertical-mode t)
(defvar ido-completion-map)

;; This tab override shouldn't be necessary given ido's default
;; configuration, but minibuffer-complete otherwise dominates the
;; tab binding because of my custom tab-completion-everywhere
;; configuration.
(add-hook 'ido-setup-hook
          (lambda ()
            (define-key ido-completion-map [tab] 'ido-complete)))
(ido-mode 1)
;; stop creating those backup~ files
(setq make-backup-files nil)
;; stop creating those #autosave# files
(setq auto-save-default nil)
;; autopair mode
(require 'autopair)
(autopair-global-mode 1)
(setq autopair-autowrap t)
;; Save emacs session before exit
(defvar desktop-save 'if-exists)
(desktop-save-mode 1)
;; Powerline Mode
(require 'powerline)
(powerline-default-theme)
(global-linum-mode 1)
