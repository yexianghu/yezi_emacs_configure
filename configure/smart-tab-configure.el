(require-package 'smart-tab)
(require 'smart-tab)

(global-smart-tab-mode 1)
(setq-default indent-tabs-mode nil)

(add-hook 'c-mode-common-hook
              (lambda () (setq indent-tabs-mode t)))

(setq-default tab-width 4)
(setq cua-auto-tabify-rectangles nil)
(provide 'smart-tab-configure)
