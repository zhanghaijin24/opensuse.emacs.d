 
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

;;(add-to-list 'load-path "~/.emacs.d/lisp/")



(require 'cdlatex)

(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)

;;(set-face-attribute 'default nil :height 160)
(set-face-attribute 'default nil :font "source code pro-18")

(tool-bar-mode -1) 

(scroll-bar-mode -1)

(global-linum-mode 1)

(setq cursor-type 'bar)

(icomplete-mode 1)

(setq make-backup-files nil)


(electric-pair-mode t)

;; 更改光标的样式（不能生效，解决方案见第二集）
(setq cursor-type 'bar)

;;(icomplete-mode 1)

(setq inhibit-startup-screen t)

(toggle-frame-maximized)


(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; backwards compatibility as default-buffer-file-coding-system
;; is deprecated in 23.2.
(if (boundp 'buffer-file-coding-system)
    (setq-default buffer-file-coding-system 'utf-8)
  (setq default-buffer-file-coding-system 'utf-8))

(set-fontset-font "fontset-startup" 'chinese-big5-1
                  (font-spec :family "Noto Sans Mono CJK TC") nil t)

;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))


(setq org-image-actual-width '(150))

(setq org-latex-pdf-process '("xelatex -interaction nonstopmode %f"
                              "xelatex -interaction nonstopmode %f"))

(setq org-latex-logfiles-extensions
    (quote ("lof" "lot" "tex~" "tex" "aux"
      "idx" "log" "out" "toc" "nav"
      "snm" "vrb" "dvi" "fdb_latexmk"
      "blg" "brf" "fls" "entoc" "ps"
      "spl" "bbl" "xdv")))


(setq org-download-screenshot-method "flameshot gui --raw >%s")
; (setq org-download-method 'directory)
(setq-default org-download-heading-lvl nil)
(setq-default org-download-image-dir "./images")
(defun dummy-org-download-annotate-function (link)
  "")
(setq org-download-annotate-function
      #'dummy-org-download-annotate-function)





(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))


(global-set-key (kbd "<f2>") 'open-init-file)
(global-set-key (kbd "M-1") 'bookmark-jump)

(use-package  monokai-theme
  :ensure t
  :config
  (load-theme 'monokai 1))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(global-set-key (kbd "C-c c") 'org-capture)
(setq org-agenda-files (list "~/quickstart/content/posts/orgfiles/gcal.org"
                             "~/quickstart/content/posts/orgfiles/novel.org"
			     "~/quickstart/content/posts/orgfiles/github.org"
                            "~/quickstart/content/posts/orgfiles/schedule.org")) 

(setq org-capture-templates
      '(("a" "Appointment" entry (file+headline "~/quickstart/content/posts/orgfiles/gcal.org" "Appointments")
                       "* TODO %?\n:PROPERTIES:\n\n:END:\nDEADLINE: %^T \n %i\n")
		      
        ("g" "github" entry (file+headline "~/quickstart/content/posts/orgfiles/github.org" "linux")
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

(require ' recentf)
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

(use-package cdlatex
  :ensure t
  :config
  (add-hook 'LaTex-mode-hook 'turn-on-cdlatex))


(global-auto-revert-mode t)

(global-visual-line-mode 1)

(setq default-input-method "chinese-py")
(setq-default cursor-type 'bar)
(show-paren-mode t)

(use-package company
  :ensure t
  :config
  (global-company-mode)
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0.1)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous))

(use-package pandoc-mode
  :ensure t)

(use-package org-download
  :ensure t
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-command-list
   '(("TeX" "%(PDF)%(tex) %(file-line-error) %`%(extraopts) %S%(PDFout)%(mode)%' %(output-dir) %t" TeX-run-TeX nil
      (plain-tex-mode texinfo-mode ams-tex-mode)
      nil :help "Run plain TeX")
     ("LaTeX" "%`%l%(mode)%' %T" TeX-run-TeX nil
      (latex-mode doctex-mode)
      :help "Run LaTeX")
     ("Makeinfo" "makeinfo %(extraopts) %(o-dir) %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with Info output")
     ("Makeinfo HTML" "makeinfo %(extraopts) %(o-dir) --html %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with HTML output")
     ("AmSTeX" "amstex %(PDFout) %`%(extraopts) %S%(mode)%' %(output-dir) %t" TeX-run-TeX nil
      (ams-tex-mode)
      :help "Run AMSTeX")
     ("ConTeXt" "%(cntxcom) --once --texutil %(extraopts) %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt once")
     ("ConTeXt Full" "%(cntxcom) %(extraopts) %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt until completion")
     ("BibTeX" "bibtex %(O?aux)" TeX-run-BibTeX nil
      (plain-tex-mode latex-mode doctex-mode context-mode texinfo-mode ams-tex-mode)
      :help "Run BibTeX")
     ("Biber" "biber %(output-dir) %s" TeX-run-Biber nil
      (plain-tex-mode latex-mode doctex-mode texinfo-mode ams-tex-mode)
      :help "Run Biber")
     ("Texindex" "texindex %s.??" TeX-run-command nil
      (texinfo-mode)
      :help "Run Texindex")
     ("Texi2dvi" "%(PDF)texi2dvi %t" TeX-run-command nil
      (texinfo-mode)
      :help "Run Texi2dvi or Texi2pdf")
     ("View" "%V" TeX-run-discard-or-function t t :help "Run Viewer")
     ("Print" "%p" TeX-run-command t t :help "Print the file")
     ("Queue" "%q" TeX-run-background nil t :help "View the printer queue" :visible TeX-queue-command)
     ("File" "%(o?)dvips %d -o %f " TeX-run-dvips t
      (plain-tex-mode latex-mode doctex-mode texinfo-mode ams-tex-mode)
      :help "Generate PostScript file")
     ("Dvips" "%(o?)dvips %d -o %f " TeX-run-dvips nil
      (plain-tex-mode latex-mode doctex-mode texinfo-mode ams-tex-mode)
      :help "Convert DVI file to PostScript")
     ("Dvipdfmx" "dvipdfmx -o %(O?pdf) %d" TeX-run-dvipdfmx nil
      (plain-tex-mode latex-mode doctex-mode texinfo-mode ams-tex-mode)
      :help "Convert DVI file to PDF with dvipdfmx")
     ("Ps2pdf" "ps2pdf %f %(O?pdf)" TeX-run-ps2pdf nil
      (plain-tex-mode latex-mode doctex-mode texinfo-mode ams-tex-mode)
      :help "Convert PostScript file to PDF")
     ("Glossaries" "makeglossaries %(d-dir) %s" TeX-run-command nil
      (plain-tex-mode latex-mode doctex-mode texinfo-mode ams-tex-mode)
      :help "Run makeglossaries to create glossary file")
     ("Index" "makeindex %(O?idx)" TeX-run-index nil
      (plain-tex-mode latex-mode doctex-mode texinfo-mode ams-tex-mode)
      :help "Run makeindex to create index file")
     ("upMendex" "upmendex %(O?idx)" TeX-run-index t
      (plain-tex-mode latex-mode doctex-mode texinfo-mode ams-tex-mode)
      :help "Run upmendex to create index file")
     ("Xindy" "texindy %s" TeX-run-command nil
      (plain-tex-mode latex-mode doctex-mode texinfo-mode ams-tex-mode)
      :help "Run xindy to create index file")
     ("Check" "lacheck %s" TeX-run-compile nil
      (latex-mode)
      :help "Check LaTeX file for correctness")
     ("ChkTeX" "chktex -v6 %s" TeX-run-compile nil
      (latex-mode)
      :help "Check LaTeX file for common mistakes")
     ("Spell" "(TeX-ispell-document \"\")" TeX-run-function nil t :help "Spell-check the document")
     ("Clean" "TeX-clean" TeX-run-function nil t :help "Delete generated intermediate files")
     ("Clean All" "(TeX-clean t)" TeX-run-function nil t :help "Delete generated intermediate and output files")
     ("Other" "" TeX-run-command t t :help "Run an arbitrary command")))
 '(delete-selection-mode nil)
 '(org-agenda-files
   '("~/quickstart/content/posts/guotie-work.org" "~/quickstart/content/posts/orgfiles/gcal.org" "~/quickstart/content/posts/orgfiles/i.org" "~/quickstart/content/posts/orgfiles/schedule.org"))
 '(package-selected-packages
   '(auctex cdlatex org-download pandoc-mode company aucte x magit consult embark marginalia orderless vertico keycast org-bullets use-package monokai-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
