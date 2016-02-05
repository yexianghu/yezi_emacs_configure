(defun bing-dict ()
 "Search current word in bing dictionary."
 (interactive)
 (save-restriction
 (let (start end)
 (skip-chars-backward "A-Za-z0–9") (setq start (point))
 (skip-chars-forward "A-Za-z0–9") (setq end (point))
 (setq current-word (buffer-substring start end))
 (w3m (concat "http://cn.bing.com/dict/search?q=" current-word))
 (if (not (string= (buffer-name) "*w3m*"))
 (switch-to-buffer-other-window "*w3m*"))
 (hl-line-mode "*w3m*")
 ;wait for 2 second, because the buffer will refresh soon and it go back to top line.
 (sit-for 2)
 (search-forward current-word nil t 2)
 ;mark the word for 1 second 
 (end-of-line)
 (set-mark (line-beginning-position))
 (sit-for 1)
 (deactivate-mark)
 ))
)
(provide 'dict-configure)
