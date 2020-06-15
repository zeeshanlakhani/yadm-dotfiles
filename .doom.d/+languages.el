;;; ~/.doom.d/languages.el -*- lexical-binding: t; -*-

;; lsp
(after! lsp
  (setq lsp-prefer-capf t
        lsp-auto-execute-action t
        lsp-before-save-edits t
        lsp-enable-semantic-highlighting t
        lsp-describe-thing-at-point t
        lsp-enable-snippet t)
  (lsp-treemacs-sync-mode 1))

;; rust
(after! (rustic lsp lsp-ui)
  (setq rustic-lsp-server 'rust-analyzer
        rustic-lsp-client 'eglot
        rustic-format-trigger 'on-save
        rust-format-on-save t))

(add-hook! rustic-mode lsp-rust-analyzer-inlay-hints-mode)
(add-hook! rustic-mode 'smartparens-mode)

;; markdown
(use-package! vmd-mode
  :commands vmd-mode
  :init
  (map! :map markdown-mode-map
        (:localleader
         "v" #'vmd-mode)))

;; reasonml
(defun reason/rtop-prompt ()
  "The rtop prompt function."
  (let ((prompt (format "rtop[%d]> " utop-command-number)))
    (add-text-properties 0 (length prompt) '(face utop-prompt) prompt)
    prompt))

(after! lsp
  (setq lsp-response-timeout 180)
  (lsp-register-client
   (make-lsp-client
    :new-connection
    (lsp-stdio-connection
     (executable-find "~/reason-language-server"))
    :major-modes '(reason-mode)
    :notification-handlers (ht ("client/registerCapability" 'ignore))
    :priority 1
    :server-id 'reason-ls)))


;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.doom.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line

(add-hook! reason-mode
  (add-hook 'before-save-hook #'refmt-before-save nil t))

(add-hook! reason-mode #'lsp-deferred)
(add-hook! reason-mode 'smartparens-mode)
(after! reason-mode
  (setq utop-command "rtop -emacs"
        utop-edit-command nil
        utop-prompt 'reason/rtop-prompt
        utop-initial-command "let myVar = \"Hello Reason!\";"
        utop-phrase-terminator ";")
  (add-hook 'reason-mode-hook #'utop-minor-mode)
  (add-hook 'reason-mode-hook #'merlin-mode))
(set-repl-handler! 'reason-mode #'utop)
(set-eval-handler! 'reason-mode #'utop-eval-region)

;; agda
(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))

;; Using the input method of Agda in LaTeX files.
(require 'agda-input)
(add-hook 'LaTeX-mode-hook
          (lambda () (set-input-method "Agda")))


(map! :leader
    :nv "a" nil
    (:prefix "a"
    :n "l" #'agda2-load))
