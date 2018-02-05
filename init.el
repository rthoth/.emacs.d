;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)

(add-to-list 'package-archives
				 '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(add-to-list 'package-archives
				 '("melpa" . "https://melpa.org/packages/"))

;; Fetch the list of packages
(unless package-archive-contents (package-refresh-contents))

;; Install use-package if it doesn't installed.
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; use-package configurations
(setq use-package-always-ensure t)

;; use melpa-stable instead melpa
(setq use-package-always-pin "melpa-stable")

(defun small-font()
  "Set font size to small size"
  (interactive)
  (setq buffer-face-mode-face '(:size 6))
  (buffer-face-mode))

;; My packages!

(use-package ensime
  :config
  (setq ensime-startup-notification nil)
  (setq ensime-startup-snapshot-notification nil))

(use-package sbt-mode
  :config
  (add-hook 'sbt-mode-hook 'toggle-truncate-lines
				'small-font))

(use-package scala-mode
  :config
  (add-hook 'scala-mode-hook (lambda () (setq comment-start "/* "
															 comment-end " */"
															 comment-style 'multi-line
															 comment-empty-lines t)))
  (add-hook 'scala-mode-hook (lambda ()
										 (define-key scala-mode-map "\C-c\C-dd" 'ensime-db-attach))))

;;(use-package material-theme
;;  :config
;;  (load-theme 'material t))

(use-package zenburn-theme
  :config
  (load-theme 'zenburn t))

(use-package markdown-mode)

(use-package neotree
  :config
  (setq neo-theme 'nerd)
  (setq neo-smart-open nil)
  (setq projectile-switch-project-action 'neotree-projectile-action)
  :bind
  ("<f8>" . neotree-toggle))

(use-package projectile)

(use-package helm
  :config
  (setq helm-M-x-fuzzy-match t)
  (setq helm-completion-in-region-fuzzy-match t)
  (setq html-candidate-number-limit 5)
  :bind
  ("M-x" . helm-M-x)
  ("C-x C-f" . helm-find-files))

(use-package flx-ido
  :config
  (ido-mode 1)
  (ido-everywhere 1)
  (flx-ido-mode 1)
  (setq ido-enable-flex-matching t)
  (setq ido-use-faces nil))

(use-package groovy-mode)

(use-package gradle-mode)

(use-package json-mode)

(use-package multiple-cursors
  :bind
  (("C-S-c C-S-C" . mc/edit-lines)
	( "C->" . mc/mark-next-symbol-like-this)
	("C-<" . mc/mark-previous-symbol-like-this)
	("C-M-<mouse-1>" . mc/add-cursor-on-click)))

(use-package move-text
  :config
  (move-text-default-bindings))

(use-package tide
  :config
  (defun setup-tide-mode ()
	 (interactive)
	 (tide-setup)
	 (flycheck-mode +1)
	 (setq flycheck-check-syntax-automatically '(save mode-enabled))
	 (eldoc-mode +1)
	 (tide-hl-identifier-mode +1)
	 ;; company is an optional dependency. You have to
	 ;; install it separately via package-install
	 ;; `M-x package-install [ret] company`
	 (company-mode +1)))

(use-package js2-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)))

(use-package ace-window
  :bind
  ("M-[" . ace-window))

(use-package gulp-task-runner)

(use-package ace-jump-buffer
  :bind
  ("M-]" . ace-jump-buffer))

(use-package pug-mode)

(use-package magit)

(use-package hydra)

(use-package auto-package-update
  :config
  (auto-package-update-maybe))

;; This function is very important to me.
(defun setup-indent-new-comment-line ()
  (local-set-key (kbd "C-M-j") 'c-indent-new-comment-line))

(use-package elpy
  :config
  (elpy-enable))

(use-package adoc-mode)

(use-package goto-chg
  :bind
  (("C-." . goto-last-change)
	("C-," . goto-last-change-reverse)))

(use-package systemd)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-basic-offset 3)
 '(comment-multi-line t)
 '(indent-tabs-mode t)
 '(inhibit-startup-echo-area-message "Hello rthoth! How are your codes?")
 '(inhibit-startup-screen t)
 '(js-indent-level 3)
 '(menu-bar-mode nil)
 '(neo-force-change-root t)
 '(package-selected-packages
	(quote
	 (goto-chg adoc-mode elpy hydra untiled-new-buffer auto-package-update magit pug-mode ace-jump-buffer gulp-task-runner js2-mode flx-ido projectile ace-window tide move-text move-text-ensime multiple-cursors json-mode gradle-mode groovy-mode neotree markdown-mode material-theme ensime use-package)))
 '(prog-mode-hook
	(quote
	 (linum-mode column-number-mode show-paren-mode projectile-mode)))
 '(python-indent-offset 4)
 '(ring-bell-function (quote ignore))
 '(sbt:display-command-buffer nil)
 '(scala-indent:step 2)
 '(standard-indent 3)
 '(tab-width 3)
 '(text-mode-hook
	(quote
	 (text-mode-hook-identify column-number-mode linum-mode projectile-mode)))
 '(tool-bar-mode nil)
 '(truncate-lines t)
 '(typescript-indent-level 3)
 '(typescript-mode-hook (quote (setup-tide-mode setup-indent-new-comment-line)))
 '(visual-fill-column-width 80))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#3F3F3F" :foreground "#DCDCCC" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 105 :width normal :foundry "simp" :family "Hack"))))
 '(ensime-implicit-highlight ((t (:underline nil)))))
