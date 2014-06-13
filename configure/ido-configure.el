(require 'ido)

(ido-mode t)
;(setq ido-enable-flex-matching t) ;模糊匹配
(setq ido-everywhere nil)         ;disable ido everyting

(defun ido-for-mode(prompt the-mode)
  (switch-to-buffer
   (ido-completing-read prompt
                        (save-excursion
                          (delq
                           nil
                           (mapcar (lambda (buf)
                                     (when (buffer-live-p buf)
                                       (with-current-buffer buf
                                         (and (eq major-mode the-mode)
                                              (buffer-name buf)))))
                                   (buffer-list)))))))

(defun ido-shell-buffer()
  (interactive)
  (ido-for-mode "Shell:" 'shell-mode))

(provide 'ido-configure)
