;; kirby-evil.el --- Initialize evil keybindings.	-*- lexical-binding: t -*-

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
;; Stop fighting. Just use Evil mode. You'll be better off
;;

;;; Code:

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(defun toggle-evil-mode ()
  "Toggle between Evil mode and Emacs keybindings."
  (interactive)
  (if (bound-and-true-p evil-mode)
      (evil-mode -1)
    (evil-mode 1)))

(global-set-key (kbd "<f11>") 'toggle-evil-mode)

(use-package evil-escape
  :straight t
  :after evil
  :config
  (setq-default evil-escape-key-sequence "jk")
  (setq-default evil-escape-delay 0.3)
  (evil-escape-mode))

(define-key evil-visual-state-map (kbd "J") (concat ":m '>+1" (kbd "RET") "gv=gv"))
(define-key evil-visual-state-map (kbd "K") (concat ":m '<-2" (kbd "RET") "gv=gv"))
;; (define-key evil-normal-state-map (kbd "S-j") (concat ":m +1" (kbd "RET") "=="))
;; (define-key evil-normal-state-map (kbd "S-k") (concat ":m -2" (kbd "RET") "=="))

(provide 'kirby-evil)

;;; kirby-evil.el ends here
