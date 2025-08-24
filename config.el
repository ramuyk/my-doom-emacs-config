;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;;* default setup
;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;;* theme

;; (load-theme 'vscode-dark-plus t)
;; (load-theme 'doom-acario-dark t)
;; (load-theme 'doom-acario-light t)
;; (load-theme 'doom-ayu-dark t)
;; (load-theme 'doom-ayu-light t)
;; (load-theme 'doom-ayu-mirage t)
;;; (load-theme 'doom-challenger-deep t)
;; (load-theme 'doom-city-lights t)
;; (load-theme 'doom-dark+ t)
;; (load-theme 'doom-dracula t)
;; (load-theme 'doom-ephemeral t)
;;;(load-theme 'doom-gruvbox t)
;; (load-theme 'doom-gruvbox-light t)
;; (load-theme 'doom-henna t)
;; (load-theme 'doom-homage-black t)
;; (load-theme 'doom-homage-white t)
;; (load-theme 'doom-horizon t)
;; (load-theme 'doom-Iosvkem t)
;; (load-theme 'doom-laserwave t)
;; (load-theme 'doom-manegarm t)
;; (load-theme 'doom-material t)
;; (load-theme 'doom-miramare t)
;; (load-theme 'doom-molokai t)
;; (load-theme 'doom-monokai-classic t)
;; (load-theme 'doom-monokai-machine t)
;; (load-theme 'doom-monokai-octagon t)
;; (load-theme 'doom-monokai-pro t)
;; (load-theme 'doom-monokai-ristretto t)
;; (load-theme 'doom-monokai-spectrum t)
(load-theme 'doom-nord t)
;; (load-theme 'doom-nord-light t)
;; (load-theme 'doom-nova t)
;; (load-theme 'doom-oceanic-next t)
;; (load-theme 'doom-old-hope t)
;; (load-theme 'doom-one t)
;; (load-theme 'doom-one-light t)
;; (load-theme 'doom-opera t)
;; (load-theme 'doom-opera-light t)
;; (load-theme 'doom-outrun-electric t)
;;;(load-theme 'doom-palenight t)
;; (load-theme 'doom-plain t)
;; (load-theme 'doom-plain-dark t)
;; (load-theme 'doom-rouge t)
;; (load-theme 'doom-shades-of-purple t)
;; (load-theme 'doom-snazzy t)
;; (load-theme 'doom-solarized-dark t)
;; (load-theme 'doom-solarized-dark-high-contrast t)
;; (load-theme 'doom-solarized-light t)
;; (load-theme 'doom-sourcerer t)
;; (load-theme 'doom-spacegrey t)
;; (load-theme 'doom-tomorrow-day t)
;; (load-theme 'doom-tomorrow-night t)
;; (load-theme 'doom-vibrant t)
;; (load-theme 'doom-wilmersdorf t)
;; (load-theme 'doom-xcode t)
;; (load-theme 'doom-zenburn t)

;;* use-package

(use-package! vimrc-mode
  :mode (("\\.vim\\(rc\\)?\\'" . vimrc-mode)
         ("\\.ideavimrc\\'" . vimrc-mode)
         ("/vimrc\\'" . vimrc-mode)))

(use-package! projectile
  :init
  (projectile-mode 1)
  :config
  (setq projectile-indexing-method 'hybrid)
  ;;(setq projectile-indexing-method 'alien)
  (setq projectile-globally-ignored-directories (append '("node_modules" ".git")
                                                        projectile-globally-ignored-directories))
  (setq projectile-globally-ignored-files (append '("*.min.js" "*.bundle.js" "*.min.css" "pnpm-lock.json")
                                                  projectile-globally-ignored-files)))


(use-package! speed-type
  :commands (speed-type-text speed-type-region)
)

(add-hook 'dired-mode-hook (lambda () (dired-hide-details-mode 1)))

(use-package! centaur-tabs
  :config
  (centaur-tabs-mode t))
(setq centaur-tabs-set-icons t) ; Use icons in tabs
(setq centaur-tabs-set-modified-marker t) ; Show modified marker in tabs
(setq centaur-tabs-modified-marker "●") ; Set the modified marker as a dot
(setq centaur-tabs-cycle-scope 'tabs) ; Cycle through tabs in the current group

(defun z/post-switch-project-hook (&rest _args)
  "Function to execute after switching projects in centaur-tabs."
  (when (projectile-project-p) ; Check if the current buffer's directory is a known project root.
    (run-with-timer 0.1 nil 'z/treemacs-toggle)))

(advice-add 'centaur-tabs-switch-group :after 'z/post-switch-project-hook)

(use-package! command-log-mode
  :config
        (global-command-log-mode)
)

(use-package! treemacs
  :config
        (setq treemacs-show-hidden-files nil)
        (treemacs-follow-mode 1)
  )

(use-package! gptel
 :config
 (setq! gptel-backend (gptel-make-gh-copilot "Copilot")))
  ;;(setq! gptel-api-key (getenv "GPT_API")))

;;(gptel-make-gh-copilot "Copilot")

(use-package! copilot
 :hook (prog-mode . copilot-mode)
 :bind (:map copilot-completion-map
         ("<tab>" . 'copilot-accept-completion)
         ("TAB" . 'copilot-accept-completion)
         ("C-TAB" . 'copilot-accept-completion-by-word)
         ("C-<tab>" . 'copilot-accept-completion-by-word)))

;;* shortcut function
;; (defun shortcut (shortcut command &optional name &rest args)
;;   "Create a custom shortcut in Doom Emacs."
;;   (let* ((function-name (or name (symbol-name command)))
;;          (full-command (if args
;;                            `(lambda ()
;;                               (interactive)
;;                               (apply ',command ',args))
;;                          command)))  ; Use the original command directly
;;     (map! :leader
;;           :desc function-name
;;           shortcut full-command)))

(defun shortcut (shortcut command &optional name &rest args)
  "Create a custom shortcut in Doom Emacs.
SHORTCUT is a key sequence string.
COMMAND is a symbol or function.
NAME (optional) is the description.
ARGS are fixed arguments passed to COMMAND."
  (let* ((desc (or name (if (symbolp command) (symbol-name command) "anon-fn")))
         (fn   (if args
                   `(lambda ()
                      (interactive)
                      (apply #',command (list ,@args)))
                 command)))
    (map! :leader
          :desc desc
          shortcut fn)))


;;* indentation
(add-hook 'yaml-mode-hook
  (lambda ()
    (setq indent-tabs-mode nil)   ; Use spaces, not tabs
    (setq tab-width 2)            ; Set tab width to 2 spaces
    (setq yaml-indent-offset 2))) ; Set YAML indentation to 2 spaces

(add-hook 'emacs-lisp-mode-hook
  (lambda ()
    (setq indent-tabs-mode nil)  ;; Use spaces instead of tabs
    (setq tab-width 2)           ;; Set tab width to 2 spaces
    (setq lisp-indent-offset 2))) ;; Set Lisp indentation to 2 spaces

;;* lsp

;; Common Company settings
(after! company
  (setq company-idle-delay 0.1
        company-minimum-prefix-length 1))

(add-hook 'after-init-hook 'global-company-mode)

;; Common LSP settings
(after! lsp-mode
  (setq lsp-enable-snippet t
        lsp-auto-guess-root t))

;; LSP UI settings (optional for better UI)
(use-package! lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-position 'at-point
        lsp-ui-doc-delay 0.2
        lsp-ui-sideline-enable nil
        lsp-ui-peek-enable t))

(add-hook 'lsp-mode-hook 'lsp-ui-mode)

;; Python LSP settings
(after! lsp-python-ms
  (setq lsp-python-ms-auto-install-server t))

(add-hook 'python-mode-hook #'lsp)
(add-hook 'python-mode-hook 'company-mode)

;; JavaScript LSP settings
(add-hook 'js-mode-hook #'lsp)
(add-hook 'js2-mode-hook #'lsp)
(add-hook 'rjsx-mode-hook #'lsp)

(add-hook 'js-mode-hook 'company-mode)
(add-hook 'js2-mode-hook 'company-mode)
(add-hook 'rjsx-mode-hook 'company-mode)


;;* configuration
(setq which-key-idle-delay 0.1)

(setq display-line-numbers-type 'visual)
(global-display-line-numbers-mode)


(after! helm
  (setq helm-ff-skip-boring-files t)
  (add-to-list 'helm-boring-file-regexp-list "\\`\\.[^/]") ;; skip files beginning with .
  (run-with-timer 2 nil (lambda ()
                           ;; (set-popup-rule! "^\\*helm" :size 0.99 :vslot -4 :select t :quit t :ttl nil))))
                           (set-popup-rule! "^\\*helm" :size 0.50 :vslot -4 :select t :quit t :ttl nil))))

(winner-mode 1)
(add-to-list 'auto-mode-alist '("\\.prisma\\'" . js-mode))

;; Enable mouse support in terminal Emacs
(require 'mouse)
(xterm-mouse-mode t)

;; ;; Enable scrolling with the mouse wheel
(global-set-key [mouse-4] '(lambda () (interactive) (scroll-down 1)))
(global-set-key [mouse-5] '(lambda () (interactive) (scroll-up 1)))

;; ;; Optional: Enable mouse drag and drop
;; (setq mouse-drag-copy-region t)
;; (setq x-select-enable-clipboard t)

;;(use-package! xclip :config (xclip-mode 1))

(desktop-save-mode -1)
(setq desktop-save nil
  desktop-files-not-to-save "^.*$"  ;; Save nothing
  desktop-load-locked-desktop nil
  desktop-auto-save-timeout nil
  desktop-restore-eager 0
  desktop-restore-frames nil)

(remove-hook 'doom-init-ui-hook #'doom/restore-session)
(setq +workspaces-on-switch-project-behavior nil
  +workspaces-main nil  ;; Disable workspaces entirely
  persp-mode nil)  ;; Ensure persp-mode is disabled

(setq avy-all-windows t)

;; dirvish preview in tramp connections
(connection-local-set-profile-variables
  'remote-direct-async-process
  '((tramp-direct-async-process . t)))
(connection-local-set-profiles
  '(:application tramp :protocol "ssh")
  'remote-direct-async-process)

;;* outline
(defvar z/outline-regexp-alist
  '(
     (awk-mode        . "\\s-*#\\*+")
     (c-mode          . "\\s-*//\\*+")
     (conf-mode       . "\\s-*#\\*+")
     (dockerfile-mode . "\\s-*#\\*+")
     (elixir-mode     . "\\s-*#\\*+")
     (emacs-lisp-mode . "\\s-*;;\\*+\\|^;;;;.*")
     (go-mode         . "\\s-*//\\*+")
     (java-mode       . "\\s-*//\\*+")
     (js-mode         . "\\s-*//\\*+")
     (js2-mode        . "\\s-*//\\*+")
     (latex-mode      . "\\s-*\\%\\*+")
     (lua-mode        . "\\s-*\\-\\-\\*+")
     (python-mode     . "\\s-*#\\*+")
     (restclient-mode     . "\\s-*#\\*+")
     (graphql-mode     . "\\s-*#\\*+")
     (rjsx-mode       . "\\s-*//\\*+\\|\\s-*{/\\*\\*+")
     (typescript-tsx-mode . "\\s-*//\\*+\\|\\s-*{/\\*\\*+")
     (tsx-ts-mode . "\\s-*//\\*+\\|\\s-*{/\\*\\*+")
     (ruby-mode       . "\\s-*\\(#\\*+\\|\\(class\\|module\\)\\s-+\\)")
     (sh-mode         . "\\s-*#\\*+")
     (sql-mode        . "\\s-*\\-\\-\\*+")
     (terraform-mode  . "\\s-*#\\*+")
     (typescript-mode . "\\s-*//\\*+")
     (typescript-ts-mode . "\\s-*//\\*+")
     (vimrc-mode      . "\\s-*\"\\*+")
     (web-mode        . "\\(\\s-*//\\*+\\)\\|\\(\\s-*<!--\\*+\\)")
     (yaml-mode       . "\\s-*#\\*+")
     ))

(defun z/emacs-lisp-outline-level ()
  "Return the outline level based on the number of asterisks for Emacs Lisp."
  (let ((str (match-string 0)))
    (cl-count ?* str)))

(defun z/ruby-outline-level ()
  "Return the outline level based on the number of asterisks for Ruby."
  (let ((str (match-string 0)))
    (cl-count ?* str)))

(defun j/debug-ruby-outline ()
  "Debug function to manually set outline-regexp for Ruby mode."
  (interactive)
  (setq-local outline-regexp "\\s-*\\(#\\*+\\|\\(class\\|module\\)\\s-+\\)")
  (outline-minor-mode 1)
  (message "Manually set outline-regexp for Ruby: %s" outline-regexp))

(defun z/elixir-outline-level ()
  "Return the outline level based on the number of asterisks for Elixir."
  (let ((str (match-string 0)))
    (cl-count ?* str)))

(dolist (pair z/outline-regexp-alist)
  (let ((mode (car pair))
         (regexp (cdr pair)))
    (add-hook (intern (concat (symbol-name mode) "-hook"))
      (lambda ()
        (setq-local outline-regexp regexp)
        (outline-minor-mode 1)
        (when (eq mode 'emacs-lisp-mode)
          (setq-local outline-level 'z/emacs-lisp-outline-level))
        (when (eq mode 'ruby-mode)
          (setq-local outline-level 'z/ruby-outline-level))
        (message "Outline mode set for %s with regexp: %s" mode regexp)
        ;; Add similar conditions for other modes if needed
        ))))

(add-hook 'elixir-mode-hook (lambda () (z/elixir-outline-level)))

(defun q/toggle-outline ()
  "Toggle outline visibility using `outline-hide-subtree` and `outline-show-subtree`.
If not on a heading line, move to the previous visible heading and toggle its visibility."
  (interactive)
  (save-excursion
    (unless (outline-on-heading-p t)
      (outline-previous-visible-heading 1))
    (if (outline-invisible-p (line-end-position))
      (outline-show-subtree)
      (outline-hide-subtree))))

(defun a/context-aware-tab ()
  "A context-aware tab function."
  (interactive)
  (if (outline-on-heading-p t)
    (q/toggle-outline)
    (if (save-excursion (outline-back-to-heading t) (outline-on-heading-p t))
      (save-excursion
        (outline-back-to-heading t)
        (q/toggle-outline))
      (indent-for-tab-command))))


(defun a/setup-outline-mode ()
  "Setup outline minor mode based on `z/outline-regexp-alist`."
  (let ((regexp (cdr (assoc major-mode z/outline-regexp-alist))))
    (when regexp
      (setq-local outline-regexp regexp)
      (outline-minor-mode 1)
      (evil-define-key 'normal outline-minor-mode-map (kbd "<tab>") 'a/context-aware-tab)
      (evil-define-key 'visual 'global (kbd "<tab>") 'a/toggle-comments)
      (cond
        ((eq major-mode 'python-mode)
          (setq-local outline-heading-end-regexp "\n"))
        ;; Add more major modes if specific configurations are needed
        ))
    (message "Outline mode configured for %s with regexp: %s" major-mode regexp)))

(add-hook 'prog-mode-hook 'a/setup-outline-mode)

(defun a/toggle-comments (beg end)
  "Toggle comment on selected code."
  (interactive "r")
  (comment-or-uncomment-region beg end))


;;* a/m-x
;; --- Registries --------------------------------------------------------------

(defvar a/aliases nil
  "Symbols of personal commands defined via `a/defalias`.")

(defvar a/alias-tags nil
  "Alist of (ALIAS . TAG). Untagged aliases don't appear here.")

(defvar a/alias-targets nil
  "Alist of (ALIAS . TARGET) recorded by `a/defalias`.")

(defvar a/alias-active-tag 'all
  "Currently active tag filter. `all` means no filtering.")

(defvar a/alias-docs nil
  "Alist of (ALIAS . DOCSTRING) cached at definition time for UI annotations.")


;; --- API ---------------------------------------------------------------------

(defmacro a/defalias (alias target &optional tag)
  "Register ALIAS for TARGET without defining an interactive command.
If TAG is given, categorize this alias under TAG.
Also cache TARGET's 1st-line doc into `a/alias-docs` for display."
  `(progn
     ;; Register alias and mapping (no defun)
     (add-to-list 'a/aliases ',alias)
     (setq a/alias-targets (assq-delete-all ',alias a/alias-targets))
     (push (cons ',alias ',target) a/alias-targets)
     ,@(when tag
         `((setq a/alias-tags (assq-delete-all ',alias a/alias-tags))
           (push (cons ',alias ',tag) a/alias-tags)))
     ;; Cache first line of doc (if target loaded)
     (let* ((tgt ',target)
            (raw (and (fboundp tgt) (documentation tgt t)))
            (doc1 (and (stringp raw) (car (split-string raw "\n")))))
       (setq a/alias-docs (assq-delete-all ',alias a/alias-docs))
       (push (cons ',alias doc1) a/alias-docs))
     ',alias))


(defun a/alias-set-tag ()
  "Pick active tag filter from distinct tags (plus `all`)."
  (interactive)
  (let* ((tags (delete-dups (delq nil (mapcar #'cdr a/alias-tags))))
         (choices (cons "all" (mapcar #'symbol-name tags)))
         (sel (completing-read "Choose alias tag filter: " choices nil t nil nil "all")))
    (setq a/alias-active-tag (if (string= sel "all") 'all (intern sel)))))

(defun a/alias-M-x ()
  "Run one of my aliases, filtered by `a/alias-active-tag` (Consult UI with tabular docs)."
  (interactive)
  (unless a/aliases
    (user-error "No aliases defined with `a/defalias`"))
  (unless (require 'consult nil t)
    (user-error "Consult not loaded; install/enable it"))

  ;; Filter alias list
  (let* ((alist (if (eq a/alias-active-tag 'all)
                    a/aliases
                  (let (filtered)
                    (dolist (a a/aliases)
                      (when (eq (cdr (assq a a/alias-tags)) a/alias-active-tag)
                        (push a filtered)))
                    (nreverse filtered)))))
    (when (null alist)
      (user-error "No aliases with tag %s" (symbol-name a/alias-active-tag)))

    (let* ((names (mapcar #'symbol-name alist))
           ;; compute the doc-column once so we can align reliably
           (maxw 0))
      (dolist (n names) (setq maxw (max maxw (string-width n))))
      (let* ((doc-col (+ 2 maxw))  ;; 2 spaces after the longest alias
             (annotate
              (lambda (cn)
                (let* ((sym  (intern cn))
                       (tag  (cdr (assq sym a/alias-tags)))
                       (doc1 (cdr (assq sym a/alias-docs)))) ; cached first line (or nil)
                  (concat
                   (propertize " " 'display `(space :align-to ,doc-col))
                   (when doc1 (propertize doc1 'face 'completions-annotations))
                   (when tag  (propertize (format "  [%s]" tag) 'face 'shadow))))))
             (prompt (if (eq a/alias-active-tag 'all)
                         "Alias M-x: "
                       (format "Alias M-x [%s]: " (symbol-name a/alias-active-tag))))
             (choice (consult--read
                      names
                      :prompt prompt
                      :require-match t
                      :sort t
                      :category 'a/alias
                      :annotate annotate)))
        (let* ((alias  (intern choice))
               (target (or (cdr (assq alias a/alias-targets))
                           (user-error "Alias %s not found" alias))))
          (cond
           ((commandp target) (call-interactively target))
           ((fboundp  target) (funcall target))
           (t (user-error "Target %s is not fboundp; load the package first" target))))))))



(defun a/alias-refresh-docstrings ()
  "Rebuild `a/alias-docs` from targets. Run after packages load or when you update targets."
  (interactive)
  (setq a/alias-docs nil)
  (dolist (a a/aliases)
    (let* ((tgt  (cdr (assq a a/alias-targets)))
           (raw  (and tgt (fboundp tgt) (documentation tgt t)))
           (doc1 (and (stringp raw) (car (split-string raw "\n")))))
      (push (cons a doc1) a/alias-docs))))

;;* load elisp.el
(mapc #'load (file-expand-wildcards (expand-file-name "conf/*.el" doom-user-dir)))
(load-file (expand-file-name "alias.el" "~/.doom.d/"))
