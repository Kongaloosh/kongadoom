
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   '("/Users/kongaloosh/org/thesis/main.org" "/Users/kongaloosh/org/journal/2022-06-06.gpg"))
 '(org-roam-bibtex-mode nil)
 '(package-selected-packages
   '(ox-latex-subfigure spell-fu parsebib f emacsql dash bibtex-completion langtool helm-flyspell magit-section emacsql-sqlite async org-roam-ui org-roam helm-core helm org-fragtog ivy-bibtex projectile pkg-info pdf-tools org-roam-server org-roam-bibtex org-ref org-plus-contrib org-journal-list org-journal org-edit-latex org-download org-bullets latexdiff latex-math-preview key-chord ivy helm-bibtexkey helm-bibtex emacsql-sqlite3 doom-themes bbdb)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; package auto-updater
;;
(defun package-upgrade-all ()
  "Upgrade all packages automatically without showing *Packages* buffer."
  (interactive)
  (package-refresh-contents)
  (let (upgrades)
    (cl-flet ((get-version (name where)
                (let ((pkg (cadr (assq name where))))
                  (when pkg
                    (package-desc-version pkg)))))
      (dolist (package (mapcar #'car package-alist))
        (let ((in-archive (get-version package package-archive-contents)))
          (when (and in-archive
                     (version-list-< (get-version package package-alist)
                                     in-archive))
            (push (cadr (assq package package-archive-contents))
                  upgrades)))))
    (if upgrades
        (when (yes-or-no-p
               (message "Upgrade %d package%s (%s)? "
                        (length upgrades)
                        (if (= (length upgrades) 1) "" "s")
                        (mapconcat #'package-desc-full-name upgrades ", ")))
          (save-window-excursion
            (dolist (package-desc upgrades)
              (let ((old-package (cadr (assq (package-desc-name package-desc)
                                             package-alist))))
                (package-install package-desc)
                (package-delete  old-package)))))
      (message "All packages are up to date"))))


(require 'org-inlinetask)
