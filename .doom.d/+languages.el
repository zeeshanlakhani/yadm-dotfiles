;;; ~/.doom.d/+languages.el -*- lexical-binding: t; -*-

;; lsp
(after! lsp
  (setq lsp-auto-execute-action t
        lsp-before-save-edits t
        lsp-enable-semantic-highlighting t
        lsp-describe-thing-at-point t))

;; agda
(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))

;; Using the input method of Agda in LaTeX files.
(add-hook 'LaTeX-mode-hook
          (lambda () (set-input-method "Agda")))

(map! :leader
    :nv "a" nil
    (:prefix "a"
    :n "l" #'agda2-load))

;; markdown
(add-hook! (gfm-mode markdown-mode) #'visual-line-mode #'turn-off-auto-fill)

;; ispell
 (setq ispell-program-name "ispell"
    ispell-dictionary "en_US"
    ispell-local-dictionary "american")

;; loads
(load! "+elixir")
(load! "+rust")
(load! "+reason")
