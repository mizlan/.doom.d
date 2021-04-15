;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

(package! vimrc-mode)
(package! nofrils-acme-theme)
(package! acme-theme)
(package! lsp-julia :recipe (:host github :repo "non-jedi/lsp-julia"))
(package! keycast :pin "a3a0798349...")
(package! graphql-mode)
(unpin! doom-themes)
(package! solaire-mode :disable t)
