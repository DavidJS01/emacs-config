(setq elisp-autofmt-python-bin "python3")

(defvar programming-languages '(python rust go ocaml elixir sbcl)
  "Programming languages I like :)")

(defun configure-eglot ()
  "Configure Eglot given programming languages in
   programming-languages"
  (message "configuring eglot...")

  (when (memq 'python programming-languages)
    (add-hook 'python-mode-hook #'eglot-ensure))

  (when (memq 'go programming-languages)
    (message "configuring Go...")
    (use-package
     go-ts-mode
     :after eglot
     :ensure t
     :mode "\\.go\\'"
     :hook (go-ts-mode . eglot-ensure)
     :config (setq go-ts-mode-indent-offset 4)))

  (when (memq 'ocaml programming-languages)
    (message "configuring ocaml...")
    (add-to-list
     'load-path "/home/davids/.opam/default/share/emacs/site-lisp")
    (require 'ocp-indent)
    (use-package
     tuareg
     :after eglot
     :ensure t
     :hook (tuareg-mode . eglot-ensure)))


  (when (memq 'rust programming-languages)
    (use-package
     rust-ts-mode
     :ensure t
     :after eglot
     :mode "\\.rs\\'"
     :hook (rust-ts-mode . eglot-ensure)))

  (when (memq 'elixir programming-languages)
    (use-package
     elixir-ts-mode
     :ensure t
     :after eglot
     :config
     (add-to-list
      'eglot-server-programs
      '(elixir-ts-mode
        "/home/davids/Downloads/elixir/language_server.sh"))
     :hook (elixir-ts-mode . eglot-ensure)
     (elixir-ts-mode
      .
      (lambda ()
        (push '(">=" . ?\u2265) prettify-symbols-alist)
        (push '("<=" . ?\u2264) prettify-symbols-alist)
        (push '("!=" . ?\u2260) prettify-symbols-alist)
        (push '("==" . ?\u2A75) prettify-symbols-alist)
        (push '("=~" . ?\u2245) prettify-symbols-alist)
        (push '("<-" . ?\u2190) prettify-symbols-alist)
        (push '("->" . ?\u2192) prettify-symbols-alist)
        (push '("|>" . ?\u25B7) prettify-symbols-alist)))
     (before-save . eglot-format)))

  (when (memq 'sbcl programming-languages)
    (use-package
     slime
     :config
     (setq inferior-lisp-program "sbcl")
     (setq slime-complete-symbol*-fancy t))))

;; simple eglot configuration. should prob
;; move languages to their own block
(use-package
 eglot
 :after yasnippet
 :ensure t
 :hook
 ((yaml-ts-mode . eglot-ensure)
  (before-save . eglot-format-buffer)
  ;; Hook to ignore jsonrpc--log-event
  (eglot-managed-mode
   . (lambda () (fset #'jsonrpc--log-event #'ignore)))
  ;; Set eglot events buffer size on eglot-managed-mode hook
  (eglot-managed-mode
   . (lambda () (setq eglot-events-buffer-size 1))))
 :config
 (setq eglot-events-buffer-size 0)
 (setq eglot-auto-display-help-buffer nil)
 (setq eglot-report-progress nil))

(use-package
 yasnippet
 :ensure t
 :config
 (setq yas-triggers-in-field t) ;; Allow triggers in fields
 (setq yas-wrap-around-region t) ;; Allow wrapping around region when expanding snippets
 (yas-global-mode 1))

(use-package
 eldoc
 :after eglot
 :ensure nil
 :custom (eldoc-echo-area-use-multiline-p 0)
 :config (global-eldoc-mode 0))

(use-package
 treesit-auto
 :after eglot
 :config (global-treesit-auto-mode))

(use-package hl-todo :config (global-hl-todo-mode))


(use-package
 corfu
 :after eglot
 :custom
 (corfu-cycle t) ;; Enable cycling for `corfu-next/previous'
 (corfu-preselect 'prompt) ;; Always preselect the prompt

 ;; Use tab for cycling :D
 :bind
 (:map
  corfu-map
  ("TAB" . corfu-next)
  ([tab] . corfu-next)
  ("S-TAB" . corfu-previous)
  ([backtab] . corfu-previous))

 :init (global-corfu-mode))

(use-package
 emacs
 :custom
 ;; TAB cycle if there are only few candidates
 ;; (completion-cycle-threshold 3)

 ;; Enable indentation+completion using the TAB key.
 ;; `completion-at-point' is often bound to M-TAB.
 (tab-always-indent 'complete))

(provide 'programming)
