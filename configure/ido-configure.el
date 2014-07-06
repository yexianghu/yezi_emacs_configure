;http://www.emacswiki.org/emacs/InteractivelyDoThings

(require 'ido)
(require 'ido-preview)

(ido-mode t)

(setq ido-enable-flex-matching t) ;模糊匹配
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

(global-set-key
 "\M-x"
 (lambda ()
   (interactive)
   (call-interactively
    (intern
     (ido-completing-read
      "M-x "
      (all-completions "" obarray 'commandp))))))

                                        ;Make Ido complete almost anything (except the stuff where it shouldn't)
(defvar ido-enable-replace-completing-read t
  "If t, use ido-completing-read instead of completing-read if possible.

    Set it to nil using let in around-advice for functions where the
    original completing-read is required.  For example, if a function
    foo absolutely must use the original completing-read, define some
    advice like this:

    (defadvice foo (around original-completing-read-only activate)
      (let (ido-enable-replace-completing-read) ad-do-it))")

;; Replace completing-read wherever possible, unless directed otherwise
(defadvice completing-read
  (around use-ido-when-possible activate)
  (if (or (not ido-enable-replace-completing-read) ; Manual override disable ido
          (and (boundp 'ido-cur-list)
               ido-cur-list)) ; Avoid infinite loop from ido calling this
      ad-do-it
    (let ((allcomp (all-completions "" collection predicate)))
      (if allcomp
          (setq ad-return-value
                (ido-completing-read prompt
                                     allcomp
                                     nil require-match initial-input hist def))
        ad-do-it))))

(add-hook 'dired-mode-hook
          '(lambda ()
             (set (make-local-variable 'ido-enable-replace-completing-read) nil)))


;;for ido-preview
(add-hook 'ido-setup-hook
   (lambda()
     (define-key ido-completion-map (kbd "C-M-p") (lookup-key ido-completion-map (kbd "C-p")))
     (define-key ido-completion-map (kbd "C-M-n") (lookup-key ido-completion-map (kbd "C-n"))) ; currently, this makes nothing. Maybe they'll make C-n key lately.
     (define-key ido-completion-map (kbd "C-p") 'ido-preview-backward)
     (define-key ido-completion-map (kbd "C-n") 'ido-preview-forward)))

(provide 'ido-configure)
