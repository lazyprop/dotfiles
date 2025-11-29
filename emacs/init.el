(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("5e39e95c703e17a743fb05a132d727aa1d69d9d2c9cde9353f5350e545c793d4"
     "f700bc979515153bef7a52ca46a62c0aa519950cc06d539df4f3d38828944a2c"
     "6bf350570e023cd6e5b4337a6571c0325cec3f575963ac7de6832803df4d210a"
     "5d09ffe65f025fd9f51304aad148140d18ce14411d20b9e563f27581b0305af9"
     "1b0db76a9b417336906972209ca4b2bf1f0755f6c2013b772cb26117cc326eda"
     "d81457b350b6b3ba9cf98b589b76b16faef3918e5857d302839484bdef9f58ac"
     "13794b95ba118a1e0f60fe880be9c8a79d881aeb2203656a092f462b2b601629"
     "dfa1e5afbab42ab2924102e11672a2731c53347ce078b734d9816f1d4429f68a"
     "77f281064ea1c8b14938866e21c4e51e4168e05db98863bd7430f1352cab294a"))
 '(package-selected-packages
   '(base16-theme base16-themes evil-collection gptel haskell-mode magit marginalia
                  modus-themes paredit racket-mode rust-mode undo-tree vertico)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'use-package)
(setq use-package-always-ensure t)  ; Automatically install packages

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Core Emacs settings
;; Use setq-default for buffer-local variables, setq for global ones
(setq-default make-backup-files nil)
(setq-default display-line-numbers-type 'relative)  ;; Note: was display-line-type in original
(setq-default inhibit-startup-message t)
(setq-default initial-scratch-message nil)
(setq-default display-fill-column-indicator-column 80)
(setq-default truncate-lines t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq-default fill-column 80)
(setq-default frame-resize-pixelwise t)
(setq-default compile-command "make -B")
(setq default-frame-alist '((font . "Source Code Pro 13")))
(setq display-line-numbers-type 'relative)
(setq gdb-many-windows t)
(setq rust-indent-offset 2)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode 0)


(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'text-mode-hook 'display-line-numbers-mode)
(add-hook 'prog-mode-hook 'display-fill-column-indicator-mode)
(add-hook 'text-mode-hook 'display-fill-column-indicator-mode)
(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)

;; Key bindings
;; (add-hook 'prog-mode-hook
;; 	  (lambda () (local-set-key (kbd "C-c C-c") 'compile)))

;; C/C++ settings
(c-set-offset 'innamespace '0)

;; Custom functions
(defun reload-config ()
  "Reload the Emacs configuration."
  (interactive)
  (load-file "~/.config/emacs/init.el"))

(defun my-compile ()
  "Choose an appropriate compilation function based on current major mode."
  (interactive)
  (call-interactively
    (cond ((eq major-mode 'latex-mode) 'tex-compile)
	  (t 'compile))))

(use-package undo-tree
  :ensure t)

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

(use-package dired
  :ensure nil
  :after evil
  :commands (dired dired-jump)
  :custom
  (dired-kill-when-opening-new-dired-buffer t)
  (dired-listing-switches "-alh")
  :config
  (evil-collection-define-key 'normal 'dired-mode-map
    "h" 'dired-up-directory
    "l" 'dired-find-file
    "H" 'dired-omit-mode))

(use-package modus-themes
  :ensure t)

(use-package base16-theme
  :ensure t)

(load-theme 'modus-vivendi t)

(use-package vertico
  :ensure t
  :init
  (vertico-mode))

(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))

(use-package org
  :ensure t
  :hook
  (org-mode . (lambda ()
                (display-line-numbers-mode -1)
                (toggle-truncate-lines))))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package haskell-mode
  :ensure t)

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)
         ("C-x C-g" . magit-status)))

(use-package rust-mode
  :ensure t
  :hook
  (rust-mode . (lambda () (setq indent-tabs-mode nil)))
  (rust-mode . eglot-ensure))


(use-package eglot
  :ensure t
  :hook
  (haskell-mode . eglot-ensure))

(use-package racket-mode
  :ensure t)

(use-package paredit
  :ensure t)

(use-package gptel
  :ensure t
  :config
  (setq gptel-default-mode 'org-mode)
  (gptel-make-openai "Cerebras"
    :host "api.cerebras.ai"
    :endpoint "/v1/chat/completions"
    :stream t
    :models '(qwen-3-235b-a22b-instruct-2507
              llama3.1-70b
              llama3.1-8b)))


