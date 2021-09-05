;;; etc/config/init-ui.el -*- lexical-binding: t; -*-


;;;===========================================
;;; 模块介绍
;;; 用户交互界面模块
;;;===========================================
;;;

;; 修改当前行的高亮背景色。 M-x 运行describe-char -> Face: h1-line -> Background: #0D343E 可以看到这个值。通过(customize this face) 修改，被保存在 ~/.emacs.d/.local/custom.el 文件
'(hl-line ((t (:background "#0D343E" ))))
;; '(font-lock-comment-face ((t (:foreground "#75715E"))))                 ;; 修改doom-molokai 注释行字体的前景色。 默认的感觉淡了点。

;; ;;光标在括号内时就高亮包含内容的两个括号
(defadvice show-paren-function (around fix-show-paren-function activate)
  (cond ((looking-at-p "\\s(") ad-do-it)
        (t (save-excursion
             (ignore-errors (backward-up-list))
             ad-do-it)))
  )

;; (use-package centaur-tabs
;;   :demand
;;   :config
;;   (centaur-tabs-mode t)
;;   (setq centaur-tabs-style "rounded")
;;   (setq centaur-tabs-set-close-button nil)
;;   (setq centaur-tabs-set-icons t)

  ;; :bind
  ;; ("C-n" . centaur-tabs-backward)
  ;; ("C-p" . centaur-tabs-forward))

;; 彩虹猫进度条
(use-package nyan-mode
  :if (not (boundp 'awesome-tray-mode))
  :ensure t
  :hook (after-init . nyan-mode)
  :config
  (setq nyan-wavy-trail t
		nyan-animate-nyancat t))

(setq initial-frame-alist (quote ((fullscreen . maximized))))   ;; 默认全屏


;; 为上层提供 init-ui 模块
(provide 'init-ui)
