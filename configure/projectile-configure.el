(require-package 'projectile)
(require-package 'helm-projectile)

(require 'projectile)
(require 'helm-projectile)

(projectile-global-mode)


(setq projectile-indexing-method 'native)
(setq projectile-enable-caching t)

(global-set-key (kbd "C-c o") 'helm-projectile)

(provide 'projectile-configure)
