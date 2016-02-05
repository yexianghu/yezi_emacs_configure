(require-package 'cider)
(require-package 'helm-cider-history)

;docs about cider 
;https://github.com/clojure-emacs/cider


(add-hook 'cider-mode-hook #'eldoc-mode)
;(setq cider-auto-mode nil)

(provide 'clojure-configure)
