(require-package 'point-undo)

(require 'point-undo)

(define-key global-map (kbd "<f7>") 'point-undo)
(define-key global-map (kbd "<f8>") 'point-redo)

(provide 'point-undo-configure)
