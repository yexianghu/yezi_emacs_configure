(require-package 'w3m)

(setq w3m-command "~/bin/w3m")
(require 'w3m)


(setq browse-url-browser-function 'w3m-browse-url)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
 ;; optional keyboard short-cut
(global-set-key "\C-xm" 'browse-url-at-point)
(setq w3m-use-cookies t)


(setq w3m-coding-system 'utf-8
          w3m-file-coding-system 'utf-8
          w3m-file-name-coding-system 'utf-8
          w3m-input-coding-system 'utf-8
          w3m-output-coding-system 'utf-8
          w3m-terminal-coding-system 'utf-8)

 (if (string= system-type "darwin")
     (setq process-connection-type nil))


(defun w3m-get-buffer-with-org-style ()
  "Get current buffer content with `org-mode' style.
This function will encode `link-title' and `link-location' with `org-make-link-string'.
And move buffer content to lastest of kill ring.
So you can yank in `org-mode' buffer to get `org-mode' style content."
  (interactive)
  (let (transform-start
        transform-end
        return-content
        link-location
        link-title
        temp-position
        out-bound)
    (if mark-active
        (progn
          (setq transform-start (region-beginning))
          (setq transform-end (region-end))
          (deactivate-mark))
      (setq transform-start (point-min))
      (setq transform-end (point-max)))
    (message "Start transform link to `org-mode' style, please wait...")
    (save-excursion
      (goto-char transform-start)
      (while (and (not out-bound)             ;not out of transform bound
                  (not (w3m-no-next-link-p))) ;not have next link in current buffer
        ;; store current point before jump next anchor
        (setq temp-position (point))
        ;; move to next anchor when current point is not at anchor
        (or (w3m-anchor (point)) (w3m-get-next-link-start))
        (if (<= (point) transform-end)  ;if current point is not out of transform bound
            (progn
              ;; get content between two links.
              (if (> (point) temp-position)
                  (setq return-content (concat return-content (buffer-substring temp-position (point)))))
              ;; get link location at current point.
              (setq link-location (w3m-anchor (point)))
              ;; get link title at current point.
              (setq link-title (buffer-substring (point) (w3m-get-anchor-end)))
              ;; concat `org-mode' style url to `return-content'.
              (setq return-content (concat return-content (org-make-link-string link-location link-title))))
          (goto-char temp-position)     ;reset point before jump next anchor
          (setq out-bound t)            ;for break out `while' loop
          ))
      ;; concat rest context of current buffer
      (if (< (point) transform-end)
          (setq return-content (concat return-content (buffer-substring (point) transform-end))))
      (kill-new return-content)
      (message "Transform link completed. You can get it from lastest kill ring."))))

(defun w3m-get-anchor-start ()
  "Move and return `point' for thst start of the current anchor."
  (interactive)
  (goto-char (or (previous-single-property-change (point) 'w3m-anchor-sequence) ;get start position of anchor
                 (point)))                                                      ;or current point
  (point))

(defun w3m-get-anchor-end ()
  "Move and return `point' after the end of current anchor."
  (interactive)
  (goto-char (or (next-single-property-change (point) 'w3m-anchor-sequence) ;get end position of anchor
                 (point)))                                                  ;or current point
  (point))

(defun w3m-get-next-link-start ()
  "Move and return `point' for that start of the current link."
  (interactive)
  (catch 'reach
    (while (next-single-property-change (point) 'w3m-anchor-sequence) ;jump to next anchor
      (goto-char (next-single-property-change (point) 'w3m-anchor-sequence))
      (when (w3m-anchor (point))        ;return point when current is valid link
        (throw 'reach nil))))
  (point))

(defun w3m-get-prev-link-start ()
  "Move and return `point' for that end of the current link."
  (interactive)
  (catch 'reach
    (while (previous-single-property-change (point) 'w3m-anchor-sequence) ;jump to previous anchor
      (goto-char (previous-single-property-change (point) 'w3m-anchor-sequence))
      (when (w3m-anchor (point))        ;return point when current is valid link
        (throw 'reach nil))))
  (point))


(defun w3m-no-next-link-p ()
  "Return t if no next link after cursor.
Otherwise, return nil."
  (save-excursion
    (equal (point) (w3m-get-next-link-start))))

(defun w3m-no-prev-link-p ()
  "Return t if no prevoius link after cursor.
Otherwise, return nil."
  (save-excursion
    (equal (point) (w3m-get-prev-link-start))))

(defun convert-html()
  ;(w3m-buffer)
  ;(setq tmp-w3m-buf-name (make-temp-name (buffer-name)))
  ;(switch-to-buffer tmp-w3m-buf-name)
  ;(copy-to-buffer tmp-w3m-buf-name)
)

(add-hook 'html-mode-hook 'convert-html)
(provide 'w3m-configure)
