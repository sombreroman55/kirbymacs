;; Install and configure LSP-related packages
(use-package lsp-mode
  :ensure t
  :commands lsp
  :config
  (setq lsp-prefer-flymake nil)) ; Use lsp-ui and flycheck instead of flymake

(use-package lsp-ui
  :ensure t
  :hook (lsp-mode . lsp-ui-mode))

(use-package company-lsp
  :ensure t
  :commands company-lsp)

(use-package lsp-treemacs
  :ensure t
  :commands lsp-treemacs-errors-list)

;; Configure debugging with GDB
(use-package dap-mode
  :ensure t
  :after lsp-mode
  :config
  (dap-mode 1)
  (dap-ui-mode 1))

;; Enable diagnostics
(use-package flycheck
  :ensure t
  :hook (lsp-mode . flycheck-mode))

;; Enable LSP integration with company for autocompletion
(use-package company
  :ensure t
  :hook (prog-mode . company-mode)
  :config
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.0)
  :bind (:map company-active-map
              ("<tab>" . company-select-next)
              ("<backtab>" . company-select-previous)))

;; Bind keys for useful functionality
(use-package general
  :ensure t
  :config
  (general-define-key
   :states '(normal visual insert emacs)
   :prefix "SPC"
   :non-normal-prefix "C-SPC"
   "cc" '(compile :which-key "compile")
   "db" '(dap-breakpoint-toggle :which-key "toggle breakpoint")
   "dc" '(dap-continue :which-key "continue")
   "dr" '(dap-ui-repl :which-key "repl")
   "ds" '(dap-switch-session :which-key "switch session")
   "de" '(dap-debug :which-key "debug")
   "di" '(dap-hydra :which-key "debugger hydra")
   "dl" '(dap-ui-locals :which-key "locals")
   "dL" '(dap-ui-sessions :which-key "sessions")
   "dv" '(dap-ui-variables :which-key "variables")
   "dx" '(dap-disconnect :which-key "disconnect")
   "g" '(magit-status :which-key "git status")
   "h" '(lsp-describe-thing-at-point :which-key "help")))

(defun kirby/add-lsp-hooks (mode-hook)
  (add-hook mode-hook #'lsp)
  (add-hook mode-hook #'company-mode))

;; Add language hooks below (see ./langs for language-specific configurations)
(kirby/add-lsp-hooks 'c-mode-common-hook)

(add-to-list 'load-path "~/.emacs.d/abilities/langs")
(require 'kirby-lang-c)

(provide 'kirby-lsp)
