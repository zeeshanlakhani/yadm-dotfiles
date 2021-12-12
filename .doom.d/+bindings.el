;;; ~/.doom.d/+bindings.el -*- lexical-binding: t; -*-

;; size buffers
(global-set-key (kbd "S-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-<down>") 'shrink-window)
(global-set-key (kbd "S-<up>") 'enlarge-window)

;; tab-bar
(global-set-key (kbd "S-<tab>") 'tab-next)

;; lines}
(global-set-key (kbd "C-l") 'goto-line)

;; helm
(global-set-key (kbd "C-x C-d") 'helm-mini)

;; racket
(global-set-key (kbd "C-\\") 'dr-racket-like-unicode-char)

;; markdown
(map! :after vmd
  :mode markdown-mode
  :n "SPC m p" #'vmd-mode)
