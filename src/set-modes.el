;; Filename: set-modes.el
;; Author: Sanket Sudake <sanketsudake at gmail.com>
;; Licence: GNU GPL v3

;;;; Text mode and Auto Fill mode
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(require 'volatile-highlights)
(volatile-highlights-mode t)
(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of Lisp code." t)

;;;; Ido mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
;;This tab override shouldn't be necessary given ido's default
;;configuration, but minibuffer-complete otherwise dominates the
;;tab binding because of my custom tab-completion-everywhere
;;configuration.
(add-hook 'ido-setup-hook
          (lambda ()
            (define-key ido-completion-map [tab] 'ido-complete)))
(ido-mode 1)
(setq ido-vertical-mode t)

;;;; Stop autobackup
;;stop creating those backup~ files
(setq make-backup-files nil)
;;stop creating those #autosave# files
(setq auto-save-default nil)

;;;; autopair mode
(require 'autopair)
(autopair-global-mode 1)
(setq autopair-autowrap t)

;; Mail mode
										; To enter mail mode, type `C-x m'
										; To enter RMAIL (for reading mail),
										; type `M-x rmail'
(setq mail-aliases t)


;;;; emms-mode
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

;; golden ratio and desktop
(add-to-list 'load-path
             "~/.emacs.d/src")

;; Golden ratio
(require 'golden-ratio)
(golden-ratio-mode 1)

;; Save emacs session before exit
(setq desktop-save 'if-exists)
(desktop-save-mode 1)

;; Powerline Mode
(require 'powerline)
(powerline-default-theme)

;;;; Popup switcher
(require 'popup-switcher)
(global-set-key [f2] 'psw-switch-buffer)
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;;;; Multi-term mode
(require 'multi-term)

(defun get-term ()
  "Switch to the term buffer last used, or create a new one if
    none exists, or if the current buffer is already a term."
  (interactive)
  (let ((b (last-term-buffer (buffer-list))))
	(if (or (not b) (eq 'term-mode major-mode))
	    (multi-term)
	  (switch-to-buffer b))))

(defun it-multi-term-dedicated-toggle ()
  "jump back to previous location after toggling ded term off"
  (interactive)
  (multi-term-dedicated-toggle))
  ;; (if (multi-term-dedicated-exist-p)
  ;; 	  (if (eq (current-buffer) (multi-term-dedicated-get-buffer-name))
  ;; 		  (msg "Same buffer")
  ;; 		(progn
  ;; 		  (multi-term-dedicated-toggle)
  ;; 		  (switch-to-buffer-other-window (multi-term-dedicated-get-buffer-name))))
  ;;   (progn
  ;; 	  (multi-term-dedicated-toggle))))

(when (require 'multi-term nil t)
;;  (global-set-key (kbd "<f5>") 'get-term)
  (global-set-key (kbd "<f6>") 'it-multi-term-dedicated-toggle)
  (global-set-key (kbd "<C-next>") 'multi-term-next)
  (global-set-key (kbd "<C-prior>") 'multi-term-prev)
  (setq multi-term-buffer-name "term"
        multi-term-program "/bin/zsh"))

(when (require 'term nil t) ; only if term can be loaded..
  (setq term-bind-key-alist
        (list (cons "C-c C-c" 'term-interrupt-subjob)
              (cons "C-p" 'previous-line)
              (cons "C-n" 'next-line)
              (cons "M-f" 'term-send-forward-word)
              (cons "M-b" 'term-send-backward-word)
              (cons "C-c C-j" 'term-line-mode)
              (cons "C-c C-k" 'term-char-mode)
              (cons "M-DEL" 'term-send-backward-kill-word)
              (cons "M-d" 'term-send-forward-kill-word)
              (cons "<C-left>" 'term-send-backward-word)
              (cons "<C-right>" 'term-send-forward-word)
              (cons "C-r" 'term-send-reverse-search-history)
              (cons "M-p" 'term-send-raw-meta)
              (cons "M-y" 'term-send-raw-meta)
              (cons "C-y" 'term-send-raw))))


(defun web-mode-hook()
  "Hooks for web mode."
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-css-indent-offset 4)
  (setq web-mode-code-indent-offset 4)
  (setq web-mode-indent-style 4)
  (set-face-attribute 'web-mode-html-tag-face nil :foreground "Orange")
  (set-face-attribute 'web-mode-html-attr-name-face nil :foreground "Purple")
  (set-face-attribute 'web-mode-doctype-face nil :foreground "Blue")
  (setq web-mode-engines-alist '(("django" . "\\.html\\'")))
  )
(require 'web-mode)
(add-hook 'web-mode-hook 'web-mode-hook)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(provide 'set-modes)
