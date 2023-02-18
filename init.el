(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(require 'evil)
(evil-mode 1)

(load-theme 'leuven t)

(global-display-line-numbers-mode)
(column-number-mode)

(cond
 ((string= system-name "DESKTOP")
  (add-to-list 'default-frame-alist
	       '(font . "Anonymous Pro:pixelsize=32:antialias=true:autohint=true")))
 (t (add-to-list 'default-frame-alist
	         '(font . "Anonymous Pro:pixelsize=18:antialias=true:autohint=true"))))

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-adapt-indentation 'headline-data)

(tool-bar-mode 0)

(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'none)

(defun my-org-hook ()
  (setq fill-column 80)
  (visual-line-mode)
  (auto-fill-mode))

(add-hook 'org-mode-hook #'my-org-hook)
