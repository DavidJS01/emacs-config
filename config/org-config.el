(use-package org)

(defcustom is-work-computer nil
  "Having fun at work?"
  :type 'boolean
  :group 'user)

(defcustom is-environment-configured nil
  "Whether org-mode was configured"
  :type 'boolean
  :group 'user)

(defvar notes-base-dir "~/org/")
(defvar work-notes-file (concat notes-base-dir "work.org"))
(defvar home-notes-file (concat notes-base-dir "personal.org"))

(defun make-notes-file-if-not-exists (dir file)
  "create notes directory and file if needed"

  ;; make directory if not exists
  (unless (file-exists-p dir)
    (make-directory dir))

  ;; make file if not exists
  (unless (file-exists-p file)
    (with-temp-buffer
      (write-file file))))

;; configure work notes environment
(defun configure-work-notes ()
  "configure org mode for work"

  (make-notes-file-if-not-exists "~/org/" work-notes-file)

  (setq org-default-notes-file work-notes-file)

  (org-agenda-files (list work-notes-file)))


(defun configure-personal-notes ()
  "configure org mode for personal use"

  (make-notes-file-if-not-exists "~/org/" home-notes-file)

  (setq org-default-notes-file home-notes-file)

  (setq org-agenda-files (list home-notes-file)))


(defun configure-environment ()
  "Configure org env on first run"

  (when (eq is-environment-configured nil)
    (let ((is-work (y-or-n-p "Setting up emacs at work? :D")))
      (customize-set-variable 'is-work-computer is-work)

      (if is-work
          (configure-work-notes)
        (configure-personal-notes))

      (customize-set-variable 'is-environment-configured t)
      (customize-save-customized)
      (setq org-log-done 'time))))


(if is-work-computer
    (progn
      (setq
       org-agenda-files (list work-notes-file)
       org-default-notes-file work-notes-file))
  (progn
    (setq
     org-agenda-files (list home-notes-file)
     org-default-notes-file home-notes-file)))

;; call configure-environment after emacs start
(add-hook 'after-init-hook 'configure-environment)

;; org mode
(setq org-hide-emphasis-markers t)

;; literate programming - babel
(setq org-babel-python-command "/usr/bin/python3")

(org-babel-do-load-languages
 'org-babel-load-languages '((python . t) (emacs-lisp . t)))

;; disable electric pair mode for `<' character
(add-hook
 'org-mode-hook
 (lambda ()
   (setq-local electric-pair-inhibit-predicate
               (lambda (c)
                 (if (char-equal c ?<)
                     t
                   (funcall electric-pair-inhibit-predicate c))))))

;; enable <s TAB <q TAB templates
(require 'org-tempo)

;; lol maybe dumb but change - in lists to this dapper guy: •
(font-lock-add-keywords
 'org-mode
 '(("^ *\\([-]\\) " (0 (prog1 ()
         (compose-region (match-beginning 1) (match-end 1) "•"))))))

;; hide leading stars
(setq org-hide-leading-stars t)

;; change behavior in source code blocks
(setq
 org-src-fontify-natively t
 org-src-tab-acts-natively t
 org-edit-src-content-indentation 0)


;; Show both TODO and DONE items in agenda
(setq org-agenda-skip-deadline-if-done nil)
(setq org-agenda-skip-scheduled-if-done nil)
(setq org-agenda-show-all-dates t)
(setq org-agenda-span 'week)  ; Show a week at a time
(setq org-agenda-start-on-weekday 1)  ; Start on Monday

(setq org-todo-keywords
      '((sequence "TODO(t)" "IN-PROGRESS(i)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))

(setq org-log-into-drawer t)

(setq org-capture-templates
      '(("t" "Task" entry (file+headline org-default-notes-file "Tasks")
         "* TODO %^{Title}\n:PROPERTIES:\n:CREATED: %U\n:LOGGING: DONE(!) TIME\n:END:\n%?\n")))

;; Custom agenda command to see everything
(setq org-agenda-custom-commands
      '(("n" "Agenda and all TODOs"
         ((agenda "")
          (todo "" ((org-agenda-files org-agenda-files)))))))

(setq org-agenda-custom-commands
      '(("w" "Weekly Review"
         ((todo "DONE"
                ((org-agenda-start-day "-7d")
                 (org-agenda-span 7)
                 (org-agenda-start-on-weekday nil)))
          (todo "TODO|IN-PROGRESS|WAITING"
                ((org-agenda-span 'day))))  ; Current TODOs
         ((org-agenda-start-with-log-mode t)))))

(defun org-agenda-tab ()
  "Open org-agenda in a new tab"
  (interactive)
  (tab-new)
  (tab-rename "Agenda")
  (org-agenda nil "a")
  (delete-other-windows))

(provide 'org-config)
