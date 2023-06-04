(message "Hello from Kirbymacs!")

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; Make sure these are in the proper order
(setq kirbymacs-files '("abilities/packages.el"
			"abilities/broom.el"
			"abilities/ui.el"
			"abilities/lsp.el"
			"abilities/magit.el"
			"abilities/org.el"
			"abilities/roam.el"
			"abilities/evil.el"))

(dolist (config-file kirbymacs-files)
  (load-file (expand-file-name config-file user-emacs-directory)))
