(require-package 'company)
(require 'company)
(require 'lazy-set-key)

;(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0.2)           ;延迟时间
(setq company-minimum-prefix-length 1)  ;触发补全的字符数量
(setq company-show-numbers nil)         ;不显示数字

(lazy-unset-key
 '("TAB")
 company-mode-map)                      ;卸载按键

;; (lazy-unset-key
;;  '("M-p" "M-n" "M-1"
;;    "M-2" "M-3" "M-4"
;;    "M-5" "M-6" "M-7"
;;    "M-8" "M-9" "M-0"
;;    "C-m")
;;  company-active-map)

;; (lazy-set-key
;;  '(
;;    ("M-." . company-complete-common)    ;补全公共部分
;;    ("M-H" . company-complete-selection) ;补全选择的
;;    ("M-w" . company-show-location)      ;显示局部的
;;    ("M-s" . company-search-candidates)  ;搜索候选
;;    ("M-S" . company-filter-candidates)  ;过滤候选
;;    ("M-h" . company-select-next)        ;下一个
;;    ("M-p" . company-select-previous)    ;上一个
;;    )
;;  company-active-map
;;  )


(dolist (hook (list
               'emacs-lisp-mode-hook
               'lisp-mode-hook
               'lisp-interaction-mode-hook
               'scheme-mode-hook
               'c-mode-hook
               'c++-mode-hook
               'java-mode-hook
               'haskell-mode-hook
               'asm-mode-hook
               'emms-tag-editor-mode-hook
               'sh-mode-hook
               ))
(add-hook hook 'company-mode))

(provide 'company-mode-configure)
