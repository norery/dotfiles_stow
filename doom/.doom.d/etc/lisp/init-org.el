;;; etc/config/init-org.el -*- lexical-binding: t; -*-
(use-package org-superstar
  :ensure t
  :after org
  :hook (org-mode . org-superstar-mode)
  :custom
  ( with-eval-after-load  'org-superstar
    ( set-face-attribute  'org-superstar-item  nil  :height  1.2 )
    ( set-face-attribute  'org-superstar-header-bullet  nil  :height  1.2 )
    ( set-face-attribute  'org-superstar-leading  nil  :height  1.3 ))
  (org-superstar-headline-bullets-list '("☰" "☷" "✿" "☭"))
  (org-superstar-cycle-headline-bullets nil )
  )

;; 为上层提供 init-org 模块
(provide 'init-org)
