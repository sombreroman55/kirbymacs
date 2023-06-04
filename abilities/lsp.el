;; Install and configure LSP-related packages
(use-package lsp-mode
  :ensure t
  :hook (c-mode c++-mode)
  :commands lsp)

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
        company-idle-delay 0.0))

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

;; Additional configurations specific to C/C++ development
(defun kirby/c++-mode-hook ()
  ;; Set specific options for C++ mode
  (setq c++-tab-always-indent t
        c-basic-offset 4))

(add-hook 'c++-mode-hook 'kirby/c++-mode-hook)
