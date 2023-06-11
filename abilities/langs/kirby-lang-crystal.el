;; kirby-lang-crystal.el --- Configure Crystal settings.	-*- lexical-binding: t -*-

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
;; Configure settings and hooks for Crystal
;;

;;; Code:

(use-package crystal-mode)
(with-eval-after-load 'lsp-mode
  (add-to-list 'lsp-language-id-configuration
	       '(crystal-mode . "crystal"))
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection '("/home/droo/lsps/crystalline"))
		    :activation-fn (lsp-activate-on "crystal")
		    :priority '1
		    :server-id 'crystalline)))

(defun kirby/crystal-mode-hook ()
  (require 'lsp-mode)
  (require 'company)
  (lsp-deferred)
  (company-mode))

(add-hook 'crystal-mode-hook 'kirby/crsytal-mode-hook)

(provide 'kirby-lang-crystal)

;;; kirby-lang-crystal.el ends here
