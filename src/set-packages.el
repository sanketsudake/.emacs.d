
;; Filename: set-packagesp.el
;; Description:
;; Created at: 19July, 2013

;;@@Innitialize package-repository
;; **********************************************************************
(provide 'set-packages.el)
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
(dolist (source '(
                  ("marmalade" . "http://marmalade-repo.org/packages/")
				  ("melpa" . "http://melpa.milkbox.net/packages/")
				  ))
  (add-to-list 'package-archives source))
)

;;Package Setup
(defvar prelude-packages
  '(ack-and-a-half auctex  deft
				   expand-region
				   magit magithub markdown-mode
				   paredit projectile python sass-mode rainbow-mode
				   scss-mode  volatile-highlights
				   yaml-mode yari clues-theme
				   auto-complete autopair
				   yasnippet ecb emms c-eldoc company
				   golden-ratio powerline
				   jedi
				   )
  "A list of packages to ensure are installed at launch.")

(defun prelude-packages-installed-p ()
  (loop for p in prelude-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(unless (prelude-packages-installed-p)
  ;; check for new packages (package versions)
  (message "%s" "Emacs Prelude is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p prelude-packages)
    (when (not (package-installed-p p))
      (package-install p))))


;;; set-packages.el ends here
