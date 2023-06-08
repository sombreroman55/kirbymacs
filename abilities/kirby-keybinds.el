;; kirby-keybinds.el --- Initialize top-level keybindings.	-*- lexical-binding: t -*-

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
;; Set up global, top-level Kirbymacs keybindings. Package-specific (i.e magit)
;; and mode-specific (i.e. c-common-mode) keybindings can be found in their
;; speicific configuration files
;;

;;; Code:

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

;;; kirby-keybinds.el ends here
