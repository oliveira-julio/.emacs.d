
(require 'package)
(package-initialize)
(setq package-enable-at-startup nil)
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)
(find-file "~/todo.org")

(setq user-full-name "Julio Oliveira"
      user-mail-address "antoniojuliodeo@gmail.com")

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)

(add-to-list 'load-path "~/.emacs.d/elisp/")
(add-to-list 'load-path "~/.emacs.d/elisp/themes/")

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; default directories
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

;; backup config
(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)

(fset 'yes-or-no-p 'y-or-n-p)

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(windmove-default-keybindings)

(setq inhibit-startup-screen  t
initial-scratch-message nil)

(use-package material-theme
  :ensure t
  :init
  (load-theme 'material t))

(line-number-mode   1)
(column-number-mode 1)

(global-hl-line-mode   1)
(show-paren-mode 1)

(use-package telephone-line
  :init
  (telephone-line-mode 1)
  :config
  (setq telephone-line-primary-left-separator 'telephone-line-cubed-left
        telephone-line-secondary-left-separator 'telephone-line-cubed-hollow-left
        telephone-line-primary-right-separator 'telephone-line-cubed-right
        telephone-line-secondary-right-separator 'telephone-line-cubed-hollow-right))

(display-battery-mode)
(display-time-mode)

(use-package linum
  :config
  (global-linum-mode t))

(use-package linum-relative
  :config
  (linum-relative-global-mode t))

(use-package guide-key
  :ensure t

  :config
  (setq guide-key/guide-key-sequence '("C-x r" "C-x 4"))
  (setq guide-key/guide-key-sequence '("C-x"))
  (setq guide-key/guide-key-sequence '("C-c"))
  (setq guide-key/recursive-key-sequence-flag t)

  :init
  (guide-key-mode 1))

(use-package helm
  :diminish helm-mode
  :init

  (progn
    (require 'helm-config)
    (helm-mode 1))

  
  :bind (("C-c h" . helm-mini)
         ("C-h a" . helm-apropos)
         ("C-x C-b" . helm-buffers-list)
         ("C-x C-f" . helm-find-files)
         ("C-x b" . helm-buffers-list)
         ("M-y" . helm-show-kill-ring)
         ("M-x" . helm-M-x)
         ("C-x c o" . helm-occur)
         ("C-x c s" . helm-swoop)
         ("C-x c y" . helm-yas-complete)
         ("C-x c Y" . helm-yas-create-snippet-on-region)
         ("C-x c b" . my/helm-do-grep-book-notes)
         ("C-x c SPC" . helm-all-mark-rings)))

(use-package yasnippet
  :ensure t)

(use-package org-bullets
  :ensure t)
(use-package org
  :ensure t
  :hook
  ((org-mode . org-indent-mode)
   (org-mode . org-bullets-mode)
   (org-mode . yas-minor-mode))
  :bind
  (("C-c l" . 'org-store-link)
   ("C-c a" . 'org-agenda)
   ("C-c c" . 'org-capture)
   ("C-c b" . 'org-iswitchb))
  :config
  (setq org-todo-keywords
        '((sequence "TODO(t)" "|" "DONE(d)")
          (sequence "|" "CANCELED(c)")))
  (setq org-log-done 'time))

(use-package avy
  :ensure t
  :bind
  (("C-c j" . avy-goto-char)))

(use-package expand-region
    :ensure t
    :bind
    (("C-=" . 'er/expand-region)))

(use-package multiple-cursors
  :ensure t
  :bind
  (("C-c C-<" . mc/mark-all-like-this)))

(use-package python
  :init
  (elpy-enable)

  :hook
  ((python-mode . pygen-mode)
   (python-mode . electric-operator-mode)
   (python-mode . yas-minor-mode))


  
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode))
