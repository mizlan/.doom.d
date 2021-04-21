;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq doom-font (font-spec :family "Roboto Mono")
      doom-variable-pitch-font (font-spec :family "Helvetica Neue"))

(delq! 'special-mode global-hl-line-modes)

(setq doom-theme 'modus-operandi)
(setq doom-gruvbox-light-brighter-modeline t)
(setq display-line-numbers-type nil)

(setq user-full-name "Michael Lan"
      user-mail-address "michaellan202@gmail.com")

(map! :leader "SPC" #'counsel-M-x )
(map! "C-/" #'imenu)

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

(setq-hook! 'clojure-mode-hook
  company-idle-delay 0.1
  company-minimum-prefix-length 1)

(custom-set-faces!
  '(mode-line :family "Roboto Mono" :height 0.8)
  '(mode-line-inactive :family "Roboto Mono" :height 0.8))

(setq doom-modeline-height 25)

(setq org-directory "~/org/")
(setq org-superstar-headline-bullets-list '("❖" "◉" "◈" "○" "⁘"))
(setq org-ellipsis " ▼")
(setq org-hide-emphasis-markers t)

(setq evil-snipe-scope 'visible)

(add-hook! 'elfeed-search-mode-hook 'elfeed-update)
(after! elfeed
  (setq elfeed-search-filter "@1-month-ago"))

(setq doom-themes-treemacs-enable-variable-pitch nil)

(use-package! keycast
  :commands keycast-mode
  :config
  (define-minor-mode keycast-mode
    "Show current command and its key binding in the mode line."
    :global t
    (if keycast-mode
        (progn
          (add-hook 'pre-command-hook 'keycast--update t)
          (add-to-list 'global-mode-string '("" mode-line-keycast " ")))
      (remove-hook 'pre-command-hook 'keycast--update)
      (setq global-mode-string (remove '("" mode-line-keycast " ") global-mode-string))))
  (custom-set-faces!
    '(keycast-command :inherit doom-modeline-debug
                      :height 0.9)
    '(keycast-key :inherit custom-modified
                  :height 1.1
                  :weight bold)))

(blink-cursor-mode)
