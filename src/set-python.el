;; Filename: set-python.el
;; Author: Sanket Sudake <sanketsudake at gmail.com>
;; Licence: GNU GPL v3

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)

(provide 'set-python)
;; set-python ends here.
