(require 'ibus)

(add-hook 'after-init-hook 'ibus-mode-on)
(setq ibus-agent-file-name "~/.emacs.d/module/ibus/ibus-el-0.3.2/ibus-el-agent")
(global-set-key (kbd "M-#") 'ibus-toggle)
(provide 'ibus-configure)
