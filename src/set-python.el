;; Filename: set-python.el
;; Author: Sanket Sudake <sanketsudake at gmail.com>
;; Licence: GNU GPL v3

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)

;;(require 'flycheck-mode)
(eval-after-load "python"
  '(define-key python-mode-map "\C-cx" 'jedi-direx:pop-to-buffer)

  )
(flyspell-prog-mode)
(require 'flycheck-tip)
(require 'flycheck-color-mode-line)
(eval-after-load "flycheck"
  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))



(provide 'set-python)
;; set-python ends here.
