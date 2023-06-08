;; Set the context
;; TODO: Figure out a better way to configure this
(setq context (cond ((string-equal system-name "culex") "home")
		    ((string-equal system-name "gunyolk") "work")))

(add-to-list 'load-path (expand-file-name "abilities" user-emacs-directory))

(require 'kirby-packages)
(require 'kirby-broom)
(require 'kirby-keybinds)
(require 'kirby-completion)
(require 'kirby-ui)
(require 'kirby-lsp)
(require 'kirby-magit)
(require 'kirby-org)
(require 'kirby-roam)
(require 'kirby-evil)
