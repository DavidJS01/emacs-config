;; setup package manager (use-package)

(require 'package)

;; Add package archives if not already present
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))

;; Initialize the package system
(package-initialize)

;; Refresh package contents if necessary
(unless package-archive-contents
  (package-refresh-contents))

;; Install use-package if it's not installed
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; Load use-package
(require 'use-package)
(setq use-package-always-ensure t)  ;; Automatically install missing packages

;; install packages

;; general
(use-package which-key
  :ensure t
  :config
  (which-key-mode)  ;; Enable which-key mode
  (setq which-key-idle-delay 0.8))

;; Development Tools
(use-package magit)
(use-package treemacs)
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))
;; Writing Tools
(use-package markdown-mode)

;; Programming Languages

(use-package doom-themes)


;; Enable vertico
(use-package vertico
  :init
  (vertico-mode))

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))

(use-package doom-modeline
  :ensure 
  :init
  (doom-modeline-mode 1))

(provide 'packages)
