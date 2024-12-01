(add-to-list 'load-path (expand-file-name "config" "~/.emacs.d"))

(defun move-cursor-to-top-scratch-buffer ()
  "Move point to the beginning of the scratch buffer."
  (when (get-buffer "*scratch*")
    (with-current-buffer "*scratch*"
      (goto-char (point-min)))))

(defun coon ()
  (interactive)
  (find-file user-emacs-directory))

(setq coon-ascii
      "			Time to do cool things!

⣿⣿⣿⣿⣿⣿⣿⠿⠿⠻⠟⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⡏⣸⢿⣿⣦⣄⢀⠙⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⢱⡏⠘⣿⣿⣿⣾⣷⣤⡀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠋⢙⣉⣠⣬⣥⣄⢻⣿
⣿⣿⣿⣿⣿⣿⠘⣿⠎⠿⠏⠘⣿⡿⣿⠧⠀⠀⠙⠉⠻⠟⢿⣿⣿⠿⠿⠛⠋⠻⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⣀⣰⣾⣿⠿⠟⠉⠀⢉⠀⣿
⣿⣿⣿⣿⣿⣿⠆⠹⣧⠀⠀⠀⠸⡇⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠙⢿⠿⠛⠟⠛⢁⣴⣿⡿⠛⠉⠀⠀⠀⠀⠀⠀⠀⢿
⣿⣿⣿⣿⣿⣿⣧⡀⢻⡃⠀⠀⠀⠀⠀⢠⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠊⠁⢁⣦⠴⠖⠂⠀⠀⠀⠀⡴⢃⣾
⣿⣿⣿⣿⣿⣿⣿⣷⡄⠻⣇⡀⠀⠀⣀⣈⣿⣷⣿⠒⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⣸⢃⣾⣿
⣿⣿⣿⣿⣿⣿⣿⣿⡁⠐⢿⣿⡃⢀⣿⣿⣿⡃⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⢀⠀⠀⠀⣀⠀⠐⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⢃⣾⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⢰⣟⠙⣾⣿⣿⣿⣿⣿⣠⣤⣤⠀⠀⠀⠀⠀⣀⣾⣿⣾⡀⣦⣾⣿⣤⣆⠀⠰⠁⠀⠀⠀⠀⠀⠀⠀⠀⣀⣼⠆⣾⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⠧⠘⣿⣦⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⢀⢀⣿⣿⣿⣿⣷⣿⣿⣿⣿⣿⣿⡆⠀⣀⡀⠀⠀⠀⠀⠀⣴⡿⢛⣤⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⢐⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⣿⡇⠀⠀⠀⣤⣶⣿⠏⣈⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣸⣿⣿⣿⣿⣿⡿⠀⢸⣿⣿⡄⠀⠀⣾⣿⣿⡟⠁⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⣠⡀⠀⠻⢿⡇⠀⢿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⡿⠀⣿⣿⣿⡏⠀⠀⢤⠀⠀⢻⡟⢅⣀⢲⣾⡿⠛⠀⠀⠀⣀⠈⠑⠶⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⣿⣿⣷⠘⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⡁⣶⣼⣿⠋⠀⠠⣄⠀⠀⠀⢸⡇⠀⠉⣿⡿⠁⠀⠀⠠⣀⠈⠁⠀⠀⠀⠀⠙⠛⠛⢛⣿⣿⣿⣿⣿⣾⣿⣿⣿⠃⣨⣿⣿⣿⣿
⣿⣿⣯⡻⢿⣿⣿⣿⡧⢿⣿⡉⠁⠀⠀⠀⠀⢀⣴⣾⣷⣄⣶⣿⣥⣄⠀⠀⠀⠉⠁⠀⠀⠀⠀⠀⠀⠈⠓⠛⠉⠙⢿⠁⠉⠸⣿⣿⣷⡶⠈⣿⣿⣿⣿
⣿⣿⣿⣿⣷⣬⣉⡙⢂⣻⠷⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢬⣦⠀⢠⣿⣿⣿⣷⣤⠈⠉⢻⣿
⣿⣿⣿⣿⣿⣿⣿⡿⠓⣹⡟⠲⠤⣄⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠶⠿⢿⣿⣿⣷⣤⡀⠙⢿
⣯⣭⣭⣉⣉⣉⡙⠓⠠⠚⠿⢶⣤⣄⣉⡾⠛⠁⠀⠀⠀⠈⢻⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠠⢤⣀⣒⣒⣒⣒⣒⣀⣀⣀⡀⠀⠠⣼⣿⣿⣿⣆⠠⣬
⣿⠿⠟⣛⣛⡛⠛⠁⠛⢻⠶⠶⠦⠬⢽⠀⠀⠒⠆⠀⠀⠀⠀⢏⠽⠿⡿⣿⣄⠀⣤⣄⣠⣞⠉⠁⠀⠀⠀⠀⠀⠀⠀⢩⣭⣭⣭⣤⣈⡛⢿⡏⠋⠀⢹
⣿⣿⣿⡿⠟⢋⣁⣠⣄⠠⢶⣶⣶⣶⡾⡀⠀⠀⠀⠀⠀⠀⢀⠎⠀⠒⢳⣛⣿⣿⣯⠉⠳⢄⠉⠒⢄⡀⠀⠀⠀⠀⠀⠐⠚⠛⠙⣿⣟⠋⠉⠉⠀⢠⡀
⡿⣫⣵⣶⣿⣿⣿⣿⡇⠐⠛⣿⣿⣟⠃⠑⠠⠀⠀⠀⠄⠒⠁⠀⠀⠈⠉⠙⣉⠥⠁⠀⠀⠈⠣⠀⠀⠉⠢⡀⠀⠀⠀⠀⠈⠙⠻⠏⢻⣷⡀⠀⢀⠸⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣷⡞⡸⣿⣿⠟⠀⠀⠀⠐⠠⠤⠤⠤⠤⠤⠖⠒⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠄⠀⠘⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⣰⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠲⠀⠀⠀⠀⢻⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠁⢾⡷⠁⠀⢀⣤⠤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣷⣦⣷⣾⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣤⢀⣤⣶⠂⠀⠈⠁⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣈⣳⣤⣶⣿⣾⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣆⣴⣿⡄⠀⠀⠀⠀⣀⡀⠀⠀⠀⠀⠀⠀⣀⠀⠀⠀⠀⣀⣤⣴⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣷⣶⣶⣿⣿⣷⣴⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿")

(require 'packages)
(require 'behavior)
(require 'visual)
(require 'org-config)

;; set languages to setup first
(if is-work-computer
    (setq programming-languages '(python))
  (setq programming-languages '(python go rust elixir sbcl ocaml)))


;; then require the file that uses that variable
(require 'programming)

;; finally run the configuration
(configure-eglot)



(require 'keybindings)

;; focus startup screen
(setq initial-scratch-message coon-ascii)
(add-hook 'after-init-hook 'move-cursor-to-top-scratch-buffer)

;; custom stuff :D
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file 'noerror)
