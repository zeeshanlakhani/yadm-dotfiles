;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(csv
     graphviz
     nginx
     typescript
     sql
     yaml
        ;; ----------------------------------------------------------------
        ;; Example of useful layers you may want to use right away.
        ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
        ;; <M-m f e R> (Emacs style) to install them.
        ;; ----------------------------------------------------------------
     (auto-completion :variables auto-completion-enable-snippets-in-popup t)
      better-defaults
      emacs-lisp
      git
      clojure
      racket
      scheme
      (markdown :variables markdown-live-preview-buffer 'vmd)
      org
      sml
      elm
      elixir
      haskell
      ocaml
      prettier
      javascript
      typescript
      scala
      html
      spell-checking
      syntax-checking
      cscope
      (gtags :disabled-for clojure emacs-lisp javascript latex erlang python
             shell-scripts elixir rust)
      org
      idris
      ruby
      lsp
      (rust :variables rust-backend 'lsp)
      lua
      (c-c++ :variables c-c++-enable-clang-support t)
      python
      coq
      latex
      vagrant
      dash
      nginx
      docker
      erlang
      react
      graphviz
      shell
      z-erlang
      zeeshanl)
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     (groovy-mode :location elpa)
     (unicode-fonts :location elpa)
     (flow-minor-mode :location elpa)
     (xcscope :location elpa)
    )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(vi-tilde-fringe)
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https nil
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 10
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'emacs
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Ubuntu Mono derivative Powerline"
                               :size 11
                               :weight normal
                               :width normal
                               :powerline-scale 1.5)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar nil
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols nil
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters nil
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'all
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
  (add-to-list 'exec-path "~/.local/bin")

  (push '("melpa-stable" . "stable.melpa.org/packages/") configuration-layer-elpa-archives)
  (push '("ensime" . "melpa-stable") package-pinned-packages)

  ;; automodes
  (add-to-list 'auto-mode-alist '("Jenkinsfile$" . groovy-mode))

  ;; term work
  (defadvice ansi-term (after advise-ansi-term-coding-system)
    (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))
  (ad-activate 'ansi-term)
  (setq system-uses-terminfo nil)

  ;;;
  ;; ons/offs/hooks
  ;;;

  ;; Enable Paredit
  (add-hook 'clojure-mode-hook          'paredit-mode)
  (add-hook 'emacs-lisp-mode-hook       'paredit-mode)
  (add-hook 'lisp-mode-hook             'paredit-mode)
  (add-hook 'lisp-interaction-mode-hook 'paredit-mode)
  (add-hook 'scheme-mode-hook           'paredit-mode)
  (add-hook 'erlang-mode-hook           'paredit-mode)
  (add-hook 'erlang-extended-mode-hook  'paredit-mode)
  (add-hook 'erlang-shell-mode-hook     'paredit-mode)
  (add-hook 'elixir-mode-hook           'paredit-mode)
  (add-hook 'alchemist-mode-hook        'paredit-mode)
  (add-hook 'alchemist-iex-mode-hook    'paredit-mode)
  (add-hook 'racket-mode-hook           'paredit-mode)
  (add-hook 'racket-repl-mode-hook      'paredit-mode)
  (add-hook 'racket-repl-mode-hook      'paredit-mode)

  ;; Enable smart-parens
  (add-hook 'p4_16-mode-hook            'smartparens-mode)
  (add-hook 'rust-mode-hook             'smartparens-mode)

  ;; Enable Pretty-mode
  (add-hook 'emacs-lisp-mode-hook       'pretty-mode)
  (add-hook 'ielm-mode-hook             'pretty-mode)
  (add-hook 'lisp-mode-hook             'pretty-mode)
  (add-hook 'clojure-mode-hook          'pretty-mode)
  (add-hook 'lisp-interaction-mode-hook 'pretty-mode)
  (add-hook 'scheme-mode-hook           'pretty-mode)
  (add-hook 'erlang-mode-hook           'pretty-mode)
  (add-hook 'elixir-mode-hook           'pretty-mode)
  (add-hook 'alchemist-mode-hook        'pretty-mode)
  (add-hook 'alchemist-iex-mode-hook    'pretty-mode)
  (add-hook 'erlang-shell-mode-hook     'pretty-mode)
  (add-hook 'js2-mode-hook              'pretty-mode)
  (add-hook 'react-mode-hook            'pretty-mode)
  (add-hook 'javascript-mode-hook       'pretty-mode)
  (add-hook 'js-mode-hook               'pretty-mode)
  (add-hook 'racket-mode-hook           'pretty-mode)
  (add-hook 'racket-repl-mode-hook      'pretty-mode)

  ;; Enable flyspell-mode
  (add-hook 'scribble-mode-hook         #'flyspell-mode)

  ;; unicode-racket
  (add-hook 'racket-mode-hook           'dr-racket-like-unicode-mode)
  (add-hook 'racket-repl-mode-hook      'dr-racket-like-unicode-mode)

  ;; js-flowtype
  (add-hook 'js2-mode-hook 'flow-minor-enable-automatically)
  (add-hook 'react-mode-hook 'flow-minor-enable-automatically)
  (add-hook 'javascript-mode-hook 'flow-minor-enable-automatically)
  (add-hook 'js-mode-hook 'flow-minor-enable-automatically)

  ;; company-mode
  (setq company-global-modes '(not rust-mode))
  (add-hook 'after-init-hook 'global-company-mode)
  (add-hook 'after-init-hook 'global-pretty-mode)
  (menu-bar-mode 1)

  ;;(setq make-backup-files nil) -> for other
  (setq backup-directory-alist '((".*" . "~/.Trash")))

  (global-whitespace-mode t)
  (setq exec-path-from-shell-check-startup-files nil)
  (add-hook 'before-save-hook 'whitespace-cleanup)
)

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; simple loads
  (use-package unicode-fonts
    :defer t
    :config (message "Loaded unicode fonts")
    :init
    (unicode-fonts-setup))

  (use-package groovy-mode
    :defer t
    :config (message "Loaded groovy mode"))

  (use-package flow-minor-mode
    :defer t
    :config (message "Loaded flow minor mode"))

  ;; latex
  (add-hook 'doc-view-mode-hook 'auto-revert-mode)

  ;; mac-specific keys
  (setq mac-command-key-is-meta nil)
  (setq mac-option-key-is-meta t)
  (setq mac-option-modifier 'meta)

  ;; (with-eval-after-load 'flycheck
  ;;   (flycheck-add-mode 'javascript-flow 'flow-minor-mode)
  ;;   (flycheck-add-mode 'javascript-eslint 'flow-minor-mode)
  ;;   (flycheck-add-next-checker 'javascript-flow 'javascript-eslint))

  ;; (with-eval-after-load 'company
  ;;   (add-to-list 'company-backends 'company-flow))

  ;; idris things
  (with-eval-after-load 'idris-mode
    (setq idris-stay-in-current-window-on-compiler-error t)
    (dolist (x '("*idris-notes*" "*idris-holes*" "*idris-info*"))
      (plist-put (cdr (assoc x popwin:special-display-config)) :noselect t)))

  ;; rust things
  ;;;(with-eval-after-load 'flycheck
    ;;;(setq-default flycheck-disabled-checkers '(rust
        ;;;rust-cargo rust-clippy rust)))
  ;;;(remove-hook 'rust-mode-hook 'flycheck-mode)
  ;;;(remove-hook 'rust-mode-hook 'eldoc-mode)
  ;;;(remove-hook 'rust-mode-hook 'flycheck-rust-mode)
  (remove-hook 'rust-mode-hook 'adaptive-wrap-prefix-mode)
  (setq rust-match-angle-brackets nil)
  (setq rust-format-on-save t)
  (remove-hook 'rust-mode-hook 'adaptive-wrap-prefix-mode)
  (setq redisplay-dont-pause t)

  ;; c/c++ things
  (setq-default dotspacemacs-configuration-layers
    '((c-c++ :variables c-c++-enable-clang-support t)))

  ;; helm workaround

  (with-eval-after-load 'helm
    (setq helm-display-function 'helm-default-display-buffer))
)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (lsp-rust lsp-mode let-alist seq ucs-utils font-utils persistent-soft list-utils pcache caml powerline faceup pcre2el org-category-capture alert log4e gntp sml-mode markdown-mode skewer-mode simple-httpd js2-mode prop-menu parent-mode request xcscope haml-mode gitignore-mode flyspell-correct pos-tip flx git-commit ghub with-editor smartparens iedit anzu goto-chg undo-tree scala-mode json-mode tablist docker-tramp json-snatcher json-reformat web-completion-data dash-functional tern ghc haskell-mode company-math math-symbol-lists inflections edn multiple-cursors paredit peg highlight spinner queue rust-mode inf-ruby bind-map packed auctex pythonic f s company dash elixir-mode pkg-info epl async auto-complete popup typescript-mode eval-sexp-fu cider clojure-mode anaconda-mode sbt-mode evil flycheck helm helm-core yasnippet avy projectile org-plus-contrib magit magit-popup hydra bind-key vi-tilde-fringe yapfify yaml-mode xterm-color ws-butler winum which-key web-mode web-beautify volatile-highlights vagrant-tramp vagrant uuidgen utop use-package unicode-fonts unfill tuareg toml-mode toc-org tide tagedit sql-indent spaceline smeargle slim-mode shell-pop scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe restart-emacs rbenv rake rainbow-delimiters racket-mode racer pyvenv pytest pyenv-mode py-isort pug-mode pretty-mode popwin pip-requirements persp-mode paradox orgit org-projectile org-present org-pomodoro org-mime org-download org-bullets open-junk-file ocp-indent ob-sml ob-elixir noflet nginx-mode neotree mwim multi-term move-text mmm-mode minitest merlin markdown-toc magit-gitflow macrostep lua-mode lorem-ipsum livid-mode live-py-mode linum-relative link-hint less-css-mode js2-refactor js-doc intero indent-guide idris-mode hy-mode hungry-delete htmlize hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-hoogle helm-gtags helm-gitignore helm-flx helm-descbinds helm-dash helm-css-scss helm-cscope helm-company helm-c-yasnippet helm-ag haskell-snippets groovy-mode google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md ggtags geiser fuzzy flyspell-correct-helm flycheck-rust flycheck-pos-tip flycheck-mix flycheck-haskell flycheck-elm flx-ido flow-minor-mode fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eshell-z eshell-prompt-extras esh-help erlang ensime emmet-mode elm-mode elisp-slime-nav dumb-jump dr-racket-like-unicode dockerfile-mode docker disaster diminish define-word dash-at-point cython-mode company-web company-tern company-statistics company-ghci company-ghc company-coq company-cabal company-c-headers company-auctex company-anaconda column-enforce-mode coffee-mode cmm-mode cmake-mode clojure-snippets clj-refactor clean-aindent-mode clang-format cider-eval-sexp-fu chruby cargo bundler auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile auctex-latexmk alchemist aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (treemacs-projectile treemacs pfuture lsp-rust lsp-mode let-alist seq ucs-utils font-utils persistent-soft list-utils pcache caml powerline faceup pcre2el org-category-capture alert log4e gntp sml-mode markdown-mode skewer-mode simple-httpd js2-mode prop-menu parent-mode request xcscope haml-mode gitignore-mode flyspell-correct pos-tip flx git-commit ghub with-editor smartparens iedit anzu goto-chg undo-tree scala-mode json-mode tablist docker-tramp json-snatcher json-reformat web-completion-data dash-functional tern ghc haskell-mode company-math math-symbol-lists inflections edn multiple-cursors paredit peg highlight spinner queue rust-mode inf-ruby bind-map packed auctex pythonic f s company dash elixir-mode pkg-info epl async auto-complete popup typescript-mode eval-sexp-fu cider clojure-mode anaconda-mode sbt-mode evil flycheck helm helm-core yasnippet avy projectile org-plus-contrib magit magit-popup hydra bind-key vi-tilde-fringe yapfify yaml-mode xterm-color ws-butler winum which-key web-mode web-beautify volatile-highlights vagrant-tramp vagrant uuidgen utop use-package unicode-fonts unfill tuareg toml-mode toc-org tide tagedit sql-indent spaceline smeargle slim-mode shell-pop scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe restart-emacs rbenv rake rainbow-delimiters racket-mode racer pyvenv pytest pyenv-mode py-isort pug-mode pretty-mode popwin pip-requirements persp-mode paradox orgit org-projectile org-present org-pomodoro org-mime org-download org-bullets open-junk-file ocp-indent ob-sml ob-elixir noflet nginx-mode neotree mwim multi-term move-text mmm-mode minitest merlin markdown-toc magit-gitflow macrostep lua-mode lorem-ipsum livid-mode live-py-mode linum-relative link-hint less-css-mode js2-refactor js-doc intero indent-guide idris-mode hy-mode hungry-delete htmlize hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-hoogle helm-gtags helm-gitignore helm-flx helm-descbinds helm-dash helm-css-scss helm-cscope helm-company helm-c-yasnippet helm-ag haskell-snippets groovy-mode google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md ggtags geiser fuzzy flyspell-correct-helm flycheck-rust flycheck-pos-tip flycheck-mix flycheck-haskell flycheck-elm flx-ido flow-minor-mode fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eshell-z eshell-prompt-extras esh-help erlang ensime emmet-mode elm-mode elisp-slime-nav dumb-jump dr-racket-like-unicode dockerfile-mode docker disaster diminish define-word dash-at-point cython-mode company-web company-tern company-statistics company-ghci company-ghc company-coq company-cabal company-c-headers company-auctex company-anaconda column-enforce-mode coffee-mode cmm-mode cmake-mode clojure-snippets clj-refactor clean-aindent-mode clang-format cider-eval-sexp-fu chruby cargo bundler auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile auctex-latexmk alchemist aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
