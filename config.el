;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Michael Lan"
      user-mail-address "michaellan202@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-font (font-spec :family "JetBrains Mono" :size 18)
      doom-big-font (font-spec :family "JetBrains Mono" :size 24)
      doom-variable-pitch-font (font-spec :family "Helvetica" :size 18)
      doom-unicode-font (font-spec :family "JuliaMono")
      doom-serif-font (font-spec :family "IBM Plex Mono" :weight 'light))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-zenburn)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; notmuch is gr8
;; may have to run `gmi pull -f' to perform a full sync
(setq +notmuch-sync-backend 'gmi)
(setq +notmuch-home-function (lambda () (notmuch-search "tag:inbox date:1d..")))
(map! :after notmuch
      :map notmuch-tree-mode-map
      :nv "d" #'+notmuch/tree-delete
      :map notmuch-search-mode-map
      :nv "d" #'+notmuch/search-delete
      :n "A" #'notmuch-delete-all
      :n "F" #'notmuch-search-from-sender
      :n "u" #'notmuch-unsubscribe)

(setq notmuch-saved-searches
      '((:name "inbox"     :query "tag:inbox not tag:trash" :key "i")
        (:name "flagged"   :query "tag:flagged"             :key "f")
        (:name "sent"      :query "tag:sent"                :key "s")
        (:name "drafts"    :query "tag:draft"               :key "d")
        (:name "trash"     :query "tag:trash"               :key "t")
        (:name "spam"      :query "tag:spam"                :key "x")
        (:name "classroom" :query "tag:gc"                  :key "c")))

(defun notmuch-search-from-sender ()
  (interactive)
  (notmuch-search (format "from:\"%s\"" (plist-get (notmuch-search-get-result) :authors))))

(defun notmuch-delete-all ()
  (interactive)
  (if (> 30 (count-lines (point-min) (point-max)))
      (notmuch-search-add-tag +notmuch-delete-tags (point-min) (point-max))))

(defun notmuch-unsubscribe ()
  (interactive)
  (let ((thread-id (notmuch-search-find-thread-id)))
    (with-temp-buffer
      ;; populate buffer with full email text
      (call-process "notmuch" nil t nil "show" "--format=raw" thread-id)
      ;; call python script to parse text and perform unsubscribe
      (call-process-region nil nil "python" t '(t t) nil (expand-file-name "~/scripts/unsubscribe.py"))
      ;; show output
      (message "%s" (buffer-string)))))

(setq org-agenda-timegrid-use-ampm 1)

(setq modus-themes-bold-constructs t)
(setq modus-themes-completions 'moderate)
(setq modus-themes-region 'bg-only)
