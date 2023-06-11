;; kirby-projectile.el --- Configure projectile.	-*- lexical-binding: t -*-

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
;; Configure projectile and projectile-specific keybindings
;;

;;; Code:

(use-package projectile
  :straight t
  :init
  (projectile-mode +1)
  )

;; TODO: Set up any desired keybindings
(require 'general)
;; Projectile keybindings
(general-define-key
 :states '(normal visual insert emacs)
 :keymaps 'projectile-mode-map
 :prefix "SPC"
 :non-normal-prefix "C-SPC"
 "p" 'projectile-command-map
 )

(provide 'kirby-projectile)

;;; kirby-projectile.el ends here
