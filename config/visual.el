;; top bars
(menu-bar-mode -1)
(tool-bar-mode -1)

;; always make text wrap around current resolution
(setq global-visual-line-mode 1)

;; side bars
(scroll-bar-mode -1)

;; cursor
(blink-cursor-mode 0)

;; parens
(show-paren-mode t)


;; line numbers & column number on modeline
(global-display-line-numbers-mode 1)
(column-number-mode t)

;; lines
(global-hl-line-mode t) 

;; default tab-width
(setq-default tab-width 4
			  standard-indent 4
			  indent-tabs-mode t)

;; font
(defun font-exists? (font-name)
  (find-font (font-spec :name font-name)))


(defun set-my-font ()
  (let ((font-name "Iosevka Nerd Font")
        (height 225))
    (when (font-exists? font-name)
      (set-face-attribute 'default nil :height height :font font-name))))

(set-my-font)


;; themes
(defun my-load-theme (theme)
  (interactive
   (list (intern (completing-read "Load theme: "
                                  (mapcar 'symbol-name
                                          (custom-available-themes))))))
  (mapcar #'disable-theme custom-enabled-themes)
  (load-theme theme t))

(use-package ef-themes)

(add-hook 'after-init-hook (lambda () (load-theme 'ef-dream)))

;; icons
(use-package all-the-icons)

;; tab bar
(setq tab-bar-close-button-show nil)
(setq tab-bar-new-button-show nil)

;; wrap lines to window size
(setq global-visual-line-mode t)

(use-package annotate)

(use-package nyan-mode
  :config 
  (nyan-mode)
  (nyan-start-animation))

(provide 'visual)

