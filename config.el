;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "MJ Ponsonby"
      user-mail-address "mj@crypticcoder.co.uk")

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

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
; (setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
;; lol
(setq display-line-numbers-type 'relative)
(setq display-line-numbers 'relative)
;; (setq doom-font (font-spec :family "HackFCLigatured" :size 12))
(setq doom-font (font-spec :family "FiraMath"))
(setq doom-font (font-spec :family "FiraCode" :size 12))
(load-theme 'doom-tokyo-night t)
(setq global-whitespace-mode `t)
(setq whitespace-style `trailing)
(setq whitespace-mode `t)
(setq doom-modeline-major-mode-icon t)
(setq doom-modeline-buffer-state-icon t)
(setq doom-modeline-enable-word-count t)
(setq doom-modeline-indent-info t)
(setq doom-modeline-buffer-encoding t)
(setq doom-modeline-lsp t)
(setq doom-modeline-modal-icon nil)
(setq-default major-mode 'org-mode)
(setq-default tab-width 4)

(evil-define-key 'visual evil-mc-key-map
  "A" #'evil-mc-make-cursor-in-visual-selection-end
  "I" #'evil-mc-make-cursor-in-visual-selection-beg)

(after! org
  ;; Import ox-latex to get org-latex-classes and other funcitonality
  ;; for exporting to LaTeX from org
  (use-package! ox-latex
    :init
    ;; code here will run immediately
    :config
    ;; code here will run after the package is loaded
    (setq org-latex-pdf-process
          '("pdflatex -interaction nonstopmode -output-directory %o %f"
            "bibtex %b"
            "pdflatex -interaction nonstopmode -output-directory %o %f"
            "pdflatex -interaction nonstopmode -output-directory %o %f"))
    (setq org-latex-with-hyperref nil) ;; stop org adding hypersetup{author..} to latex export
    ;; (setq org-latex-prefer-user-labels t)

    ;; deleted unwanted file extensions after latexMK
    (setq org-latex-logfiles-extensions
          (quote ("lof" "lot" "tex~" "aux" "idx" "log" "out" "toc" "nav" "snm" "vrb" "dvi" "fdb_latexmk" "blg" "brf" "fls" "entoc" "ps" "spl" "bbl" "xmpi" "run.xml" "bcf" "acn" "acr" "alg" "glg" "gls" "ist")))

    (unless (boundp 'org-latex-classes)
      (setq org-latex-classes nil)))
)

;;;autoload
(defun mk-project (type name)
    (interactive "*sEnter project type: \nsEnter project name: ")
    (cd "~/Documents/Programming")
    (cd type)
    (mkdir name)
    (cd name))

(defun conf (item)
  (interactive "*sWhat are you configuring: ")
  (cd "~/.config")
  (find-file item))

(map! :desc "function keys"
      "<f5>" #'minimap-mode
      "<f8>" #'treemacs)

(map! :desc "resize"
     "C-S-k" #'evil-window-increase-height
     "C-S-j" #'evil-window-decrease-height
     "C-S-l" #'evil-window-increase-width
     "C-S-h" #'evil-window-decrease-width)
(setq browse-url-browser-function 'w3m-browse-url)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
;; optional keyboard short-cut
(global-set-key "\C-xm" 'browse-url-at-point)


(setq deft-directory "~/Documents/University/"
      deft-extensions '("org")
      deft-recursive t)

(use-package kak)
(map!
  :v "|" #'kak-exec-shell-command
  :v "s" (lambda (beg end) (interactive "r") (kak-select beg end nil))
  :v "S" (lambda (beg end) (interactive "r") (kak-select beg end t))
  :v "M-s" #'kak-split-lines
  :v "M-k" (lambda () (interactive) (kak-filter t))
  :v "M-K" (lambda () (interactive) (kak-filter nil))
  :v ". #" #'kak-insert-index)


(map!
 :n "U" #'undo-tree-visualize)


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

(after! org
  (setq org-hide-emphasis-markers t))


;; make sure counsel ignores meta files
(after! counsel
	(setq counsel-find-file-ignore-regexp "\\(?:^[#.]\\)\\|\\(?:[#~]$\\)\\|\\(?:^Icon?\\)\\|\\(.*\.bak\\)\\|\\(.*\.rpyc\\)\\|\\(.*\.meta\\)"))

(setq browse-url-browser-function 'browse-url-generic
browse-url-generic-program "firefox")
;; enable python for in-buffer evaluation
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))

;; all python code be safe
(defun my-org-confirm-babel-evaluate (lang body)
(not (string= lang "python")))
(setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)

(use-package org-fragtog)
(add-hook 'org-mode-hook 'org-fragtog-mode)
;; (add-hook 'org-mode-hook 'rainbow-delimiters)

(global-subword-mode 1)
;; (display-time-mode 1)

(defun ant-compile ()
  "Traveling up the path, find build.xml file and run compile"
  (interactive)
  (save-buffer)
  (with-temp-buffer
    (while (and (not (file-exists-p "build.xml"))
        (not (equal "/" default-directory)))
      (cd ".."))
    (set (make-local-variable 'compile-command)
     "ant -emacs")
    (call-interactively 'compile)))

;; (setq +zen-text-scale 0.8)

(defvar +zen-serif-p t
  "Whether to use a serifed font with `mixed-pitch-mode'.")

(after! writeroom-mode
  (defun +zen-prose-org-h ()
    "Reformat the current Org buffer appearance for prose."
    (when (eq major-mode 'org-mode)
      (setq display-line-numbers nil
            ;; visual-fill-column-width 60
            ;; org-adapt-indentation nil
	    )
      ;; (when (featurep 'org-modern)
      ;;   (setq-local org-modern-star '("🙘" "🙙" "🙚" "🙛")
      ;;               ;; org-modern-star '("🙐" "🙑" "🙒" "🙓" "🙔" "🙕" "🙖" "🙗")
      ;;               org-modern-hide-stars +zen-org-starhide)
      ;;   (org-modern-mode -1)
      ;;   (org-modern-mode 1))
      (setq
       +zen--original-org-indent-mode-p org-indent-mode)
      (org-indent-mode -1)))
  (add-hook 'writeroom-mode-enable-hook #'+zen-prose-org-h))

;; (use-package centaur-tabs
;;   :bind
;;   (:map evil-normal-state-map
;; 	     ("g t" . centaur-tabs-forward)
;; 	     ("g j" . evil-next-visual-line)
;; 	     ("g k" . evil-previous-visual-line)
;; 	     ("g K" . centaur-tabs-kill-other-buffers-in-current-group))
;;   (:map evil-motion-state-map
;; 	     ("g j" . evil-next-visual-line)
;; 	     ("g k" . evil-previous-visual-line))
;; )

;; (after! org-modern (add-hook 'org-mode-hook #'org-modern-mode)
;;   (add-hook 'org-agenda-finalize-hook #'org-modern-agenda)
;;   )

(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))


(setq initial-major-mode 'org-mode)
