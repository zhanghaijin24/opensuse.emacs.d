(require 'package)
(setq package-archives '(("gnu" . "http://elpa.zilongshanren.com/gnu/")
			 ("melpa" . "http://elpa.zilongshanren.com/melpa/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-init-file)

(set-face-attribute 'default nil :height 160)

(require 'recentf)
(recentf-mode 1)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

(tool-bar-mode -1)

(scroll-bar-mode -1)

(global-linum-mode 1)

(setq inhibit-startup-screen t)

(setq make-backup-files nil)

(global-auto-revert-mode t)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))
(require 'cdlatex)
(mapc (lambda (mode)
	(add-hook 'LaTeX-mode-hook mode))
      (list 'turn-on-cdlatex
	    'reftex-mode
	    'outline-minor-mode
	    'auto-fill-mode
	    'flyspell-mode
	    'hide-body t))

(add-hook 'LaTeX-mode-hook
	  (lambda()
	    (add-to-list 'TeX-command-list
			 '("XeLaTeX" "%`xelatex%(mode)%' %t"
			   TeX-run-TeX nil t))
	    (setq TeX-command-default "XeLaTeX")
	    (setq TeX-save-query nil)))

(setq outline-minor-mode-prefix [(control o)])

(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "M-1") 'bookmark-jump)
(setq org-agenda-files (list "~/quickstart/content/posts/orgfiles/gcal.org"
                             "~/quickstart/content/posts/orgfiles/novel.org"
			     "~/quickstart/content/posts/orgfiles/github.org"
                            "~/quickstart/content/posts/orgfiles/schedule.org")) 

(setq org-capture-templates
      '(("a" "Appointment" entry (file+headline "~/quickstart/content/posts/orgfiles/gcal.org" "Appointments")
                       "* TODO %?\n:PROPERTIES:\n\n:END:\nDEADLINE: %^T \n %i\n")
		      
        ("g" "opensuse" entry (file+headline "~/quickstart/content/posts/orgfiles/github.org" "opensuse")
         "* %?\n%T" :prepend t)
	("w" "win10" entry (file+headline "~/quickstart/content/posts/orgfiles/github.org" "win10")
          "* %?\n%T" :prepend t)
	("m" "Macos" entry (file+headline "~/quickstart/content/posts/orgfiles/github.org" "Macos")
         "* %?\n%T" :prepend t)
			      
        ("l" "link" entry (file+headline "~/quickstart/content/posts/orgfiles/links.org" "Links")
         "* %? %^L %^g \n%T" :prepend t)
			     
        ("h" "haijin" entry (file+headline "~/quickstart/content/posts/orgfiles/novel.org" "haijin")
         "* %?\n%T" :prepend t)
			     
        ("n" "novel" entry (file+headline "~/quickstart/content/posts/orgfiles/novel.org" "author")
         "* %?\n%T" :prepend t)

        ("j" "Journal" entry (file+datetree "~/quickstart/content/posts/orgfiles/journal.org")
         "* %?\nEntered on %U\n %i\n %a")
			     
        ("s" "Screencast" entry (file "~/quickstart/content/posts/orgfiles/screencastnotes.org")
         "* %?\n%i\n")))

(when (fboundp 'set-charset-priority)
    (set-charset-priority 'unicode))
  (prefer-coding-system 'utf-8)
  (setq locale-coding-system 'utf-8)
  (setq system-time-locale "C")
  (unless (eq system-type 'windows-nt)
    (set-selection-coding-system 'utf-8))

(use-package monokai-theme
  :ensure t
  :config
  (load-theme 'monokai 1))

(use-package company
  :ensure t
  :config
  (global-company-mode)
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0.1)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-command-Show "XeLaTex")
 '(cdlatex-paired-parens "$[{(<")
 '(delete-selection-mode nil)
 '(package-selected-packages '(auctex company monokai-theme use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
