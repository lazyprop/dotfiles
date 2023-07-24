(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("4320a92406c5015e8cba1e581a88f058765f7400cf5d885a3aa9b7b9fc448fa7" default))
 '(package-selected-packages
   '(doom-themes modus-themes cuda-mode neuron-mode dired-x vterm evil use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Turn off some unneeded UI elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode 0)
(setq make-backup-files nil)
(setq display-line-numbers 'relative)


(add-hook 'prog-mode-hook (lambda () (display-line-numbers-mode)))
(add-hook 'text-mode-hook (lambda () (display-line-numbers-mode)))

(require 'dired-x)
(setq dired-omit-files "^\\...+$")
(add-hook 'dired-mode-hook (lambda () (dired-omit-mode 1)))

(set-frame-font "Source Code Pro 14" nil t)

(use-package linum-relative
  :ensure t
  
  :config
  ;(add-hook 'prog-mode-hook 'linum-on)
  ;(add-hook 'text-mode-hook 'linum-on)
  )

(use-package evil
  :ensure t

  :init
  (setq evil-want-keybinding nil)

  :custom
  (evil-want-C-u-scroll t)

  :config
  (evil-mode 1))


(use-package evil-collection
  :after evil

  :config
  (evil-collection-init))


(use-package base16-theme
  :ensure t
  :config
  ;(load-theme 'base16-default-dark t)
  )

(use-package modus-themes
  :ensure t
  :config
  ;(load-theme 'modus-operandi)
  )

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one-light t)
  )

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

(use-package vterm
  :ensure t

  :config
  (add-hook 'vterm-mode-hook 'turn-off-evil-mode)
  ;(add-hook 'vterm-mode-hook (lambda () (linum-mode 0)))
  )

(use-package neuron-mode
  :ensure t)

(use-package cuda-mode
  :ensure t)

(defun reload-config ()
  (interactive)
  (load-file "~/.config/emacs/init.el"))
