;; Bind keys for useful functionality
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

(use-package general
  :ensure t)

;; GLobal keybindings
(general-define-key
 :states '(normal visual insert emacs)
 :keymaps 'override
 :prefix "SPC"
 :non-normal-prefix "C-SPC"
 "f e" '(treemacs :which-key "toggle treemacs")
 "e k" '((lambda () (interactive) (find-file "~/.emacs.d/init.el")) :which-key "edit kirbymacs config")
 )

(provide 'kirby-keybinds)
