;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!
;; use org-bullets-mode for utf8 symbols as org bullets

(use-package org-download
  :ensure t
  :defer t
  :init
  ;; Add handlers for drag-and-drop when Org is loaded.
  (with-eval-after-load 'org
    (org-download-enable)))
(add-hook! 'dired-mode-hook 'org-download-enable)

(require 'org-roam)
(use-package org-roam
      :ensure t
      :hook
      (after-init . org-roam-mode)
      :custom
      (org-roam-directory "~/org/org-roam")
      :bind (:map org-roam-mode-map
              (("C-c n l" . org-roam)
               ("C-c n f" . org-roam-find-file)
               ("C-c n g" . org-roam-graph))
              :map org-mode-map
              (("C-c n i" . org-roam-insert))
              (("C-c n I" . org-roam-insert-immediate))))


(require 'org-roam)
(use-package org-roam
      :ensure t
      :hook
      (after-init . org-roam-mode)
      :custom
      (org-roam-directory "~/org/org-roam")
      :bind (:map org-roam-mode-map
              (("C-c n l" . org-roam)
               ("C-c n f" . org-roam-find-file)
               ("C-c n g" . org-roam-graph))
              :map org-mode-map
              (("C-c n i" . org-roam-insert))
              (("C-c n I" . org-roam-insert-immediate))))


(use-package org-roam-bibtex
  :after org-roam
  :hook (org-roam-mode . org-roam-bibtex-mode))

;; If you cloned the repository
(use-package org-roam-bibtex
  :after org-roam
  :load-path "~/org/org-roam-bibtex/" ;Modify with your own path
  :hook (org-roam-mode . org-roam-bibtex-mode))

;; Ensure the size of images does not overwhelm org window.
;;(setq org-image-actual-width (/ (display-pixel-width) 6))
;;(setq org-image-actual-height (/ (display-pixel-height) 6))
;;(setq org-latex-images-centered nil)
(setq org-image-actual-width nil)

(require 'org-journal)
(setq org-journal-dir "~/org/journal/")
(setq org-journal-file-format "%Y-%m-%d")
(setq org-journal-date-format "%A, %d %B %Y")
(setq org-journal-encrypt-journal 't)
(setq org-journal-enable-encryption nil)
(setq org-journal-enable-agenda-integration 't)
(setq org-journal-file-type 'weekly)


;;; Template code for org-mode files to turn into LaTEX
(define-skeleton org-skeleton
  "In-buffer settings info for a emacs-org file."
  "Title: "
  "#+TITLE:" str " \n"
  "#+AUTHOR: Alex Kearney\n"
  "#+OPTIONS: tex:t\n"
  "#+STARTUP: showall, inlineimages, latexpreiew\n"
  "#+latex_header: \\hypersetup{colorlinks=true,linkcolor-black,citecolor=black,urlcolor=black}\n"
  "\n\n\n\n\n"
  (backward-char 58)
)

(global-set-key (kbd "C-c t") 'org-skeleton)

;; Journal insert
;;

;;; Template code for org-mode files to turn into LaTEX
(define-skeleton journal-skeleton
  "Fills out a CGP Grey style journal"
  ""
  "** Good\n\n"
  "** Bad\n\n"
  "** Proud\n\n"
  "** Forward\n\n"
  "\n\n\n\n\n"
  ;;(backward-char 58)
)

(global-set-key (kbd "C-c j") 'journal-skeleton)
;; pretty bullets
;;

(require 'org-bullets)
;;make available "org-bullet-face" such that I can control the font size individually
(setq org-bullets-face-name (quote org-bullet-face))
(setq org-bullets-bullet-list '("※" "✿" "❀" "✲" "✱" "✻" "✼" "✽" "✾" "⎈" "✽" "❁" "❂" "❃" "✤" "❅" "❆" "☼"))
(use-package org-bullets
  :hook (( org-mode ) . org-bullets-mode))

;; GPG and PGP for org and specifically org-journal

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Alex Kearney"
      user-mail-address "hi@alexkearney.com")

;;(setq org-latex-create-formula-image-program 'dvipng)
(setq org-preview-latex-default-process 'dvisvgm)
;;(setq org-latex-create-formula-image-program 'imagemagick)
(setq org-format-latex-options (plist-put org-format-latex-options :scale 2.5))
(setq elfeed-feeds
      '("https://www.quantnews.com/feed/")
      )

(setq org-src-fontify-natively t
    org-src-tab-acts-natively t
    org-confirm-babel-evaluate nil
    org-edit-src-content-indentation 0)

(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

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

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;
;;(package! ui doom :disable t)

(setq doom-theme 'konga)

(setq doom-font (font-spec :family "Fira Mono" :size 18 :weight 'medium)
      doom-variable-pitch-font (font-spec :family "Fira Sans" :weight 'normal)
      doom-unicode-font (font-spec :family "Fira Mono" :size 18 :weight 'normal)
      doom-big-font (font-spec :family "Nova Mono" :size 18` :weight 'normal)
)

(use-package doom-themes
  :config
  ;; Global settings (defaults)
  ;;

  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'konga t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
  (doom-themes-treemacs-config)

  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config)
 )


;; If you use `org' and don'tr ant your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; Setting the `org-download' location
(setq-default org-download-image-dir "~/org/pictures")

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


;;FANCY SPLOSH
;;

(setq fancy-splash-image "~/.doom.d/black-hole.png")

(after! org
  (setq org-capture-templates '("d" "default" plain (function org-roam--capture-get-point)
     "%?"
     :file-name "%<%Y%m%d%H%M%S>-${slug}"
     :head "#+title: ${title}\n#+STARTUP: latexpreview\n#+STARTUP: inlineimages\n#+OPTIONS: tex:t"
     :unnarrowed t
     )))

;; Zotero and bibtex setup


(setq zot_bib "~/org/org-roam-bibtex/lib.bib"
      org_notes "~/org/")

(setq
 bibtex-completion-notes-path org_notes
 bibtex-completion-bibliography zot_bib
 bibtex-completion-pdf-field "file"
 bibtex-completion-notes-template-multiple-files
 (concat
  "#+TITLE: ${title}\n"
  "#+ROAM_KEY: cite:${=key=}\n"
  "* TODO Notes\n"
  ":PROPERTIES:\n"
  ":Custom_ID: ${=key=}\n"
  ":NOTER_DOCUMENT: %(orb-process-file-field \"${=key=}\")\n"
  ":AUTHOR: ${author-abbrev}\n"
  ":JOURNAL: ${journaltitle}\n"
  ":DATE: ${date}\n"
  ":YEAR: ${year}\n"
  ":DOI: ${doi}\n"
  ":URL: ${url}\n"
  ":END:\n\n"
  )
 )

(use-package! org-ref
    :config
    (setq
         org-ref-completion-library 'org-ref-ivy-cite
         org-ref-get-pdf-filename-function 'org-ref-get-pdf-filename-helm-bibtex
         org-ref-default-bibliography (list zot_bib)
         org-ref-bibliography-notes (concat org_notes "/bibnotes.org")
         org-ref-note-title-format "* TODO %y - %t\n :PROPERTIES:\n  :Custom_ID: %k\n  :NOTER_DOCUMENT: %F\n :ROAM_KEY: cite:%k\n  :AUTHOR: %9a\n  :JOURNAL: %j\n  :YEAR: %y\n  :VOLUME: %v\n  :PAGES: %p\n  :DOI: %D\n  :URL: %U\n :END:\n\n"
         org-ref-notes-directory org_notes
         org-ref-notes-function 'orb-edit-notes
         ))

(use-package org-roam-bibtex
  :after (org-roam)
  :hook (org-roam-mode . org-roam-bibtex-mode)
  :config
  (setq orb-preformat-keywords
   '("=key=" "title" "url" "file" "author-or-editor" "keywords"))
  (setq orb-templates
        '(("r" "ref" plain (function org-roam-capture--get-point)
           ""
           :file-name "${slug}"
           :head "#+TITLE: ${=key=}: ${title}\n#+ROAM_KEY: ${ref}
- tags ::
- keywords :: ${keywords}
\n* ${title}\n  :PROPERTIES:\n  :Custom_ID: ${=key=}\n  :URL: ${url}\n  :AUTHOR: ${author-or-editor}\n  :NOTER_DOCUMENT: %(orb-process-file-field \"${=key=}\")\n  :NOTER_PAGE: \n  :END:\n\n"
           :unnarrowed t))))

;; latex bits

;;load "auctex.el"        nil t t)
;;(load "preview-latex.el" nil t t)

;;(require 'tex-site)

;;(setq TeX-auto-save          t
;;      TeX-parse-self         t
;;      TeX-electric-sub-and-superscript 1
;;      preview-scale-function 1.33)

;;(add-hook 'LaTeX-mode-hook 'flyspell-mode)
;;(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(require 'epa-file)
(epa-file-enable)
(require 'org-crypt)
(org-crypt-use-before-save-magic)
(setq org-tags-exclude-from-inheritance (quote ("crypt")))
;;(use-package epa-file
;;    :ensure nil
;;    :config
;;    (setq epa-file-encrypt-to '("hi@alexkearney.com"))
;;    :custom
;;    (epa-file-select-keys 'silent))

;;(use-package org-crypt
;;  :ensure nil  ;; included with org-mode
;;  :after org
;;  :config
;;  (org-crypt-use-before-save-magic)
;;  (setq org-tags-exclude-from-inheritance (quote ("crypt")))
;;  :custom
;;  (org-crypt-key "hi@alexkearney.com"))
;; GPG key to use for encryption
;; Either the Key ID or set to nil to use symmetric encryption.
(setq org-crypt-key  "29440D1A9484963F6E1E8ECC64522A83434F2D65")
;;(setf epa-pinentry-mode 'ask)
