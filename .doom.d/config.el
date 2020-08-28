;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Zeeshan Lakahni"
      user-mail-address "zeeshan.lakhani@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.

;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Fira Code" :size 11)
      doom-variable-pitch-font (font-spec :family "Fira Code")
      doom-unicode-font (font-spec :family "Fira Code")
      doom-big-font (font-spec :family "Fira Code" :size 19))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-city-lights)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

;; fonts and macs
(when IS-MAC
  (when (fboundp 'mac-auto-operator-composition-mode)
    (mac-auto-operator-composition-mode))
  (mac-pseudo-daemon-mode))

;; smoother scrolling
(setq scroll-step 1
      scroll-margin 1)

;; Load snippets
(after! yasnippet
  (push (expand-file-name "snippets/" doom-private-dir) yas-snippet-dirs))

;;modeline
(after! doom-modeline
  (setq doom-modeline-major-mode-icon t))

(use-package! nyan-mode
  :after doom-modeline
  :config
  (nyan-mode))

;; windows
(use-package! windmove
 :bind
 ("C-x <up>" . windmove-up)
 ("C-x <down>" . windmove-down)
 ("C-x <right>" . windmove-right)
 ("C-x <left>" . windmove-left))

;; no tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(setq c-basic-offset 4)

;; whitespace and 80 chars
(setq whitespace-line-column 80
      whitespace-style
      '(face lines-tail trailing))
(setq-default fill-column 80)
;; turn on whitespace mode
(global-whitespace-mode +1)
;; but not in org
(setq whitespace-global-modes '(not org-mode))
;; turn on whitespace cleanup
(add-hook! 'before-save-hook 'whitespace-cleanup)

;; issue realted to indent-guides
(after! highlight-indent-guides
  (highlight-indent-guides-auto-set-faces))

;; special newline madness
(setq require-final-newline t)

;; direnv
(use-package! direnv
  :config
  (direnv-mode)
  (setq direnv-always-show-summary nil))

;; loads
(load! "+languages")
(load! "+bindings")

;; server start
(use-package server
  :config
  (unless (server-running-p) (server-start)))
