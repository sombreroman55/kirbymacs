(message "Hello from Kirbymacs!")

(setq confirm-kill-emacs #'yes-or-no-p)

;; Make sure these are in the proper order
(setq droomacs-files '("abilities/packages.el"
		       "abilities/broom.el"
		       "abilities/ui.el"
		       "abilities/evil.el"
		       "abilities/magit.el"
		       "abilities/org.el"
		       "abilities/roam.el"))

(dolist (config-file droomacs-files)
  (load-file (expand-file-name config-file user-emacs-directory)))
