(setq default-directory "~/")

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(add-to-list 'package-archives
	      '("melpa" . "https://melpa.org/packages/")
	      t)

(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files '("~/Documents/agenda.org"))
 '(package-selected-packages
   '(aggressive-indent haskell-mode proof-general vterm racket-mode paredit evil-collection auto-complete dashboard which-key rust-mode ranger xkcd base16-theme evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; evil
(setq evil-want-C-u-scroll t)
(setq evil-want-keybinding nil)
(evil-collection-init)

(require 'evil)
(evil-mode 1)


(load-theme 'base16-default-dark t)

;; disable useless things
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)
(setq make-backup-files nil)

;; line numbers
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)
;;(add-hook 'text-mode-hook (lambda () (display-line-numbers-mode 1)))

(setq default-frame-alist '((font . "Source Code Pro-14")))

(define-key key-translation-map (kbd "ESC") (kbd "C-g"))

(defun start-cmd () (interactive)
       (let
	   ((proc
	     (start-process
	      "cmd" nil "cmd.exe"
	      "/C" "start" "cmd.exe")))

	 (set-process-query-on-exit-flag proc nil)))


(require 'rust-mode)
;(add-hook 'rust-mode-hook (lambda () (setq indent-tabs-mode nil)))


(require 'which-key)
(which-key-mode)

(require 'dashboard)
(dashboard-setup-startup-hook)

;; auto complete
(ac-config-default)
(ac-set-trigger-key "TAB")
(setq ac-auto-start nil)

(add-to-list 'ac-modes 'rust-mode)
(add-to-list 'ac-modes 'racket-mode)
(add-to-list 'ac-modes 'racket-repl-mode)


(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook (lambda () (set-fill-column 80)))

(setq ring-bell-function 'ignore)

;(setq indent-tabs-mode nil)
(setq tab-width 4)
(setq indent-line-function 'insert-tab)

;;;; Lisping

;; enable paredit on lisp modes
(autoload 'enable-paredit-mode "paredit" t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'racket-mode-hook           #'enable-paredit-mode)

(add-hook 'paredit-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-0") 'paredit-forward-slurp-sexp)))

(add-hook 'paredit-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-9") 'paredit-backward-slurp-sexp)))

;; disable autoindentation
;(when (fboundp 'electric-indent-mode) (electric-indent-mode -1))


;;; Haskelling
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
