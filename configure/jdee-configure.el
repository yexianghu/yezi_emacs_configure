(if (eq system-type 'darwin)
(setq jde-help-remote-file-exists-function '("beanshell"))
)

(load "jde")
(push 'jde-mode ac-modes)
(add-hook 'jde-mode-hook (lambda () (push 'ac-source-semantic ac-sources)))
(provide 'jdee-configure)
