(require-package 'projectile)

(require 'projectile)
(projectile-global-mode)

(setq projectile-indexing-method 'native)
(setq projectile-enable-caching t)

(provide 'projectile-configure)
