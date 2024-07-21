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
;; (load-theme 'doom-challenger-deep t)
;; (load-theme 'doom-city-lights t)
;; (load-theme 'doom-dark+ t)
;; (load-theme 'doom-dracula t)
;; (load-theme 'doom-ephemeral t)
;; (load-theme 'doom-gruvbox t)
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
;; (load-theme 'doom-nord t)
;; (load-theme 'doom-nord-light t)
;; (load-theme 'doom-nova t)
;; (load-theme 'doom-oceanic-next t)
;; (load-theme 'doom-old-hope t)
;; (load-theme 'doom-one t)
;; (load-theme 'doom-one-light t)
;; (load-theme 'doom-opera t)
;; (load-theme 'doom-opera-light t)
;; (load-theme 'doom-outrun-electric t)
;; (load-theme 'doom-palenight t)
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
(load-theme 'doom-tomorrow-night t)
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

(use-package! dired+
  :load-path "~/.doom.d/external"
  :init
  (setq dired-hide-details-hide-symlink-targets t)
  :config
  (require 'dired+)
  (add-hook 'dired-mode-hook 'dired-hide-details-mode))


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

;;* shortcut function
(defun shortcut (shortcut command &optional name &rest args)
  "Create a custom shortcut in Doom Emacs."
  (let* ((function-name (or name (symbol-name command)))
         (full-command (if args
                           `(lambda ()
                              (interactive)
                              (apply ',command ',args))
                         command)))  ; Use the original command directly
    (map! :leader
          :desc function-name
          shortcut full-command)))

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
                           (set-popup-rule! "^\\*helm" :size 0.99 :vslot -4 :select t :quit t :ttl nil))))

(winner-mode 1)

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . js-mode))


;;* outline
(defvar z/outline-regexp-alist
  '(
    (c-mode          . "\\s-*//\\*+")
    (latex-mode      . "\\s-*\\%\\*+")
    (dockerfile-mode . "\\s-*#\\*+")
    (emacs-lisp-mode . "\\s-*;;\\*+")
    (html-mode       . "\\s-*<!--\\*+")
    (java-mode       . "\\s-*//\\*+")
    (js-mode         . "\\s-*//\\*+")
    (js2-mode        . "\\s-*//\\*+")
    (rjsx-mode       . "\\s-*//\\*+")
    (go-mode         . "\\s-*//\\*+")
    (typescript-mode . "\\s-*//\\*+")
    (python-mode     . "\\s-*#\\*+")
    (sql-mode        . "\\s-*\\-\\-\\s\\*+")
    (sh-mode         . "\\s-*#\\*+")
    (ruby-mode       . "\\s-*\\(#\\*+\\|\\(class\\|module\\)\\s-+\\)")
    (awk-mode        . "\\s-*#\\*+")
    (conf-mode       . "\\s-*#\\*+")
    (vimrc-mode      . "\\s-*\"\\*+")
    (web-mode        . "\\(\\s-*//\\*+\\)\\|\\(\\s-*<!--\\*+\\)")
    (yaml-mode       . "\\s-*#\\*+")
    (terraform-mode  . "\\s-*#\\*+")
  ))

(defun z/emacs-lisp-outline-level ()
  "Return the outline level based on the number of asterisks for Emacs Lisp."
  (let ((str (match-string 0)))
    (cl-count ?* str)))

(defun z/ruby-outline-level ()
  "Return the outline level based on the number of asterisks for Ruby."
  (let ((str (match-string 0)))
    (cl-count ?* str)))

(defun z/debug-ruby-outline ()
  "Debug function to manually set outline-regexp for Ruby mode."
  (interactive)
  (setq-local outline-regexp "\\s-*\\(#\\*+\\|\\(class\\|module\\)\\s-+\\)")
  (outline-minor-mode 1)
  (message "Manually set outline-regexp for Ruby: %s" outline-regexp))

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
  (message "setup-outline-mode")
  (let ((regexp (cdr (assoc major-mode z/outline-regexp-alist))))
    (when regexp
      (setq-local outline-regexp regexp)
      (outline-minor-mode 1)
      (evil-define-key 'normal outline-minor-mode-map (kbd "TAB") 'a/context-aware-tab)
      (evil-define-key 'visual 'global (kbd "TAB") 'a/toggle-comments)
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

;;* load elisp.el
(load-file (expand-file-name "elisp.el" "~/.doom.d/"))
