;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq doom-font (font-spec :family "Roboto Mono" :size 18 :weight 'light)
      doom-variable-pitch-font (font-spec :family "Avenir")
      doom-unicode-font (font-spec :family "MesloLGM Nerd Font Mono"))

(delq! 'special-mode global-hl-line-modes)

(setq doom-theme 'modus-operandi)
(setq display-line-numbers-type 'relative)

(setq user-full-name "Michael Lan"
      user-mail-address "michaellan202@gmail.com")

(map! :leader "SPC" #'counsel-M-x )

;; --- NOTE LSP

(setq lsp-enable-folding t)
(setq lsp-folding-range-limit 100)
(setq lsp-clients-clangd-args '("-j=3"
                                "--background-index"
                                "--clang-tidy"
                                "--completion-style=detailed"
                                "--header-insertion=iwyu"))
(after! lsp-clangd (set-lsp-priority! 'clangd 2))
(setq lsp-julia-default-environment "~/.julia/environments/v1.5")

;; --- END LSP

;; --- NOTE ORG

(setq org-directory "~/org/")
(setq org-superstar-headline-bullets-list '("❖" "◉" "◈" "○" "⁘"))

;; --- END ORG

;; --- NOTE EMAIL

(setq +mu4e-mu4e-mail-path "~/.mail")
(set-email-account! "michaellan202@gmail.com"
                    '((mu4e-sent-folder       . "/gmail/Sent Mail")
                      (mu4e-drafts-folder     . "/gmail/Drafts")
                      (mu4e-trash-folder      . "/gmail/Trash")
                      (mu4e-refile-folder     . "/gmail/All Mail")
                      (smtpmail-smtp-user     . "michaellan202@gmail.com")
                      (mu4e-compose-signature . "---\nMichael Lan"))
                    t)

;; --- END EMAIL
