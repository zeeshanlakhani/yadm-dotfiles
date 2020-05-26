;;; ~/.doom.d/languages.el -*- lexical-binding: t; -*-

;; lsp
(after! lsp
  (setq lsp-prefer-capf t
        lsp-auto-execute-action t
        lsp-enable-semantic-highlighting t
        lsp-before-save-edits t
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


(add-hook! reason-mode
  (add-hook 'before-save-hook #'refmt-before-save nil t))
(add-hook! reason-mode 'smartparens-mode)
(add-hook! reason-mode #'lsp-deferred)


