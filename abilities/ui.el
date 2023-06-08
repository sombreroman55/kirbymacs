; UI settings
(setq inhibit-splash-screen t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(tooltip-mode -1)
(scroll-bar-mode -1)
(set-fringe-mode 5)

(use-package hl-todo
  :hook (prog-mode . hl-todo-mode)
  :config
  (setq hl-todo-highlight-punctuation ":"
	hl-todo-keyword-faces
	`(("TODO"       warning bold)
	  ("FIXME"      error bold)
	  ("HACK"       font-lock-constant-face bold)
	  ("REVIEW"     font-lock-keyword-face bold)
	  ("NOTE"       success bold)
	  ("DEPRECATED" font-lock-doc-face bold))))

(use-package all-the-icons)
(use-package eterm-256color
  :hook (term-mode . eterm-256color-mode))

(use-package gruvbox-theme)
(load-theme 'gruvbox-dark-hard t)

(use-package rainbow-mode)
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(defun kirby/set-font ()
  (set-face-attribute 'default nil :font "JetBrainsMonoNL Nerd Font" :height 96))

(if (daemonp)
    (add-hook 'server-after-make-frame-hook #'kirby/set-font)
  (kirby/set-font))

(column-number-mode)
(global-display-line-numbers-mode t)
(setq fill-column 100)

(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(provide 'kirby-ui)
