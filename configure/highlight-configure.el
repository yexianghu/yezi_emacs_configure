(require-package 'highlight-symbol)
(require-package 'highlight-parentheses)

(require 'highlight-symbol)

(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)


(global-set-key (kbd "M-h") 'highlight-symbol-at-point)
(global-set-key (kbd "M-n") 'highlight-symbol-next)
(global-set-key (kbd "M-p") 'highlight-symbol-prev)
(global-set-key (kbd "M-s") 'highlight-symbol-query-replace)

(provide 'highlight-configure)
