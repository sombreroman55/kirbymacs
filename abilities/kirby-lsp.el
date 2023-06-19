;; kirby-lsp.el --- Initialize Kirbymacs LSP configurations.	-*- lexical-binding: t -*-

;; Copyright (C) 2023-2023 Andrew Roberts

;; Author: Andrew Roberts <sombreroman55@gmail.com>
;; URL: https://github.com/sombreroman55/kirbymacs

;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.
;;

;;; Commentary:
;;
;; Kirbymacs LSP configuration.
;;

;;; Code:

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

(add-to-list 'load-path "~/.emacs.d/abilities/langs")

;; Require the languages you want here below
(require 'kirby-lang-c-common)
(require 'kirby-lang-elisp)
(require 'kirby-lang-lisp)
(require 'kirby-lang-python)

(provide 'kirby-lsp)

;;; kirby-lsp.el ends here
