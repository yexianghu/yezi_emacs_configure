(require-package 'ggtags)

(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1)
              (setq ggtags-mode-map nil)
              )))

(provide 'ggtags-configure)
