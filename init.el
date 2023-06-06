;; Make sure these are in the proper order
(setq kirbymacs-files '("abilities/packages.el"
			"abilities/broom.el"
			"abilities/keybinds.el"
			"abilities/completion.el"
			"abilities/ui.el"
			"abilities/lsp.el"
			"abilities/magit.el"
			"abilities/org.el"
			"abilities/roam.el"
			"abilities/evil.el"))

(dolist (kirby-file kirbymacs-files)
  (load-file (expand-file-name kirby-file user-emacs-directory)))
