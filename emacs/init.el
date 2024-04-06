(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("0f76f9e0af168197f4798aba5c5ef18e07c926f4e7676b95f2a13771355ce850" "703a3469ae4d2a83fd5648cac0058d57ca215d0fea7541fb852205e4fae94983" "c7a926ad0e1ca4272c90fce2e1ffa7760494083356f6bb6d72481b879afce1f2" "c1638a7061fb86be5b4347c11ccf274354c5998d52e6d8386e997b862773d1d2" "64045b3416d83e5eac0718e236b445b2b3af02ff5bcd228e9178088352344a92" "b29ba9bfdb34d71ecf3322951425a73d825fb2c002434282d2e0e8c44fce8185" "f60404efc40b646a6a742d833c7097f9225550288565f945ec990d343c1a22ff" "cc0dbb53a10215b696d391a90de635ba1699072745bf653b53774706999208e3" "91db2df9490180a006964179f3aa4fcbc6bbf63cdcba189b41ea1ff5a606df33" "bd98f90e425caa3219e9b2e44794130aefcb243bfcecdb8843e37df7f635bbf3" "bd17d0f6495c2626c493322ff37c64dc76ddb06c10dbadfead6a4f92775f00f3" "847025d7513316abf78a6a26eb785d7979d0fa891cee2dc76d519220c30d043d" "3e335d794ed3030fefd0dbd7ff2d3555e29481fe4bbb0106ea11c660d6001767" "4780d7ce6e5491e2c1190082f7fe0f812707fc77455616ab6f8b38e796cbffa9" "a242356ae1aebe9f633974c0c29b10f3e00ec2bc96a61ff2cdad5ffa4264996d" "aed3a896c4ea7cd7603f7a242fe2ab21f1539ab4934347e32b0070a83c9ece01" "e0b2f460b6bee1d7a09b90635b2995e801ff5ac1a7aa66ea9c5674cd0bf1bb7a" "8970a9dac879f60eee389caed568e9e3430a577604126de1540af5c41f5aaa60" "3d9512412d5874972f9142a6c230258e33ff1168d1d21aa68d7a568f328a400b" "62cf669c6e5c8a4295f9f8f71551abdb0f1a89aaf0dc82a9ecc41038c0320663" "039112154ee5166278a7b65790c665fe17fd21c84356b7ad4b90c29ffe0ad606" "f700bc979515153bef7a52ca46a62c0aa519950cc06d539df4f3d38828944a2c" "47610f9d6af7e30fbfb52fffe6de4c7de299792a7f0d09192a5b2b593c18931b" "eb50f36ed5141c3f702f59baa1968494dc8e9bd22ed99d2aaa536c613c8782db" "dedd42edff4429616c6a2072861066d685ff12ec132b2e97fdfd5361b9aacdae" "e071222c11229ae5719a78ad27c6bd55371a546aef5cfe43b747128fea90faeb" "4320a92406c5015e8cba1e581a88f058765f7400cf5d885a3aa9b7b9fc448fa7" default))
 '(package-selected-packages
   '(magit auctex haskell-mode which-key org org-roam ivy flx undo-tree use-package perspective neuron-mode multi-vterm modus-themes evil-collection doom-themes cuda-mode base16-theme)))
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
(setq-default tab-width 4)
(setq-default fill-column 80)
;(setq indent-line-function 'insert-tab)

(define-key global-map (kbd "C-<return>") 'my-compile)
(setq-default compile-command "make -B")


(set-frame-font "Source Code Pro 12" nil t)

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

(use-package w3m
  :ensure t)

;(load-theme 'base16-seti)
(load-theme 'modus-operandi)
(c-set-offset 'innamespace '0)

(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)
(setq gdb-many-windows t)
