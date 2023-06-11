;; kirby-lang-lua.el --- Configure common C settings.	-*- lexical-binding: t -*-

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
;; Configure settings and hooks for all C common modes
;;

;;; Code:

(require 'lsp-mode)
(require 'company)
(defun kirby/lua-mode-hook ()
  (setq c-tab-always-indent t
        c-basic-offset 4)
  #'lsp-deferred
  #'company-mode)

(add-hook 'lua-mode-hook 'kirby/lua-mode-hook)

(provide 'kirby-lang-lua)

;;; kirby-lang-lua.el ends here
