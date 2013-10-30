;; Filename: set-packagesp.el
;; Author: Sanket Sudake <sanketsudake at gmail.com>
;; Licence: GNU GPL v3

;;;; Innitialize package-repositories
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (dolist (source '(
					("marmalade" . "http://marmalade-repo.org/packages/")
					("melpa" . "http://melpa.milkbox.net/packages/")))
	(add-to-list 'package-archives source)))

;;;;Package Setup
(defvar ss-packages-list
  "A list of packages to ensure are installed at launch."
  '(ack-and-a-half expand-region
				   magit markdown-mode
				   paredit projectile python volatile-highlights
				   yaml-mode auto-complete autopair
				   yasnippet emms c-eldoc
				   golden-ratio powerline
				   popup-switcher jedi maxframe
				   molokai-theme doc-mode
				   multi-term))

(defun ss-packages-installed-p ()
  "Check whether packages installed or not"
  (loop for p in ss-packages-list
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(unless (ss-packages-installed-p)
  ;; check for new packages (package versions)
  (message "%s" "Emacs Prelude is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p ss-packages-list)
    (when (not (package-installed-p p))
      (package-install p))))

(provide 'set-packages)
;;; set-packages.el ends here
