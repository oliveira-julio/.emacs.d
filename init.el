
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

(load-theme 'material t)

(require 'helm)
(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(windmove-default-keybindings)

(setq inhibit-startup-screen  t
initial-scratch-message nil)

(line-number-mode   1)
(column-number-mode 1)

(global-hl-line-mode   1)
(show-paren-mode 1)

(require 'telephone-line)
(telephone-line-mode 1)
(setq telephone-line-primary-left-separator 'telephone-line-cubed-left
      telephone-line-secondary-left-separator 'telephone-line-cubed-hollow-left
      telephone-line-primary-right-separator 'telephone-line-cubed-right
      telephone-line-secondary-right-separator 'telephone-line-cubed-hollow-right)

(display-battery-mode)
(display-time-mode)

(require 'ido)
(ido-mode t)

(require 'linum)
(require 'linum-relative)
(global-linum-mode t)
(linum-relative-global-mode t)

(require 'org-learn)
(require 'org-drill)
(require 'org-bullets)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d)")
        (sequence "|" "CANCELED(c)")))

(setq org-log-done 'time)

;; (setq org-agenda-files '("~/Dropbox/org/agenda"))

(add-hook 'org-mode-hook (lambda () (org-indent-mode 1)))

(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(require 'yasnippet)

(yas-global-mode 1)

(use-package python
  :init
  (elpy-enable)

  :hook
  ((python-mode . pygen-mode)
   (python-mode . electric-operator-mode))


  
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode))

(global-set-key (kbd "C-c j") 'avy-goto-char)

(global-set-key (kbd "C-=") 'er/expand-region)

(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
