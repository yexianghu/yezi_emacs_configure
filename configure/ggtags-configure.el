(require 'ggtags)

(setq ggtags-executable-directory "~/bin/")

(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1)
              (ggtags-set-key))))

(defun ggtags-set-key()
  (local-set-key (kbd "C-M-=") 'ggtags-find-definition)
  (local-set-key (kbd "M-+") 'ggtags-find-tag-regexp)
  (local-set-key (kbd "C-=") 'ggtags-find-tag-dwim)
  (local-set-key (kbd "C-+") 'ggtags-find-reference)
)
(provide 'ggtags-configure)
