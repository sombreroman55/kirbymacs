;; Enable Org Mode
(use-package org)

;; Set the default location for Org files
(setq org-directory "~/orgmode")

;; Load Org Mode modules
(with-eval-after-load 'org
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (python . t)
     (C . t)
     ; Add more languages here as needed
     )))

;; Set keybinding for Org Agenda
(global-set-key (kbd "C-c a") 'org-agenda)
(add-hook 'org-mode-hook 'turn-on-auto-fill)
(add-hook 'org-mode-hook (lambda() (setq fill-column 100)))

;; TODO: Create capture templates

;; TODO: Create custom agenda views

(provide 'kirby-org)
