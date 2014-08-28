;; Set No UI
(defun ss-no-ui ()
  (dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
    (when (fboundp mode) (funcall mode -1))))
(ss-no-ui)

;; Coding style
(defun ss-encoding ()
  (prefer-coding-system 'utf-8)
  (setq buffer-file-coding-system 'utf-8
	coding-system-for-write 'utf-8
	file-name-coding-system 'utf-8)
  (setq default-process-coding-system '(utf-8 . utf-8))
  (set-language-environment 'UTF-8)
  (set-default-coding-systems 'utf-8)
  (set-keyboard-coding-system 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (set-clipboard-coding-system 'utf-8)
  (set-selection-coding-system 'utf-8))
(ss-encoding)
(require 'golden-ratio)
(golden-ratio-mode 1)
(load-theme 'wombat t)
(display-time-mode)
