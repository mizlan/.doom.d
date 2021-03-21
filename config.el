;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq doom-font (font-spec :family "Roboto Mono")
      doom-variable-pitch-font (font-spec :family "Helvetica Neue"))

(delq! 'special-mode global-hl-line-modes)

(setq doom-theme 'doom-flatwhite)
(setq display-line-numbers-type nil)

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

(setq-hook! 'clojure-mode-hook
  company-idle-delay 0.1
  company-minimum-prefix-length 1)

(setq company-idle-delay 0.3)
(setq company-minimum-prefix-length 2)

(setq org-directory "~/org/")
(setq org-superstar-headline-bullets-list '("❖" "◉" "◈" "○" "⁘"))
(setq org-ellipsis " ▼")
(setq org-hide-emphasis-markers t)

(setq ivy-posframe-border-width 30)

(setq evil-snipe-scope 'visible)

(add-hook! 'elfeed-search-mode-hook 'elfeed-update)
(after! elfeed
  (setq elfeed-search-filter "@1-month-ago"))

(add-hook! 'writeroom-mode-hook
  (if writeroom-mode
      (add-hook 'post-command-hook #'recenter nil t)
    (remove-hook 'post-command-hook #'recenter t)))

;; (setq! lispyville-key-theme
;;        '(slurp/barf-lispy))

(setq doom-themes-treemacs-enable-variable-pitch nil)

(setq nav-flash-use-pulse t)

(set-popup-rule! "^\\*compilation" :side 'right :size 0.433)

(defun compile-and-run-cpp ()
  (interactive)
  (save-buffer)
  (compile (concat "g++ -std=c++17 -Wshadow -Wall -DNOAM_LOCAL "
                   (file-name-nondirectory (buffer-file-name))
                   " -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && ./a.out") t)
  (interactive)
  (evil-window-right 1))

(add-hook 'c++-mode-hook
          (lambda () (local-set-key (kbd "<f9>") #'compile-and-run)))
