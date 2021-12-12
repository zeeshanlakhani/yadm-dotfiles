;;; ~/.doom.d/+rust.el -*- lexical-binding: t; -*-

(after! rustic
  (setq lsp-rust-analyzer-server-command '("rust-analyzer"))
  (setq lsp-rust-server 'rust-analyzer)
  (setq lsp-rust-analyzer-server-display-inlay-hints t)
  (setq lsp-rust-analyzer-cargo-watch-enable t)
  (setq lsp-rust-analyzer-proc-macro-enable t)
  (setq lsp-rust-analyzer-cargo-watch-command "clippy")
  (setq rustic-lsp-server 'rust-analyzer))

(after! (rustic lsp lsp-ui)
  (push 'rustic-clippy flycheck-checkers)
  (setq lsp-rust-full-docs t
        lsp-rust-clippy-preference "on"
        lsp-rust-analyzer-display-chaining-hints t
        lsp-rust-analyzer-cargo-watch-enable t
        lsp-rust-analyzer-cargo-watch-command "clippy"
        lsp-rust-analyzer-proc-macro-enable t
        lsp-rust-analyzer-server-display-inlay-hints t
	lsp-completion-enable t
        rustic-rustfmt-args "+nightly"
        rustic-lsp-client 'eglot
        rustic-format-trigger 'on-save
        rust-format-on-save t))

(add-hook! rustic-mode 'smartparens-mode)
