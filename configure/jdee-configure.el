(load "jde")

(push 'jde-mode ac-modes)
(add-hook 'jde-mode-hook (lambda () (push 'ac-source-semantic ac-sources)))

(provide 'jdee-configure)
