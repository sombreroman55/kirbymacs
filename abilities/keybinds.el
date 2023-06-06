;; Bind keys for useful functionality
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

(use-package general
  :ensure t
  :config
  (general-define-key
   :states '(normal visual insert emacs)
   :prefix "SPC"
   :non-normal-prefix "C-SPC"
   "fe" '(treemacs :which-key "toggle treemacs")
   "eb" '(eval-buffer :which-key "eval buffer")
   )
  )
