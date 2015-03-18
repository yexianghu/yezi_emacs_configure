(require-package 'projectile)
(require-package 'helm-projectile)
;(require-package 'sr-speedbar)

(require 'projectile)
(require 'helm-projectile)


(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(setq projectile-indexing-method 'native)
(setq projectile-enable-caching t)

(global-set-key (kbd "C-c o") 'helm-projectile-find-file)
(global-set-key (kbd "C-c d") 'helm-projectile-find-file-dwim)
(global-set-key (kbd "C-c s") 'helm-projectile-switch-project)




(provide 'projectile-configure)
