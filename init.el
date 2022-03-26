
(require 'package)
(setq package-archives '(("gnu"   . "http://elpa.zilongshanren.com/gnu/")

			 ("melpa" . "http://elpa.zilongshanren.com/melpa/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

;;防止反复调用 package-refresh-contents 会影响加载速度
(when (not package-archive-contents)
  (package-refresh-contents))

;;(set-face-attribute 'default nil :height 160)
(set-face-attribute 'default nil :font "source code pro-18")

;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)

;; 关闭文件滑动控件
(scroll-bar-mode -1)

;; 显示行号
(global-linum-mode 1)

;; 更改光标的样式（不能生效，解决方案见第二集）
(setq cursor-type 'bar)

(icomplete-mode 1)

(setq make-backup-files nil)


(electric-pair-mode t)

;; 更改光标的样式（不能生效，解决方案见第二集）
(setq cursor-type 'bar)

(icomplete-mode 1)

(setq inhibit-startup-screen t)

(toggle-frame-maximized)


;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)

(use-package monokai-theme
  :ensure t
  :config
  (load-theme 'monokai 1))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(global-set-key (kbd "C-c c") 'org-capture)
(setq org-agenda-files (list "~/quickstart/content/posts/orgfiles/gcal.org"
                            "~/quickstart/content/posts/orgfiles/i.org"
                            "~/quickstart/content/posts/orgfiles/schedule.org"))

(setq org-capture-templates
                    '(("a" "Appointment" entry (file+headline "~/quickstart/content/posts/orgfiles/gcal.org" "Appointments")
                             "* TODO %?\n:PROPERTIES:\n\n:END:\nDEADLINE: %^T \n %i\n")
                              ("n" "Note" entry (file+headline "~/quickstart/content/posts/orgfiles/notes.org" "Notes")
                             "* Note %?\n%T")
                             ("l" "Link" entry (file+headline "~/quickstart/content/posts/orgfiles/links.org" "Links")
                             "* %? %^L %^g \n%T" :prepend t)
                             ("b" "Blog idea" entry (file+headline "~/quickstart/content/posts/orgfiles/i.org" "Blog Topics")
                             "* %?\n%T" :prepend t)
                             ("t" "To Do Item" entry (file+headline "~/quickstart/content/posts/orgfiles/i.org" "To Do Items")
                              "* %?\n%T" :prepend)

                             ("j" "Journal" entry (file+datetree "~/quickstart/content/posts/journal.org")
                              "* %?\nEntered on %U\n %i\n %a")
                             ("s" "Screencast" entry (file "~/quickstart/content/posts/orgfiles/screencastnotes.org")
                              "* %?\n%i\n")))

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)
;; 这个快捷键绑定可以用之后的插件 counsel 代替
(global-set-key (kbd "C-x b") 'consult-buffer)

(use-package keycast
  :ensure t
  :config
  (keycast-mode))

(use-package vertico
  :ensure t
  :config
  (vertico-mode))

(use-package orderless
  :ensure t
  :config
  (setq completion-styles '(orderless)))

(use-package marginalia
  :ensure t
  :config
  (marginalia-mode))

(use-package embark
  :ensure t
  :config
  (global-set-key (kbd "C-;") 'embark-act)
  (setq prefix-help-command 'embark-prefix-help-command))

(use-package consult
  :ensure t
  :config
  (global-set-key (kbd "C-s") 'consult-line)
  (global-set-key (kbd "M-s i") 'consult-imenu))

(use-package magit
  :ensure t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(delete-selection-mode nil)
 '(package-selected-packages
   '(magit consult embark marginalia orderless vertico keycast org-bullets use-package monokai-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
