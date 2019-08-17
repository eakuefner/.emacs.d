(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(require 'evil)
(evil-mode 1)

(setq base16-theme-256-color-source "base16-shell")
(load-theme 'base16-default-light t)

(global-display-line-numbers-mode)

(add-to-list 'default-frame-alist
             '(font . "Anonymous Pro:pixelsize=16:antialias=true:autohint=true"))

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(tool-bar-mode 0)
