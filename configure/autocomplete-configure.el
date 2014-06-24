(require 'elpa-configure)

;if auto-complete do not exist download from pkg source
(require-package 'auto-complete)

(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")

(require 'auto-complete-config)
(ac-config-default)


;;for auto-java-complete
(require 'ajc-java-complete-config)
(defun remove-java-complete-keybind()
  (local-unset-key (kbd "C-c m")))

(add-hook 'java-mode-hook 'ajc-java-complete-mode)
(add-hook 'find-file-hook 'ajc-4-jsp-find-file-hook)
(add-hook 'ajc-java-complete-mode-hook 'remove-java-complete-keybind)
(custom-set-variables '(ajc-tag-file "~/.emacs.d/configure/.java_base.tag"))

(provide 'autocomplete-configure)
