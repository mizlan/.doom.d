;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

(package! vimrc-mode)

(package! nofrils-acme-theme)
(package! acme-theme)

(package! lsp-julia :recipe (:host github :repo "non-jedi/lsp-julia"))

;; (package! emacs-everywhere :recipe (:host github :repo "tecosaur/emacs-everywhere"))

(unpin! doom-themes)

(package! keycast :pin "a3a0798349...")
