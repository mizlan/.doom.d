;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq doom-font (font-spec :family "Roboto Mono")
      doom-variable-pitch-font (font-spec :family "Avenir"))

(delq! 'special-mode global-hl-line-modes)

(setq doom-theme 'doom-monokai-pro)
(setq display-line-numbers-type 'relative)

(setq user-full-name "Michael Lan"
      user-mail-address "michaellan202@gmail.com")

(map! :leader "SPC" #'counsel-M-x )

(setq lsp-enable-folding t)
(setq lsp-folding-range-limit 100)
(setq lsp-clients-clangd-args
      '("-j=3"
        "--background-index"
        "--clang-tidy"
        "--completion-style=detailed"
        "--header-insertion=iwyu"))
(after! lsp-clangd (set-lsp-priority! 'clangd 2))
(setq lsp-julia-default-environment "~/.julia/environments/v1.5")

(setq company-idle-delay 0.0)
(setq company-minimum-prefix-length 1)

(setq org-directory "~/org/")
(setq org-superstar-headline-bullets-list '("❖" "◉" "◈" "○" "⁘"))
(setq org-ellipsis " ▼")
(setq org-hide-emphasis-markers t)

(setq ivy-posframe-border-width 20)

(setq evil-snipe-scope 'visible)
