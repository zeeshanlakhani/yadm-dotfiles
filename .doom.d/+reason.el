;;; ~/.doom.d/+reason.el -*- lexical-binding: t; -*-

(defun reason/rtop-prompt ()
  "The rtop prompt function."
  (let ((prompt (format "rtop[%d]> " utop-command-number)))
    (add-text-properties 0 (length prompt) '(face utop-prompt) prompt)
    prompt))

(after! lsp-clients
  (setq lsp-response-timeout 500)
  (lsp-register-client
   (make-lsp-client
    :new-connection
    (lsp-stdio-connection
     (executable-find "/usr/local/bin/reason-language-server"))
    :major-modes '(reason-mode)
    :notification-handlers (ht ("client/registerCapability" 'ignore))
    :priority 1
    :server-id 'reason-ls)))

;; ## added by OPAM user-setup for emacs / base
;; ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.doom.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line

(add-hook! reason-mode
  (add-hook 'before-save-hook #'refmt-before-save nil t))

(add-hook! reason-mode #'lsp)
(add-hook! reason-mode 'smartparens-mode)
(after! reason-mode
  (setq utop-command "rtop -emacs"
        utop-edit-command nil
        utop-prompt 'reason/rtop-prompt
        utop-initial-command "let myVar = \"Hello Reason!\";"
        utop-phrase-terminator ";")
  (add-hook 'reason-mode-hook #'utop-minor-mode))
(set-repl-handler! 'reason-mode #'utop)
(set-eval-handler! 'reason-mode #'utop-eval-region)
