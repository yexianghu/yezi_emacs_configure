(require-package 'point-stack)

(defun point-move-hook ()
  (point-stack-push)
)

(add-hook 'helm-custom-imenu-hook 'point-move-hook)


;(global-set-key '[(f5)] 'point-stack-push)
(global-set-key '[(f7)] 'point-stack-pop)
(global-set-key '[(f8)] 'point-stack-forward-stack-pop)

(provide 'point-stack-configure)
