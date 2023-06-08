;; kirby-org.el --- Configure org-mode.	-*- lexical-binding: t -*-

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
;; Configure all our orgnode settings: keybindings, directories,
;; capture templates, agenda files, refile targets, etc., etc.
;;

;;; Code:

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

;;; kirby-org.el ends here
