(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(calendar-mark-diary-entries-flag t)
 '(calendar-view-diary-initially-flag t)
 '(centaur-tabs-hide-tabs-hooks
   '(magit-status-mode-hook magit-popup-mode-hook reb-mode-hook completion-list-mode-hook Custom-mode-hook doom-dashboard-mode-hook compilation-mode-hook ibuffer-mode-hook message-mode-hook fundamental-mode-hook))
 '(centaur-tabs-set-bar 'over)
 '(completion-ignored-extensions
   '(".hi" ".o" "~" ".bin" ".lbin" ".so" ".a" ".ln" ".blg" ".bbl" ".elc" ".lof" ".glo" ".idx" ".lot" ".svn/" ".hg/" ".git/" ".bzr/" "CVS/" "_darcs/" "_MTN/" ".fmt" ".tfm" ".class" ".fas" ".lib" ".mem" ".x86f" ".sparcf" ".dfsl" ".pfsl" ".d64fsl" ".p64fsl" ".lx64fsl" ".lx32fsl" ".dx64fsl" ".dx32fsl" ".fx64fsl" ".fx32fsl" ".sx64fsl" ".sx32fsl" ".wx64fsl" ".wx32fsl" ".fasl" ".ufsl" ".fsl" ".dxl" ".lo" ".la" ".gmo" ".mo" ".toc" ".aux" ".cp" ".fn" ".ky" ".pg" ".tp" ".vr" ".cps" ".fns" ".kys" ".pgs" ".tps" ".vrs" ".pyc" ".pyo" ".meta" ".rypc" ".bak" ".cs.meta"))
 '(deft-filter-only-filenames t)
 '(diary-file "~/.diary")
 '(evil-goggles-enable-delete t)
 '(global-display-fill-column-indicator-mode nil)
 '(indent-tabs-mode t)
 '(org-agenda-files '("~/org/agenda"))
 '(org-fancy-priorities-list '("⚑" "■"))
 '(org-format-latex-options
   '(:foreground default :background default :scale 1.5 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
     ("begin" "$1" "$" "$$" "\\(" "\\[")))
 '(org-highlight-latex-and-related '(latex script entities))
 '(org-indent-indentation-per-level 2)
 '(org-journal-file-type 'yearly)
 '(org-todo-keywords
   '((seqence "TODO(t)" "PROJ(p)" "LOOP(r)" "STRT(s)" "WAIT(w)" "HOLD(h)" "IDEA(i)" "|" "DONE(d)" "KILL(k)")
     (sequence "[ ](T)" "[-](S)" "[?](W)" "|" "[X](D)")
     (sequence "|" "OKAY(o)" "YES(y)" "NO(n)")))
 '(package-selected-packages
   '(eterm-256color org-modern jabber git-timemachine fira-code-mode undo-tree slack reddigg powerline-evil pdf-tools org-journal no-spam md4rd markdown-preview-mode lsp-pyright kakoune jammer impatient-mode hardcore-mode grip-mode gitconfig ghub ein doom-themes async))
 '(recentf-max-saved-items 10000)
 '(smartparens-global-mode t)
 '(sp-autoinsert-pair nil)
 '(warning-suppress-types '((lsp-mode) (use-package) (defvaralias))))
(put 'customize-group 'disabled nil)
(put 'customize-variable 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-group-subtitle ((t (:foreground "#f7768e" :height 1.0))))
 '(org-document-info ((t (:foreground "#f7768e" :weight semi-bold :height 1.5))))
 '(org-document-info-keyword ((t (:height 1.5 :weight semi-bold :inherit shadow))))
 '(org-document-title ((t (:foreground "#f7768e" :weight bold :height 1.5))))
 '(org-level-1 ((t (:height 1.5 :extend t :inherit outline-1))))
 '(org-level-2 ((t (:height 1.25 :extend t :inherit outline-2)))))

(put 'customize-face 'disabled nil)
