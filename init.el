(if (eq system-type 'windows-nt)
    (set-language-environment 'UTF-8))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(setq inhibit-startup-message t)

(eval-when-compile (require 'use-package))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(require 'evil)
(evil-mode 1)
(evil-set-undo-system 'undo-redo)

(load-theme 'leuven t)

(global-display-line-numbers-mode)
(column-number-mode)

(cond
 ((string= system-name "GAMER")
  (add-to-list 'default-frame-alist
	       '(font . "IBM Plex Mono Text:pixelsize=24:antialias=true:autohint=true")))
 ((string= system-name "a.localdomain")
  (add-to-list 'default-frame-alist
	       '(font . "IBM Plex Mono Text:pixelsize=15:antialias=true:autohint=true")))
 (t (add-to-list 'default-frame-alist
	         '(font . "IBM Plex Mono Text:pixelsize=16:antialias=true:autohint=true"))))

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

(use-package org-roam
  :ensure t
  :custom
  (org-roam-dailies-capture-templates
    '(("d" "default" entry "* %<%H:%M>\n\n%?"
       :empty-lines 1
       :if-new (file+head "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n"))))
  :bind (("C-c n f" . org-roam-node-find)
	 ("C-c n l" . org-roam-buffer-toggle)
	 ("C-c n i" . org-roam-node-insert))
  :bind-keymap ("C-c n d" . org-roam-dailies-map)
  :config
  (org-roam-db-autosync-enable)
  (require 'org-roam-dailies))

(add-hook 'write-file-hooks 'delete-trailing-whitespace)

(use-package rg
  :config
  (rg-enable-default-bindings))

(defun eakuefner/org-roam-status ()
  (interactive)
  (magit-status "~/org-roam"))

(define-key global-map "\M-o" #'eakuefner/org-roam-status)

(defun eakuefner/line-number-toggle ()
  (interactive)
  (cond
   ((eq display-line-numbers 't)
      (setq display-line-numbers 'relative))
   ((eq display-line-numbers 'relative)
      (setq display-line-numbers 't))))

(define-key global-map "\M-n" #'eakuefner/line-number-toggle)

(defun jstor-insert-bibtex ()
  (interactive)
  (doi-insert-bibtex
   (concat "10.2307/"
	   (read-from-minibuffer "JSTOR id: "))))
