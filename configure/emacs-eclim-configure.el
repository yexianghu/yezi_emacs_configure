(require-package 'emacs-eclim)

(require 'eclim)
(require 'eclimd)

(global-eclim-mode)


(custom-set-variables
  '(eclim-eclipse-dirs '("~/tools/eclipse"))
  '(eclim-executable "~/tools/eclipse/eclim")
  '(eclimd-default-workspace "~/.emacs.d/eclim-workspace")
  '(eclimd-executable "~/tools/eclipse/eclimd")
  '(eclimd-wait-for-process nil)
)

(if (not (file-exists-p eclimd-default-workspace))
    (mkdir eclimd-default-workspace)
)

(if (not eclimd-process)
    (start-eclimd eclimd-default-workspace)
)


(global-set-key (kbd "C-c j") 'company-emacs-eclim)
(global-set-key (kbd "<f11>") 'eclim-java-find-declaration)
(global-set-key (kbd "M-<f11>") 'eclim-java-find-references)

;(defadvice kill-eclimd-before-kill-emacs (before save-buffers-kill-emacs (args) activate)
;  (interactive)
;  (stop-eclimd)
;)
(set-process-query-on-exit-flag (get-process "eclimd") nil)

;(setq help-at-pt-display-when-idle t)
;(setq help-at-pt-timer-delay 0.1)
;(help-at-pt-set-timer)

(require 'company-emacs-eclim)
(company-emacs-eclim-setup)
;(global-company-mode t)

(provide 'emacs-eclim-configure)
