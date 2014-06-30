;(setq tab-always-indent 'complete)
;(add-to-list 'completion-styles 'initials t)

;;show line number
(global-linum-mode 1)

;;for backup fils
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;;for desktop save

(desktop-save-mode 1)
(setq history-length 250)
(setq my-desktop-path "~/.emacs.d/.desktop/")
(setq desktop-path (list my-desktop-path))
(if
    (not (file-exists-p my-desktop-path))
    (make-directory my-desktop-path)
)
(add-to-list 'desktop-globals-to-save 'file-name-history)

;;deal with tab
(setq-default indent-tabs-mode nil)

;;buffer
(defun kill-other-buffers ()
      "Kill all other buffers."
      (interactive)
      (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(defun temp-buffer ()
  (interactive)
  (switch-to-buffer (make-temp-name "temp-buffer")))

;;for java
(add-hook 'java-mode-hook
              (lambda ()
                "Treat Java 1.5 @-style annotations as comments."
                (setq c-comment-start-regexp "(@|/(/|[*][*]?))")
                (modify-syntax-entry ?@ "< b" java-mode-syntax-table)))

(global-set-key
  (kbd "<f5>")
  (lambda (&optional force-reverting)
    "Interactive call to revert-buffer. Ignoring the auto-save
 file and not requesting for confirmation. When the current buffer
 is modified, the command refuses to revert it, unless you specify
 the optional argument: force-reverting to true."
    (interactive "P")
    ;;(message "force-reverting value is %s" force-reverting)
    (if (or force-reverting (not (buffer-modified-p)))
        (revert-buffer :ignore-auto :noconfirm)
      (error "The buffer has been modified"))))

;;for brace indent
(setq c-default-style "bsd" c-basic-offset 4)

;;for file name
(defun copy-file-path ()
  (interactive)
  (kill-new (buffer-file-name))
)

(defun copy-buffer-name ()
  (interactive)
  (kill-new (buffer-name))
)

(provide 'common-configure)
