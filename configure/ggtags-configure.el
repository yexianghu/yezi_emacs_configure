(require-package 'ggtags)
(require 'ggtags)


(custom-set-variables
 '(ggtags-executable-directory "/usr/bin/")
 '(ggtags-enable-navigation-keys nil)
)


(defun do-init ()
  (define-key ggtags-mode-map (kbd "M-]") nil)
  (define-key ggtags-mode-map (kbd "<f11>") 'ggtags-find-tag-dwim)
  (define-key ggtags-mode-map (kbd "M-<f11>") 'ggtags-find-reference)
)

(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (progn
                  (ggtags-mode 1)
                  (do-init)
              ))))

(provide 'ggtags-configure)
