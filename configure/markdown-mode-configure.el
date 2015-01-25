(require 'elpa-configure)

;if auto-complete do not exist download from pkg source
(require-package 'markdown-mode)
(require-package 'markdown-mode+)

(require 'markdown-mode)
(require 'markdown-mode+)

(add-hook 'markdown-mode-hook
          (lambda ()
            (when buffer-file-name
              (add-hook 'after-save-hook
                        'check-parens
                        nil t))))

(add-hook 'markdown-mode-hook (lambda () (modify-syntax-entry ?\" "\"" markdown-mode-syntax-table)))

(custom-set-variables
'(markdown-command "/usr/local/bin/markdown")
)

(provide 'markdown-mode-configure)
