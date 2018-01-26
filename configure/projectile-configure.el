(require-package 'projectile)
(require-package 'helm-projectile)
;(require-package 'sr-speedbar)

(require 'projectile)
(require 'helm-projectile)


;(projectile-global-mode)
(projectile-mode)

(setq projectile-completion-system 'helm)
(helm-projectile-on)


(setq projectile-indexing-method 'native)
(setq projectile-enable-caching t)
(setq projectile-globally-ignored-files (append '("*.o" "*.so" ".git") projectile-globally-ignored-files))

(global-set-key (kbd "C-c o") 'helm-projectile-find-file)
(global-set-key (kbd "C-c d") 'helm-projectile-find-file-dwim)
(global-set-key (kbd "C-c s") 'helm-projectile-switch-project)




(provide 'projectile-configure)
