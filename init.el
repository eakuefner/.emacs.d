(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

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
 ((string= system-name "DESKTOP")
  (add-to-list 'default-frame-alist
	       '(font . "Anonymous Pro:pixelsize=24:antialias=true:autohint=true")))
 (t (add-to-list 'default-frame-alist
	         '(font . "Anonymous Pro:pixelsize=16:antialias=true:autohint=true"))))

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
       :if-new (file+head "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n"))))
  :bind (("C-c n f" . org-roam-node-find)
	 ("C-c n l" . org-roam-buffer-toggle)
	 ("C-c n i" . org-roam-node-insert))
  :bind-keymap ("C-c n d" . org-roam-dailies-map)
  :config
  (org-roam-db-autosync-enable)
  (require 'org-roam-dailies))

(add-hook 'write-file-hooks 'delete-trailing-whitespace)
