(require-package 'projectile)
;(require-package 'helm-projectile)
;(require-package 'sr-speedbar)

(require 'projectile)
;(require 'helm-projectile)


(projectile-global-mode)


(setq projectile-indexing-method 'native)
(setq projectile-enable-caching t)

;(global-set-key (kbd "C-c o") 'helm-projectile)
(global-set-key (kbd "C-c s") 'projectile-switch-project)
(global-set-key (kbd "C-c k") 'projectile-find-file-in-known-projects)


(provide 'projectile-configure)
