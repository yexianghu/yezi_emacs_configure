(require-package 'flymake)

(require-package 'flymake-cursor)

(require 'flymake)
(require 'flymake-cursor)

;; Let's run 8 checks at once instead.
(setq flymake-max-parallel-syntax-checks 8)

;; I don't want no steekin' limits.
(setq flymake-max-parallel-syntax-checks nil)

;; Yes, I want my copies in the same dir as the original.
(setq flymake-run-in-place t)

;; Nope, I want my copies in the system temp dir.
(setq flymake-run-in-place nil)

;; This lets me say where my temp dir is.
(setq temporary-file-directory "~/.emacs.d/tmp/")


;; I want to see at most the first 4 errors for a line.
(setq flymake-number-of-errors-to-display 4)

;; I want to see all errors for the line.
(setq flymake-number-of-errors-to-display nil)

(provide 'flymake-configure)
