(require 'ggtags)

(setq ggtags-executable-directory "~/bin/")

(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))))

(provide 'ggtags-configure)
