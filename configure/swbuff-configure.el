(require-package 'swbuff-x)

(require 'swbuff-x)

(global-set-key (kbd "M-]") 'swbuff-switch-to-next-buffer)
(global-set-key (kbd "M-[") 'swbuff-switch-to-previous-buffer)

(setq swbuff-exclude-buffer-regexps 
     '("^ " "\\*.*\\*"))


(setq swbuff-status-window-layout 'scroll)
(setq swbuff-clear-delay 1)
(setq swbuff-separator "|")
(setq swbuff-window-min-text-height 1)

(provide 'swbuff-configure)


