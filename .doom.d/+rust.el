;;; ~/.doom.d/+rust.el -*- lexical-binding: t; -*-

(after! rustic
  (setq lsp-rust-analyzer-server-command '("rust-analyzer"))
  (setq lsp-rust-server 'rust-analyzer)
  (setq rustic-lsp-server 'rust-analyzer))

(after! (rustic lsp lsp-ui)
  (push 'rustic-clippy flycheck-checkers)
  (setq lsp-rust-full-docs t
        lsp-rust-clippy-preference "on"
        lsp-rust-analyzer-display-chaining-hints t
        rustic-lsp-client 'eglot
        rustic-format-trigger 'on-save
        rust-format-on-save t))

(add-hook! rustic-mode lsp-rust-analyzer-inlay-hints-mode)
(add-hook! rustic-mode 'smartparens-mode)
