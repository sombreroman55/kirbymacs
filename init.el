;; Put these first. I don't want any junk even if the rest of the
;; init process fails
(setq make-backup-file nil)
(setq auto-save-default nil)

;; Set the context
;; TODO: Figure out a better way to configure this
(setq context (cond ((string-equal system-name "culex") "home")
		    ((string-equal system-name "gunyolk") "work")))

(add-to-list 'load-path (expand-file-name "abilities" user-emacs-directory))

;; Make sure these are in the proper order
(require 'kirby-packages)
(require 'kirby-broom)
(require 'kirby-keybinds)
(require 'kirby-completion)
(require 'kirby-ui)
(require 'kirby-treesitter)
(require 'kirby-projectile)
(require 'kirby-lsp)
(require 'kirby-magit)
(require 'kirby-org)
(require 'kirby-roam)
(require 'kirby-evil)
(require 'kirby-dashboard)
