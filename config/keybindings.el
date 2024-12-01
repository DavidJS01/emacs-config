(defun open-projects-directory ()
 "Open dired buffer at ~/projects"
  (interactive)
  (if (file-exists-p "~/projects")
      (dired "~/projects")))

;; window management
(global-set-key (kbd "S-<left>") 'windmove-left)
(global-set-key (kbd "S-<right>") 'windmove-right)
(global-set-key (kbd "S-<down>") 'windmove-down)
(global-set-key (kbd "S-<up>") 'windmove-up)

;; buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; dired
(global-set-key (kbd "C-c p") 'open-projects-directory)

;; vundo
(global-set-key (kbd "C-c v") 'vundo)

;; org-mode stuff
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c z") 'org-agenda-tab)
(global-set-key (kbd "C-c c") 'org-capture)

(provide 'keybindings)
