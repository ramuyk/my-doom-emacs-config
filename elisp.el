;;; elisp.el -*- lexical-binding: t; -*-

;;* unbind keys
(map! :leader "f e" nil)
(map! :leader "SPC" nil)

;;* evil shortcuts
(with-eval-after-load 'helm-files
  (define-key helm-find-files-map (kbd "^") 'helm-find-files-up-one-level))


;; Unbind Shift+Tab in org-mode to prevent conflicts
(with-eval-after-load 'org
  (define-key org-mode-map (kbd "<S-iso-lefttab>") nil))

(with-eval-after-load 'evil
  (progn
    (evil-define-key 'insert 'global (kbd "<S-iso-lefttab>") 'q/go-to-column-50)
    (evil-define-key 'insert 'global (kbd "<S-<tab>") 'q/go-to-column-50)
    (evil-define-key 'normal 'global (kbd "<down>") 'a/window-down)
    (evil-define-key 'normal 'global (kbd "<up>") 'q/window-up)
    (evil-define-key 'normal 'global (kbd "<left>") 'centaur-tabs-backward)
    (evil-define-key 'normal 'global (kbd "<right>") 'centaur-tabs-forward)
    (evil-define-key 'normal 'global (kbd "C-<left>") 'previous-buffer)
    (evil-define-key 'normal 'global (kbd "C-<right>") 'next-buffer)
    (evil-define-key 'normal 'global (kbd "M-<left>") 'centaur-tabs-move-current-tab-to-left)
    (evil-define-key 'normal 'global (kbd "M-<right>") 'centaur-tabs-move-current-tab-to-right)
    (evil-define-key 'normal 'global (kbd "'") 'q/evil-goto-marker-or-bookmark)
    (evil-define-key 'normal 'global (kbd "m") 'a/evil-set-marker-and-bookmark)
    (evil-define-key 'normal 'global (kbd "z a") 'a/toggle-current-outline)
    (evil-define-key 'normal 'global (kbd "z e") 'a/org-next-src-block)
    (evil-define-key 'normal 'global (kbd "z f a") 'outline-hide-body)
    (evil-define-key 'normal 'global (kbd "z f u") 'outline-show-all)
    (evil-define-key 'normal 'global (kbd "z n") 'a/narrow-to-outline)
    (evil-define-key 'normal 'global (kbd "z u") 'a/widen-and-collapse-if-narrowed)
    (evil-define-key 'visual 'global (kbd "t s") 'sort-lines)
    (evil-define-key 'visual 'global (kbd "t t") 'a/create-temp-buffer-with-selection)
    (evil-define-key 'visual 'global (kbd "t p") 'speed-type-region)
    ))


;;* evil shortcuts (harpoon)
(with-eval-after-load 'evil
  (progn
    (evil-define-key 'normal 'global (kbd ", s") 'harpoon-toggle-quick-menu)
    (evil-define-key 'normal 'global (kbd ", m") 'harpoon-quick-menu-hydra)
    (evil-define-key 'normal 'global (kbd ", a") 'harpoon-add-file)
    (evil-define-key 'normal 'global (kbd ", l") 'harpoon-toggle-file)
    (evil-define-key 'normal 'global (kbd ", d d") 'harpoon-delete-item)
    (evil-define-key 'normal 'global (kbd ", c") 'harpoon-clear)

    (evil-define-key 'normal 'global (kbd ", 1") 'harpoon-go-to-1)
    (evil-define-key 'normal 'global (kbd ", 2") 'harpoon-go-to-2)
    (evil-define-key 'normal 'global (kbd ", 3") 'harpoon-go-to-3)
    (evil-define-key 'normal 'global (kbd ", 4") 'harpoon-go-to-4)
    (evil-define-key 'normal 'global (kbd ", 5") 'harpoon-go-to-5)
    (evil-define-key 'normal 'global (kbd ", 6") 'harpoon-go-to-6)
    (evil-define-key 'normal 'global (kbd ", 7") 'harpoon-go-to-7)
    (evil-define-key 'normal 'global (kbd ", 8") 'harpoon-go-to-8)
    (evil-define-key 'normal 'global (kbd ", 9") 'harpoon-go-to-9)
    (evil-define-key 'normal 'global (kbd ", d 1") 'harpoon-delete-1)
    (evil-define-key 'normal 'global (kbd ", d 2") 'harpoon-delete-2)
    (evil-define-key 'normal 'global (kbd ", d 3") 'harpoon-delete-3)
    (evil-define-key 'normal 'global (kbd ", d 4") 'harpoon-delete-4)
    (evil-define-key 'normal 'global (kbd ", d 5") 'harpoon-delete-5)
    (evil-define-key 'normal 'global (kbd ", d 6") 'harpoon-delete-6)
    (evil-define-key 'normal 'global (kbd ", d 7") 'harpoon-delete-7)
    (evil-define-key 'normal 'global (kbd ", d 8") 'harpoon-delete-8)
    (evil-define-key 'normal 'global (kbd ", d 9") 'harpoon-delete-9)
    (evil-define-key 'normal 'global (kbd ", d 9") 'harpoon-delete-9)

    (evil-define-key 'normal 'global (kbd ", i") 'imenu-list)
    (evil-define-key 'normal 'global (kbd ", ,") 'a/helm-find-gt-directories)
    (evil-define-key 'normal 'global (kbd "SPC 1 2") 'a/helm-find-gt-directories)
    (evil-define-key 'normal 'global (kbd "SPC 1 3") 'a/helm-find-all-gt-directories)
    (evil-define-key 'normal 'global (kbd "SPC 1 4") 'a/helm-find-github-directories)
    (evil-define-key 'normal 'global (kbd ", SPC") 'a/helm-find-all-gt-directories)
    (evil-define-key 'normal 'global (kbd "SPC SPC .") 'Helper-describe-bindings)
    (evil-define-key 'normal 'global (kbd ", r") 'helm-register)
    (evil-define-key 'normal 'global (kbd ", b") 'helm-bookmarks)
    ))
;;* shortcuts global
(global-set-key (kbd "C-j") 'windmove-down)
(global-set-key (kbd "C-k") 'windmove-up)
(global-set-key (kbd "C-l") 'windmove-right)
(global-set-key (kbd "C-h") 'windmove-left)
(global-set-key (kbd "C-c l") 'q/go-to-column-50)

;; (evil-define-key 'insert 'global (kbd "C-c l") 'q/go-to-column-50)

;;* SPC (leader key)

  ;;** special characters
(shortcut "," 'a/helm-fuzzy-folder-find-files)
(shortcut "SPC ," 'helm-find)
(shortcut "SPC SPC ," 'a/root-reopen-file)
(shortcut "." 'helm-M-x)
(shortcut "SPC 1" 'delete-other-windows)
(shortcut "SPC 0" 'delete-window)
(shortcut "SPC SPC ." 'helm-apropos)
(shortcut "<" 'a/goto-previous-outline)
(shortcut ">" 'a/goto-next-outline)
(shortcut "<left>" 'a/goto-previous-outline)
(shortcut "<right>" 'a/goto-next-outline)
(shortcut "/" 'swiper-isearch)
(shortcut "SPC /" 'swiper-all)

  ;;** a
(shortcut "a" 'a/dired-root)

  ;;** b
(shortcut "b b" 'a/helm-fuzzy-open-buffers)
(shortcut "b t" 'a/helm-fuzzy-file-history)
(shortcut "b l" 'a/helm-fuzzy-file-locate)
(global-set-key (kbd "C-c y") 'q/helm-copy-to-temp-buffer)
(shortcut "b m" 'toggle-minibuffer)
(shortcut "b k" 'q/kill-buffer-and-go-back)
;;(shortcut "b s" 'swiper-helm)
(shortcut "b s" 'swiper-isearch)
(shortcut "b a" 'swiper-all)
(shortcut "b +" 'q/make-current-file-executable)
(shortcut "b p" '+helm/projectile-find-file)

  ;;** c
(shortcut "c c" 'a/execute-code)

  ;;** e
;; (shortcut "e e" 'eshell)
;; (shortcut "e v" 'vterm)
(shortcut "e e" 'projectile-run-eshell)
(shortcut "e b" 'projectile-ibuffer)
(shortcut "e d" 'projectile-dired)
(shortcut "e v" 'projectile-run-vterm)
(shortcut "e i" 'ielm)


  ;;** f
(shortcut "f e d" 'a/open-file "open-config-el" (concat (getenv "HOME") "/.doom.d/config.el"))
(shortcut "f e i" 'a/open-file "open-init-el" (concat (getenv "HOME") "/.doom.d/init.el"))
(shortcut "f e m" 'a/open-file "open-elisp-el" (concat (getenv "HOME") "/.doom.d/elisp.el"))
(shortcut "f e p" 'a/open-file "open-packages-el" (concat (getenv "HOME") "/.doom.d/packages.el"))
(shortcut "f e r" 'a/open-file "open-packages-el" (concat (getenv "HOME") "/.doom.d/README.md"))

(shortcut "f v d" 'a/open-file "open-config-el" (concat (getenv "HOME") "/.config/nvim/init.lua"))
(shortcut "f v m" 'a/open-file "open-elisp-el" (concat (getenv "HOME") "/.config/nvim/lua/myconfig.lua"))
(shortcut "f v r" 'a/open-file "open-packages-el" (concat (getenv "HOME") "/.config/nvim/README.md"))

  ;;** j
(shortcut "j j" 'a/avy-goto-char-timer-dim-screen)
(shortcut "j l" 'avy-goto-line)
(shortcut "j w" 'avy-goto-word-or-subword-1)
(shortcut "j 2" 'avy-goto-word-1)
(shortcut "j c" 'avy-goto-char)
(shortcut "j k" 'centaur-tabs-ace-jump)

  ;;** k
(shortcut "k k" 'helm-execute-kmacro)
(shortcut "k n" 'name-last-kbd-macro)
(shortcut "k i" 'insert-kbd-macro)
(shortcut "k e" 'edit-named-kbd-macro)

  ;;** p
(shortcut "p f" '+helm/projectile-find-file)
(shortcut "p i" 'a/helm-fuzzy-project-content-rg)
(shortcut "p k" 'a/projectile-kill-other-buffers)
(shortcut "p p" 'a/helm-fuzzy-project-switch)
(shortcut "p 1" 'a/helm-fuzzy-folder-content-1)
(shortcut "p 2" 'a/helm-fuzzy-folder-content-2)

  ;;** m
(shortcut "m 1" 'magit-status)
(shortcut "m m" 'magit-log-current)
(shortcut "m f" 'magit-log-buffer-file)
(shortcut "m r" 'magit-refresh)
;;(shortcut "m l" 'magit-pull)
(shortcut "m c" 'magit-checkout)

  ;;** h
(shortcut "h l" 'clm/open-command-log-buffer)

  ;;** w
(shortcut "w k" 'delete-window)
(shortcut "w h" 'split-window-horizontally)
(shortcut "w v" 'split-window-vertically)
(shortcut "w w" 'winner-undo)
(shortcut "w f" 'winner-redo)


  ;;** y
(shortcut "y" 'z/vim-yank-y)
(shortcut "Y" 'z/vim-yank-Y)
(shortcut "d" 'z/vim-delete-d)


;;* functions
(defun a/open-file (path)
  "opens a file from the system"
  (interactive)
  (find-file path))

(defun a/dired-root ()
  "Open Dired in the directory of the current buffer's file."
  (interactive)
  (dired default-directory))

(defun q/go-to-column-50 ()
  "Go to the 50th column of the current line, inserting spaces if necessary."
  (interactive)
  (unless (looking-at-p "^$")
    (evil-append-line 1))
  (let* ((current-column (current-column))
         (comment-string (cond ((eq major-mode 'org-mode) "")
                               ((eq major-mode 'python-mode) "# ")
                               ((eq major-mode 'js2-mode) "// ")
                               ((eq major-mode 'emacs-lisp-mode) ";; ")
                               (t ""))))
    (if (> current-column 50)
        (progn
          (evil-normal-state)
          (move-to-column 50))
      (progn
        (when (< current-column 50)
          (insert (make-string (- 50 current-column) ?\s))
          (insert comment-string))
        (evil-normal-state)))))

(defun a/evil-set-marker-and-bookmark (char)
  "Set a marker at point for CHAR and also create a bookmark with a similar name."
  (interactive "cSet marker: ")
  (let ((bookmark-name (format "evil-marker-%c" (downcase char))))
    (if (and (>= char 65) (<= char 90))  ; If the character is uppercase
        (evil-set-marker char (point))
      (progn
        (evil-set-marker char)
        (bookmark-set bookmark-name)
        (bookmark-save)))))

(defun q/evil-goto-marker-or-bookmark (char)
  "Go to the marker associated with CHAR or jump to the bookmark if the marker is not set."
  (interactive (list (read-char "Goto marker: ")))
  (let ((bookmark-name (format "evil-marker-%c" (downcase char))))
    (cond
     ((and (>= char 65) (<= char 90))  ; If the character is uppercase
      (evil-goto-mark char))
     ((evil-get-marker char)
      (evil-goto-mark char))
     (t
      (bookmark-jump bookmark-name)))))

(defun a/toggle-current-outline ()
  "Close all outlines except the current one. If current one is closed, open it."
  (interactive)
  (cond ((eq major-mode 'org-mode)
         (save-excursion
           (org-overview)  ; this will close all outlines
           (ignore-errors
             (org-reveal)) ; this will open the current outline if it's closed
           (org-cycle)))   ; this will close the current outline if it's opened
        (outline-minor-mode
         (save-excursion
           (outline-hide-body)
           (outline-show-entry)
           (outline-show-children)))
        (t (message "Not in org-mode or outline-minor-mode."))))

(defun a/org-next-src-block ()
  "Move cursor to the beginning of the next source block."
  (interactive)
  (when (org-at-heading-p)
    (org-cycle))
  (if (re-search-forward "^#\\+begin_src" nil t)
      (progn
        (forward-line 1)
        (beginning-of-line))
    (message "No further source blocks.")))


(defun a/narrow-to-outline ()
  "Narrow the buffer to the current outline section and show all content in the narrowed region."
  (interactive)
  (save-excursion
    (outline-back-to-heading t)
    (let ((start (point)))
      (outline-end-of-heading)
      (outline-end-of-subtree)
      (narrow-to-region start (point))
      (outline-show-all))))

(defun a/widen-and-collapse-if-narrowed ()
  "If in a narrowed view, widen the buffer and collapse the outline."
  (interactive)
  (when (or (/= (point-min) 1) (/= (point-max) (1+ (buffer-size))))
    (evil-goto-first-line)
    (widen)
    (outline-hide-subtree)
    (evil-scroll-line-to-center nil)))


(defun q/kill-buffer-and-go-back ()
  "Kills the current buffer and switches to the previously active buffer."
  (interactive)
  (let ((previous-buf (other-buffer (current-buffer) t)))
    (kill-this-buffer)
    (switch-to-buffer previous-buf)))

(defun q/make-current-file-executable ()
  "Make the current file executable."
  (interactive)
  (let ((file (buffer-file-name)))
    (if (and file (file-exists-p file))
        (progn
          (set-file-modes file (logior (file-modes file) #o100))
          (message "Made %s executable" file))
      (error "Buffer is not visiting a file"))))

(defvar display-messages-buffer-toggle t)
(defun toggle-minibuffer ()
  "Toggle the visibility of the messages buffer and set focus accordingly."
  (interactive)
  (let ((output-buffer-name "*Messages*"))
    (if display-messages-buffer-toggle
        (progn
          (with-current-buffer output-buffer-name
            (goto-char (point-max)))
          (switch-to-buffer-other-window output-buffer-name))
      (progn
        (delete-windows-on output-buffer-name)
        (bury-buffer output-buffer-name)
        (other-window -1)))
    (setq display-messages-buffer-toggle (not display-messages-buffer-toggle))))

(defun a/create-temp-buffer-with-selection ()
  "Create a temporary buffer with the currently selected text."
  (interactive)
  (let ((selection (buffer-substring-no-properties (region-beginning) (region-end)))
        (filename (buffer-file-name)))
    (switch-to-buffer (generate-new-buffer-name
                       (concat "*Temp*"
                               (when filename
                                 (concat "." (file-name-extension filename))))))
    (insert selection)))

(defun a/projectile-kill-other-buffers ()
  "Kill all buffers of the current project except the current one and Treemacs."
  (interactive)
  (let ((current-buffer (current-buffer))
        (project-root (projectile-project-root)))
    (dolist (buffer (buffer-list))
      (with-current-buffer buffer
        (when (and (not (eq buffer current-buffer))
                   (projectile-project-root)
                   (string-equal (projectile-project-root) project-root)
                   (not (string-prefix-p " *Treemacs" (buffer-name buffer)))) ; Exclude Treemacs buffers
          (kill-buffer buffer))))))

(defun a/goto-previous-outline ()
  "Move to the previous outline heading."
  (interactive)
  (if (derived-mode-p 'org-mode)
      (org-previous-visible-heading 1)
    (outline-previous-visible-heading 1)))

(defun a/goto-next-outline ()
  "Move to the next outline heading."
  (interactive)
  (if (derived-mode-p 'org-mode)
      (org-next-visible-heading 1)
    (outline-next-visible-heading 1)))

(defun a/avy-goto-char-timer-dim-screen ()
  "Wrapper function that dims the screen before calling `avy-goto-char-timer'."
  (interactive)
  (let ((dimmed-face-remap (face-remap-add-relative 'default :foreground "#666666")))
    (setq avy-timeout-seconds 0.4)
	(unwind-protect
	  (avy-goto-char-timer)
	  (face-remap-remove-relative dimmed-face-remap))))


(defun q/find-gt-directories ()
  "Recursively find all directories in the user's home directory that contain a .git directory, ignoring node_modules, volumes, and all hidden directories except .git."
  (let ((default-directory (expand-file-name "~/"))
        (home (expand-file-name "~/")))
    (message "Running find command in %s" home)
    (let ((output (shell-command-to-string
                   (format "find %s -type d \\( -name node_modules -o -name volumes -o -name '.*' ! -name '.git' \\) -prune -o -type d -name .git -exec dirname {} \\;" home))))
      (message "Find command executed. Processing results.")
      (split-string output "\n" t))))


(defun a/helm-find-gt-directories ()
  "Use Helm to select a directory with a .git subdirectory and open it in Dired."
  (interactive)
  (let ((directories (q/find-gt-directories)))
    (message "Launching Helm with directories: %s" directories)
    (helm :sources (helm-build-sync-source "GT Directories"
                     :candidates directories
                     :fuzzy-match t
                     :action '(("Open in Dired" . (lambda (candidate)
                                                    (message "Selected candidate: %s" candidate)
                                                    (dired candidate)))))
          :buffer "*helm gt directories*")))


(defun q/find-github-directories ()
  "Recursively find all directories in the user's home directory that contain a .git directory, ignoring node_modules, volumes, and all hidden directories except .git."
  (let ((default-directory (expand-file-name "/data/github/"))
        (home (expand-file-name "/data/github/")))
    (message "Running find command in %s" home)
    (let ((output (shell-command-to-string
                   (format "find %s -type d \\( -name node_modules -o -name volumes -o -name '.*' ! -name '.git' \\) -prune -o -type d -name .git -exec dirname {} \\;" home))))
      (message "Find command executed. Processing results.")
      (split-string output "\n" t))))


(defun a/helm-find-github-directories ()
  "Use Helm to select a directory with a .git subdirectory and open it in Dired."
  (interactive)
  (let ((directories (q/find-github-directories)))
    (message "Launching Helm with directories: %s" directories)
    (helm :sources (helm-build-sync-source "GT Directories"
                     :candidates directories
                     :fuzzy-match t
                     :action '(("Open in Dired" . (lambda (candidate)
                                                    (message "Selected candidate: %s" candidate)
                                                    (dired candidate)))))
          :buffer "*helm gt directories*")))

(defun q/find-all-gt-directories ()
  "Recursively find all directories in the user's home directory that contain a .git directory, ignoring node_modules and volumes."
  (let ((default-directory (expand-file-name "~/"))
        (home (expand-file-name "~/")))
    (message "Running find command in %s" home)
    (let ((output (shell-command-to-string
                   (format "find %s -type d \\( -name node_modules -o -name volumes \\) -prune -o -type d -name .git -exec dirname {} \\;" home))))
      (message "Find command executed. Processing results.")
      (split-string output "\n" t))))

(defun a/helm-find-all-gt-directories ()
  "Use Helm to select a directory with a .git subdirectory and open it in Dired."
  (interactive)
  (let ((directories (q/find-all-gt-directories)))
    (message "Launching Helm with directories: %s" directories)
    (helm :sources (helm-build-sync-source "GT Directories"
                     :candidates directories
                     :fuzzy-match t
                     :action '(("Open in Dired" . (lambda (candidate)
                                                    (message "Selected candidate: %s" candidate)
                                                    (dired candidate)))))
          :buffer "*helm gt directories*")))


;;* exec functions

(defun a/execute-code ()
  "Function that executes code based on the major mode."
  (interactive)
  (save-restriction
    (widen)
    (cond
     ((eq major-mode 'sh-mode) (a/execute-bash-code))
     ((eq major-mode 'python-mode) (a/execute-python-code))
     ((eq major-mode 'go-mode) (a/execute-go-code))
     ((eq major-mode 'yaml-mode) (a/execute-yaml-code))
     ((eq major-mode 'dockerfile-mode) (a/execute-yaml-code))
     ((eq major-mode 'fundamental-mode) (a/execute-elisp-code))
     ((or (eq major-mode 'js-mode) (eq major-mode 'js2-mode) (eq major-mode 'rjsx-mode)) (a/execute-js-code))
     ((eq major-mode 'emacs-lisp-mode) (a/execute-elisp-code))
     ((eq major-mode 'org-mode) (a/execute-org-code))
     (t (message "No execution function for major mode: %s" major-mode)))))

(defun a/execute-bash-code ()
  "Execute bash script code."
  (interactive)
  (write-region (point-min) (point-max) "/tmp/file")
  (a/run-async-shell-command-in-split-window "bash /tmp/file"))

(defun a/execute-python-code ()
  "Execute Python code."
  (interactive)
  (write-region (point-min) (point-max) "/tmp/file")
  (a/run-async-shell-command-in-split-window "python3 /tmp/file"))

(defun a/execute-go-code ()
  "Execute Go code."
  (interactive)
  (write-region (point-min) (point-max) "/tmp/file")
  (a/run-async-shell-command-in-split-window "mv /tmp/file /tmp/file.go && go run /tmp/file.go"))

(defun a/execute-yaml-code ()
  "Execute Docker Compose from YAML."
  (interactive)
  (write-region (point-min) (point-max) "/tmp/file")
  (a/run-async-shell-command-in-split-window "docker compose up --build"))

(defun a/execute-elisp-code ()
  "Execute Docker Compose from YAML."
  (interactive)
  (eval-buffer))

(defun a/execute-js-code ()
  "Execute JavaScript code."
  (interactive)
  (write-region (point-min) (point-max) "/tmp/file")
  (let ((node-path (if (projectile-project-p)
                       (projectile-project-root)
                     "~/node_modules")))
    (a/run-async-shell-command-in-split-window (concat "NODE_PATH=" node-path " node /tmp/file"))))

;; (defun a/execute-emacs-lisp-code ()
;;   "Execute Emacs Lisp code."
;;   (interactive)
;;   (save-buffer)
;;   (a/run-async-shell-command-in-split-window (concat "emacs --batch --script " buffer-file-name)))

(defun a/execute-org-code ()
  "Execute Org Babel code."
  (interactive)
  (org-ctrl-c-ctrl-c))


(defvar execute-code-output-window nil
  "Window to display the output of executed code.")

(defun a/run-async-shell-command-in-split-window (code)
  "Run async shell command in a split window."
  (let ((current-window (selected-window)))
    (unless (and execute-code-output-window (window-live-p execute-code-output-window))
      (setq execute-code-output-window (split-window-horizontally))
      (select-window execute-code-output-window)
      (window-swap-states current-window execute-code-output-window)
      (select-window current-window))
    (with-selected-window execute-code-output-window
      (switch-to-buffer (get-buffer-create "*Async Shell Command*"))
      (let ((process (get-buffer-process (current-buffer))))
        (when process
          (delete-process process)))
      (async-shell-command code))
    (select-window current-window)))

;;* root functions
(defun a/root-reopen-file ()
  "Reopen the current file as root."
  (interactive)
  (if buffer-file-name
      (let ((point (point)))
        (find-alternate-file (concat "/sudo::" buffer-file-name))
        (goto-char point))
    (message "Buffer is not visiting a file!")))

;;* kbd macros
(fset 'a/window-down (kbd "L zt"))
(fset 'q/window-up (kbd "H zb"))

(fset 'z/vim-yank-y (kbd "[[\"+y]]"))
(fset 'z/vim-yank-Y (kbd "[[\"+Y]]"))
(fset 'z/vim-delete-d (kbd "[[\"_d]]"))

;;* kmacros



;;* aliases
(defalias 'a/helm-fuzzy-file-history '+helm/workspace-mini)
(defalias 'a/helm-fuzzy-open-buffers 'helm-buffers-list)
(defalias 'a/helm-fuzzy-file-locate 'helm-for-files)
(defalias 'a/helm-fuzzy-project-file '+helm/projectile-find-file)
(defalias 'a/helm-fuzzy-project-content-rg 'helm-projectile-rg)
(defalias 'a/helm-fuzzy-project-switch 'helm-projectile-switch-project)
(defalias 'a/helm-fuzzy-folder-content-1 'helm-do-grep-ag)
(defalias 'a/helm-fuzzy-folder-content-2 'helm-rg)
(defalias 'a/helm-fuzzy-folder-find-files 'helm-find-files)
(defalias 'a/helm-find-file-recursively 'helm-find)
