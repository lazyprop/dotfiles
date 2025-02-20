(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("0f76f9e0af168197f4798aba5c5ef18e07c926f4e7676b95f2a13771355ce850" default))
 '(package-selected-packages
   '(nix-mode lsp-ui lsp-mode rust-mode magit auctex haskell-mode which-key org org-roam ivy flx undo-tree use-package perspective neuron-mode multi-vterm modus-themes evil-collection doom-themes cuda-mode base16-theme)))
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
(setq-default display-fill-column-indicator-column 80)
(setq-default truncate-lines t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq-default fill-column 80)
(setq-default frame-resize-pixelwise t)
;(setq indent-line-function 'insert-tab)

(define-key global-map (kbd "C-<return>") 'my-compile)
(setq-default compile-command "make -B")


(add-to-list 'auto-mode-alist '("\\.rs\\'" . prog-mode))


(setq default-frame-alist '((font . "Source Code Pro 12")))

(setq display-line-numbers-type 'relative) 
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'text-mode-hook 'display-line-numbers-mode)

(add-hook 'prog-mode-hook 'display-fill-column-indicator-mode)
(add-hook 'text-mode-hook 'display-fill-column-indicator-mode)

(defun reload-config ()
  (interactive)
  (load-file "~/.config/emacs/init.el"))

(defun my-compile ()
  "Choose an appropriate compilation function based on current major mode."
  (interactive)
  (call-interactively
   (cond ((eq major-mode 'latex-mode) 'tex-compile)
         (t 'compile))))

(use-package dired
  :ensure nil
  :commands (dired dired-jump)
  :custom
  (dired-kill-when-opening-new-dired-buffer t)
  (dired-listing-switches "-alh")
  :config
  (evil-collection-define-key 'normal 'dired-mode-map
    "h" 'dired-up-directory
    "l" 'dired-find-file
    "H" 'dired-omit-mode))

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
  :ensure t
  :config
  (evil-collection-init))

(use-package base16-theme
  :ensure t)

(use-package modus-themes
  :ensure t
  :config)

(use-package doom-themes
  :ensure t)

(use-package vterm
  :ensure t
  :config
  (add-hook 'vterm-mode-hook 'turn-off-evil-mode))

(use-package neuron-mode
  :ensure t)

(use-package cuda-mode
  :ensure t
  :config
  (add-hook 'cuda-mode-hook 'display-line-numbers-mode))

(use-package multi-vterm
  :ensure t
  :config
  (define-key global-map (kbd "M-t") 'multi-vterm-dedicated-toggle))

(use-package perspective
  :ensure t
  :bind
  ("C-x C-b" . persp-list-buffers)
  :custom
  (persp-mode-prefix-key (kbd "C-SPC"))
  :init
  (persp-mode))

(use-package undo-tree
  :ensure t
  :after evil
  :custom
  (undo-tree-history-directory-alist '(("." . "~/.config/emacs/undo")))
  :config
  (evil-set-undo-system 'undo-tree)
  (global-undo-tree-mode 1))

(use-package flx
  :ensure t)

(use-package ivy
  :ensure t
  :custom
  (ivy-re-builders-alist '((t . ivy--regex-fuzzy)))
  :config
  (ivy-mode 1))

(use-package org
  :ensure t)

(use-package org-roam
  :after org
  :ensure t
  :custom
  (org-roam-directory (file-truename "~/roam")))


(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package haskell-mode
  :ensure t)

(use-package tex
  :ensure auctex)

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)
         ("C-x C-g" . magit-status)))

(use-package rust-mode
  :ensure t)

(add-hook 'rust-mode-hook
          (lambda () (setq indent-tabs-mode nil)))

;(load-theme 'base16-seti)
(load-theme 'modus-vivendi)
(c-set-offset 'innamespace '0)

(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)
(setq gdb-many-windows t)

(setq rust-indent-offset 2)

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook
  (lsp-mode . lsp-enable-which-key-integration)
  (rust-mode . lsp)
  )
  

(use-package lsp-ui
  :ensure t)

(use-package nix-mode
  :ensure t)
