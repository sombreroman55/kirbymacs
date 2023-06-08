(defun kirby/c-mode-common-hook ()
  (setq c-tab-always-indent t
        c-basic-offset 4))

(add-hook 'c-mode-common-hook 'kirby/c-mode-common-hook)

(provide 'kirby-lang-c)
