;(setq tab-always-indent 'complete)
;(add-to-list 'completion-styles 'initials t)

;;show line number
(global-linum-mode 1)
(add-to-list 'exec-path "/usr/local/bin")
(setq shell-command-switch "-ic")
(setenv "PATH"
  (concat
   "/usr/local/bin" ":"
   (getenv "PATH")
  )
)
;(setq debug-on-error t)
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

(defun revert-all-buffers ()
    "Refreshes all open buffers from their respective files."
    (interactive)
    (dolist (buf (buffer-list))
      (with-current-buffer buf
        (when (and (buffer-file-name) (file-exists-p (buffer-file-name)) (not (buffer-modified-p)))
          (revert-buffer t t t) )))
    (message "Refreshed open files.") )

(defun kill-other-buffers ()
      "Kill all other buffers."
      (interactive)
      (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(defun temp-buffer ()
  (interactive)
  (switch-to-buffer (make-temp-name "temp-buffer")))

(defun switch-to-previous-buffer ()
      (interactive)
      (switch-to-buffer (other-buffer (current-buffer) 1)))

;;for java
(add-hook 'java-mode-hook
              (lambda ()
                "Treat Java 1.5 @-style annotations as comments."
                (setq c-comment-start-regexp "(@|/(/|[*][*]?))")
                (modify-syntax-entry ?@ "< b" java-mode-syntax-table)))

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
(defalias 'cfp 'copy-file-path)
(defalias 'cbn 'copy-buffer-name)

;;yes/no to y/n
(fset 'yes-or-no-p 'y-or-n-p)

;;disable tool-bar
(tool-bar-mode -1)

;;for mac
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;;for hs-minor-mode
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (hs-minor-mode t)
              (local-set-key (kbd "C-+") 'hs-toggle-hiding))))


;for scroll
(setq scroll-conservatively 10000)
(setq mouse-wheel-scroll-amount '(2 ((shift) . 2) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

;custom occur
(defun cust_occur (exp line)
    (interactive "Mwhich to find:\nNline:")
    (occur exp line)
)

(global-set-key (kbd "C-j") 'match-paren)

(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert !."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

;(global-unset-key (kbd "C-SPC"))

(setq visible-bell t
 ring-bell-function 'ignore)
;(setq url-proxy-services '(("http" . "http://fq.mioffice.cn:3128")))
;(setq url-proxy-services '(("https" . "http://fq.mioffice.cn:3128")))
(provide 'common-configure)
