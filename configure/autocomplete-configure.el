(require 'elpa-configure)

;if auto-complete do not exist download from pkg source
(require-package 'auto-complete)

(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")

(require 'auto-complete-config)
(ac-config-default)

(provide 'autocomplete-configure)
