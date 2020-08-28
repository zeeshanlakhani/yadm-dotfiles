;;; ~/.doom.d/+elixir.el -*- lexical-binding: t; -*-

(after! lsp-clients
  (setq lsp-file-watch-ignored (append lsp-file-watch-ignored '("deps/" "_build/" ".elixir_ls/" "assets/" ".circleci/" "docs/")))
  (lsp-register-client
   (make-lsp-client
    :new-connection
    (lsp-stdio-connection
     (expand-file-name "~/.elixirls/release/language_server.sh"))
    :major-modes '(elixir-mode)
    :priority -1
    :server-id 'elixir-ls
    :initialized-fn (lambda (workspace)
                      (with-lsp-workspace workspace
                        (let ((config `(:elixirLS
                                        (:mixEnv "dev"
                                         :dialyzerEnabled
                                         :json-false))))
                          (lsp--set-configuration config)))))))


(after! lsp-ui
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-delay 1.5
        lsp-ui-doc-max-height 20
        lsp-ui-doc-max-width 80
        lsp-ui-sideline-ignore-duplicate t
        lsp-ui-doc-use-childframe t
        lsp-ui-doc-position 'bottom
        lsp-ui-doc-use-webkit nil
        lsp-ui-imenu-kind-position 'left
        lsp-ui-sideline-code-actions-prefix "💡"
        company-lsp-match-candidate-predicate #'company-lsp-match-candidate-prefix))

(map! :prefix "g"
      :ne "p" #'lsp-ui-peek-find-definitions
      :ne "P" #'lsp-ui-peek-find-references)

(use-package! exec-path-from-shell
  :init (exec-path-from-shell-initialize))

(use-package! exunit
  :hook (elixir-mode . exunit-mode))

(use-package! lsp-elixir
  :hook (elixir-mode . lsp))

(use-package! mix
  :hook (elixir-mode . mix-minor-mode)
  :config (setq compilation-scroll-output t))

(defun mix/mix ()
  "Run mix command in project or sub-project."
  (interactive)
  (let ((mix-start-in-umbrella nil))
    (mix-execute-task)))

(defun mix/mix-umbrella ()
  "Run mix command in umbrella project."
  (interactive)
  (let ((mix-start-in-umbrella t))
    (mix-execute-task)))

(defun mix/format-buffer ()
  "Format current buffer."
  (interactive)
  (let ((file-to-format (file-relative-name (buffer-file-name) (exunit-project-root)))
        (default-directory (exunit-project-root)))
    (save-buffer)
    (shell-command (s-join " " `("mix" "format" ,file-to-format)))
    (find-file file-to-format)))

(map! :mode elixir-mode
      :localleader
      ;; SPC m ...
      :desc "Format buffer" :ne "=" #'mix/format-buffer
      :desc "Run mix in project" :ne "m" #'mix/mix
      :desc "Run mix in umbrella" :ne "u" #'mix/mix-umbrella
      ;; SPC m l ...
      :prefix ("l" . "Linting")
      :desc "Next error" :ne "n" #'flycheck-next-error
      :desc "Previous error" :ne "N" #'flycheck-previous-error
      :desc "List errors" :ne "l" #'flycheck-list-errors
      ;; SPC m t ...
      :prefix ("t" . "Testing")
      :desc "App" :ne "a" #'exunit-verify-all
      :desc "Buffer" :ne "b" #'exunit-verify
      :desc "Retry" :ne "r" #'exunit-rerun
      :desc "At point" :ne "t" #'exunit-verify-single
      :desc "Umbrella" :ne "u" #'exunit-verify-all-in-umbrella
      :desc "Toggle file" :ne "<tab>" #'exunit-toggle-file-and-test
      :desc "Toggle file other window" :ne "<backtab>" #'exunit-toggle-file-and-test-other-window)

(map! :leader
      :desc "Run shell command" :ne "!" #'shell-command
      :prefix "w" :ne "C-d" #'ace-delete-window
      :prefix "w" :ne "C-p" #'projectile-find-file-other-window)
