(require 'elpa-configure)

(require-package 'org-elisp-help)
(global-set-key (kbd "C-c h f") 'describe-function)
(global-set-key (kbd "C-c h v") 'describe-variable)

(provide 'elisphelp-configure)
