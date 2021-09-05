;;; etc/config/init-latex.el -*- lexical-binding: t; -*-


;; CDLaTeX
;; (add-to-list 'load-path "~/.doom.d/etc/config")
;; (require 'cdlatex)
(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)

(map! :map cdlatex-mode-map
    :i "TAB" #'cdlatex-tab)

;; 设置正向跳转
;; use Skim as default pdf viewer
;; Skim's displayline is used for forward search (from .tex to .pdf)
;; option -b highlights the current line; option -g opens Skim in the background
(setq TeX-view-program-list
      '(("skim" "/Applications/Skim.app/Contents/SharedSupport/displayline -b %n %o %b")))

(eval-after-load 'latex
  '(progn
     (assq-delete-all 'output-pdf TeX-view-program-selection)
     (add-to-list 'TeX-view-program-selection '(output-pdf "skim"))))

(add-hook 'LaTeX-mode-hook
          #'(lambda ()
              ;; compile tex as PDF
              (setq TeX-PDF-mode t)
              (add-to-list 'TeX-command-list '("DYxeLaTeX" "%`xelatex -synctex=1%(mode)%' %t" TeX-run-TeX nil t))
              (setq TeX-command-extra-options "-file-line-error -shell-escape")
              (setq TeX-command-default "DYxeLaTeX")
              (setq TeX-save-query  nil ) ;; 不需要保存即可编译
              (setq TeX-source-correlate-method 'synctex)
              (setq TeX-source-correlate-mode t)
              (setq TeX-source-correlate-start-server t)
              (local-set-key (kbd "<S-s-mouse-1>") #'TeX-view)

              ))


;; 为上层提供 init-latex 模块
(provide 'init-latex)
