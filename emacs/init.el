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
   '(undo-tree use-package perspective neuron-mode multi-vterm modus-themes linum-relative evil-collection doom-themes dashboard cuda-mode base16-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode 0)

(setq-default make-backup-files nil)
(setq-default display-line-type 'relative)
(setq-default inhibit-startup-message t) 
(setq-default initial-scratch-message nil)
(setq-default indent-tabs-mode nil)
(setq-default display-fill-column-indicator-column 80)
(setq-default truncate-lines t)
(setq-default undo-tree-history-directory-alist '(("." . "~/.config/emacs/undo")))

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'text-mode-hook 'display-line-numbers-mode)

(add-hook 'prog-mode-hook 'display-fill-column-indicator-mode)
(add-hook 'text-mode-hook 'display-fill-column-indicator-mode)

(set-frame-font "Source Code Pro 14" nil t)

(defun reload-config ()
  (interactive)
  (load-file "~/.config/emacs/init.el"))

(use-package dired
  :ensure nil
  :commands (dired dired-jump)
  :config
  (evil-collection-define-key 'normal 'dired-mode-map
    "h" 'dired-up-directory
    "l" 'dired-find-file
    "H" 'dired-omit-mode)
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
  (load-theme 'modus-operandi)
  )

(use-package doom-themes
  :ensure t
  :config
  ;(load-theme 'doom-one-light t)
  )

(use-package dashboard
  :ensure t
  ;:config
  ;(dashboard-setup-startup-hook)
  )

(use-package vterm
  :ensure t
  :config
  (add-hook 'vterm-mode-hook 'turn-off-evil-mode)
  ;(add-hook 'vterm-mode-hook (lambda () (linum-mode 0)))
  )

(use-package neuron-mode
  :ensure t)

(use-package cuda-mode
  :ensure t
  :config
  (add-hook 'cuda-mode-hook 'display-line-numbers-mode)
  )

(use-package multi-vterm
  :ensure t
  )

(use-package perspective
  :ensure t
  :bind
  ("C-x C-b" . persp-list-buffers)
  :custom
  (persp-mode-prefix-key (kbd "C-SPC"))
  :init
  (persp-mode)
  )

(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode))
