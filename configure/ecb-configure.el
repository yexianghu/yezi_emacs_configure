(require-package 'ecb)
(setq ecb-examples-bufferinfo-buffer-name nil)


(global-set-key [f9] (lambda() (interactive) 
                       (if (and (boundp 'ecb-minor-mode) ecb-minor-mode)
                           (ecb-deactivate) 
                         (ecb-activate))))
'(ecb-tip-of-the-day ni)
(add-hook 'ecb-deactivate-hook
	  (lambda () (modify-all-frames-parameters '((width . 80)))))
;; resize the ECB window to be default (order matters here)
(add-hook 'ecb-activate-hook (lambda () (ecb-redraw-layout)
                               (ecb-maximize-window-methods)))
;; (add-hook 'ecb-activate-hook
;; 	  (lambda () (modify-all-frames-parameters '((width . 100)))))

(provide 'ecb-configure)
