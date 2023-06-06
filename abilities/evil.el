;; Stop fighting. Just use Evil mode. You'll be better off
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
