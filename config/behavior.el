;; disable alarm
(setq ring-bell-function 'ignore)

;; startup message
(setq inhibit-startup-message t)

;; delete selected region after typing
(delete-selection-mode t)

;; emacs internal behavior stuff
(setq gc-cons-threshold 100000000)
(setq large-file-warning-threshold 100000000)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; yes-or-no prompts to y-or-n
(fset 'yes-or-no-p 'y-or-n-p)

;; editing stuff

;; disable annoying auto indent
(electric-indent-mode 0)

;; brackets now come in pairs by default
(electric-pair-mode t)

;; stop emacs from polluting directories
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))

;; Create the backup directory if it doesn't exist
(unless (file-exists-p "~/.emacs.d/backups")
  (make-directory "~/.emacs.d/backups" t))

;; visual undo tree
(use-package vundo
  :config
      (setq vundo-glyph-alist vundo-unicode-symbols))

(use-package catppuccin-theme)

(use-package exec-path-from-shell
  :config (when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
)

(provide 'behavior)
