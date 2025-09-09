;;; elisp.el -*- lexical-binding: t; -*-

;;* unbind keys
(map! :leader "f e" nil)
(map! :leader "SPC" nil)
(map! :leader ";" nil)
(map! "<tab>" nil)
(map! "S-<return>" nil)

;;* s config
;;(setq evil-snipe-auto-disable-substitute nil)
;;(after! evil-snipe (evil-snipe-mode -1))
(remove-hook 'doom-first-input-hook #'evil-snipe-mode)
(remove-hook 'doom-first-input-hook #'evil-snipe-override-mode)
(after! evil-snipe (global-evil-snipe-mode -1))

(defvar my-s-prefix-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "s") #'a/vterm-here)
    (define-key map (kbd "S") #'a/vterm-project-here)
    (define-key map (kbd "e") #'a/eshell-here)
    (define-key map (kbd "E") #'a/eshell-project-here)
    (define-key map (kbd "v") #'a/vterm-here)
    (define-key map (kbd "V") #'a/vterm-project-here)
    (define-key map (kbd "b") #'projectile-ibuffer)
    (define-key map (kbd "d") #'projectile-dired)
    (define-key map (kbd "i") #'projectile-ielm)
    map))

(define-key evil-normal-state-map (kbd "s") my-s-prefix-map)

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
    (evil-define-key 'normal 'global (kbd "<down>") 'z/window-down)
    (evil-define-key 'normal 'global (kbd "<up>") 'z/window-up)
    (evil-define-key 'normal 'global (kbd "F") 'avy-goto-char-in-line)
    (evil-define-key 'normal 'global (kbd "<left>") 'centaur-tabs-backward)
    (evil-define-key 'normal 'global (kbd "<right>") 'centaur-tabs-forward)
    (evil-define-key 'normal 'global (kbd "C-<left>") 'previous-buffer)
    (evil-define-key 'normal 'global (kbd "C-<right>") 'next-buffer)
    (evil-define-key 'normal 'global (kbd "M-<left>") 'centaur-tabs-move-current-tab-to-left)
    (evil-define-key 'normal 'global (kbd "M-<right>") 'centaur-tabs-move-current-tab-to-right)
    (evil-define-key 'normal 'global (kbd "'") 'q/evil-goto-marker-or-bookmark)
    (evil-define-key 'normal 'global (kbd "m") 'a/evil-set-marker-and-bookmark)
    (evil-define-key 'normal 'global (kbd "z e") 'a/org-next-src-block)
    (evil-define-key 'normal 'global (kbd "z f a") 'outline-hide-body)
    (evil-define-key 'normal 'global (kbd "z f u") 'outline-show-all)
    (evil-define-key 'normal 'global (kbd "z c") 'outline-hide-body)
    (evil-define-key 'normal 'global (kbd "z o") 'outline-show-all)
    (evil-define-key 'normal 'global (kbd "z n") 'a/narrow-to-outline)
    (evil-define-key 'normal 'global (kbd "z u") 'a/widen-and-collapse-if-narrowed)
    (evil-define-key 'normal 'global (kbd "z U") 'widen)
    (evil-define-key 'visual 'global (kbd "t s") 'sort-lines)
    (evil-define-key 'visual 'global (kbd "t t") 'a/create-temp-buffer-with-selection)
    (evil-define-key 'visual 'global (kbd "t p") 'speed-type-region)
    (evil-define-key 'normal 'global (kbd "P") 'a/evil-paste-before)
    (evil-define-key 'normal 'global (kbd "p") 'a/evil-paste-after)
    (evil-define-key 'normal org-mode-map (kbd "<return>") 'a/execute-code)
    ))

(after! evil-org
  (evil-define-key 'normal evil-org-mode-map (kbd "S-<return>") 'gptel-send)
  (evil-define-key 'insert evil-org-mode-map (kbd "S-<return>") 'a/gptel-send-normal)
  (evil-define-key 'normal evil-org-mode-map (kbd "M-j") 'a/org-babel-next-src-block-center)
  (evil-define-key 'normal evil-org-mode-map (kbd "M-k") 'org-babel-previous-src-block)
  )

;;* evil shortcuts (harpoon)
(with-eval-after-load 'evil
  (progn
    (evil-define-key 'normal 'global (kbd "`") 'evil-jump-item)
    (evil-define-key 'normal harpoon-mode-map (kbd "q") 'q/harpoon-close-buffer)
    (evil-define-key 'normal harpoon-mode-map (kbd "RET") 'harpoon-find-file)
    (evil-define-key 'normal 'global (kbd ", .") 'harpoon-toggle-file)
    (evil-define-key 'normal 'global (kbd ", ,") 'harpoon-toggle-quick-menu)
    (evil-define-key 'normal 'global (kbd ", a") 'harpoon-add-file)
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


    (evil-define-key 'normal 'global (kbd ", i") 'imenu-list)
    (evil-define-key 'normal 'global (kbd "SPC 1 1") 'a/helm-find-github-directories)
    (evil-define-key 'normal 'global (kbd "SPC 1 2") 'a/helm-find-gt-directories)
    (evil-define-key 'normal 'global (kbd "SPC 1 3") 'a/helm-find-all-gt-directories)
    (evil-define-key 'normal 'global (kbd ", r") 'helm-register)
    (evil-define-key 'normal 'global (kbd ", b") 'helm-bookmarks)
    ))
;;* shortcuts global
(global-set-key (kbd "C-j") 'windmove-down)
(global-set-key (kbd "C-k") 'windmove-up)
(global-set-key (kbd "C-l") 'windmove-right)
(global-set-key (kbd "C-h") 'windmove-left)
(global-set-key (kbd "C-c l") 'q/go-to-column-50)

(map! :v "<" #'evil-shift-left
      :v ">" #'evil-shift-right)

(global-set-key (kbd "C-c y") 'a/consult-copy-to-temp-buffer)
(global-set-key (kbd "C-c h") 'a/consult-describe-command)

;; (evil-define-key 'insert 'global (kbd "C-c l") 'q/go-to-column-50)

;;* SPC (leader key)

  ;;** special characters
(shortcut "." 'execute-extended-command)
(shortcut "SPC ." 'a/consult-apropos)
(shortcut "SPC SPC ." 'a/consult-functions)
(shortcut "SPC SPC SPC ." 'helpful-variable)

(shortcut "," 'find-file)
(shortcut "SPC ," 'consult-find)
(shortcut "SPC SPC ," 'helm-find-files-1 "helm-open-home-dir" "/home/rafael/")

(shortcut "SPC 1" 'delete-other-windows)
(shortcut "SPC 2" 'winner-undo)
(shortcut "SPC 0" 'delete-window)
(shortcut "<" 'a/goto-previous-outline)
(shortcut ">" 'a/goto-next-outline)
(shortcut "<left>" 'a/goto-previous-outline)
(shortcut "<right>" 'a/goto-next-outline)
(shortcut "/" 'swiper-isearch)
(shortcut "SPC /" 'swiper-all)

(shortcut ";" 'a/alias-M-x)
(shortcut "SPC ;" 'a/alias-set-tag)
  ;;** 0
(shortcut "0 0" 'a/root-reopen-file)

  ;;** 9
(shortcut "9 9" 'a/macro-repeat)

  ;;** a
(shortcut "a" 'a/dired-root)


(shortcut "SPC a" 'projectile-dired)


(shortcut "A" 'dirvish)


  ;;** b
(shortcut "b b" 'consult-buffer)
(shortcut "b t" 'consult-recent-file)
(shortcut "b l" 'consult-locate)
(shortcut "b L" 'a/consult-locate-dirs)
(shortcut "b y" 'q/create-temporary-buffer)
(shortcut "b m" 'toggle-minibuffer)

(shortcut "b k" 'q/kill-buffer-and-go-back)
(shortcut "b K" 'a/kill-buffer-and-window-force)
(shortcut "b +" 'q/make-current-file-executable)
(shortcut "b w" 'q/kill-buffer-and-window)

(shortcut "b s" 'swiper-isearch)
(shortcut "b a" 'swiper-all)

(shortcut "SPC b" 'ibuffer)

  ;;** c
(shortcut "c c" 'a/execute-code)
(shortcut "c k" 'org-babel-remove-result)


  ;;** d
(shortcut "d d" 'revert-buffer)
(shortcut "d p" 'peep-dired)
(shortcut "d k" 'dired-do-kill-lines)
(shortcut "d n" 'dirvish-narrow)
(shortcut "d ." 'a/dired-toggle-dotfiles)

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
(shortcut "f e m" 'a/open-file "open-elisp-el" (concat (getenv "HOME") "/.doom.d/conf/elisp.el"))
(shortcut "f e p" 'a/open-file "open-packages-el" (concat (getenv "HOME") "/.doom.d/packages.el"))
(shortcut "f e r" 'a/open-file "open-packages-el" (concat (getenv "HOME") "/.doom.d/README.md"))
(shortcut "f e a" 'a/open-file "open-packages-el" (concat (getenv "HOME") "/.doom.d/alias.el"))


(shortcut "f n d" 'a/open-file "open-config-el" (concat (getenv "HOME") "/.config/nvim/init.lua"))
(shortcut "f n m" 'a/open-file "open-elisp-el" (concat (getenv "HOME") "/.config/nvim/lua/myconfig.lua"))
(shortcut "f n r" 'a/open-file "open-packages-el" (concat (getenv "HOME") "/.config/nvim/README.md"))

(shortcut "f t d" 'a/open-file "open-packages-el" (concat (getenv "HOME") "/.config/tmux/tmux.conf"))
(shortcut "f t m" 'a/open-file "open-packages-el" (concat (getenv "HOME") "/.config/tmux/xbindkeysrc"))

  ;;** i

(shortcut "i i" 'a/gptel-ask-rewrite)
(shortcut "i I" 'a/gptel-edit-rewrite-history)
(shortcut "i RET" 'a/gptel-select-model)

(shortcut "i 1" 'gptel-menu)
(shortcut "i 2" 'gptel-send)


  ;;** j
(shortcut "j w" 'a/avy-goto-char-timer-dim-screen)
(shortcut "j l" 'avy-goto-line)
(shortcut "j j" 'avy-goto-word-or-subword-1)
(shortcut "j 2" 'avy-goto-word-1)
(shortcut "j c" 'avy-goto-char)
(shortcut "j k" 'centaur-tabs-ace-jump)

  ;;** k
(shortcut "k k" 'helm-execute-kmacro)
(shortcut "k n" 'name-last-kbd-macro)
(shortcut "k i" 'insert-kbd-macro)
(shortcut "k e" 'edit-named-kbd-macro)

  ;;** p
(shortcut "p 1" 'a/consult-ripgrep-here)
(shortcut "p 2" 'a/consult-find-here)
(shortcut "p 3" 'a/consult-files-with-content)

(shortcut "p p" 'consult-dir)
(shortcut "p P" 'projectile-switch-project)
(shortcut "p f" 'projectile-find-file)
(shortcut "p i" 'consult-git-grep)
(shortcut "p k" 'a/projectile-kill-other-buffers)
(map! :map dired-mode-map "SPC p k" 'centaur-tabs-kill-other-buffers-in-current-group)
(shortcut "p j" 'a/consult-find-proj-gt-directories-from-file)
(shortcut "p d" 'projectile-find-dir)

  ;;** m
(shortcut "m m" 'magit-log-current)
(shortcut "m f" 'magit-log-buffer-file)
(shortcut "m r" 'magit-refresh)
(shortcut "m c" 'magit-checkout)
(shortcut "m l 1" 'magit-gptcommit-generate)
(shortcut "m l 2" 'magit-gptcommit-commit-create)
(shortcut "m l q" 'magit-gptcommit-commit-quick)
(shortcut "m l l" 'copilot-chat-insert-commit-message)

  ;;** h
(shortcut "h l" 'clm/open-command-log-buffer)

  ;;** t
(shortcut "t t" 'q/treemacs-toggle)

  ;;** w
(shortcut "w k" 'delete-window)
(shortcut "w h" 'split-window-horizontally)
(shortcut "w v" 'split-window-vertically)
(shortcut "w w" 'winner-undo)
(shortcut "w f" 'winner-redo)


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

(defun a/kill-buffer-and-window-force ()
  "Force quit current frame and kill its buffer."
  (interactive)
  (let ((buffer (current-buffer)))
    (set-buffer-modified-p nil)
    (delete-frame)
    (kill-buffer buffer)))

(defun q/kill-buffer-and-window ()
  "Kill the current buffer and delete the window it's displayed in."
  (interactive)
  (kill-this-buffer)
  (delete-window))

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
  (let ((default-directory (expand-file-name "/home/Dados/GitHub/"))
        (home (expand-file-name "/home/Dados/GitHub/")))
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

(defun q/treemacs-toggle ()
  "Toggle Treemacs buffer.
If Treemacs is not visible, display the current project exclusively.
If Treemacs is visible, just hide it."
  (interactive)
  (let ((current-buffer (current-buffer))
        (projectile-root (directory-file-name
                          (or (when (vc-root-dir) (vc-root-dir))
                              (when (projectile-project-root) (projectile-project-root))))))
    (message "Projectile root: %s" projectile-root)
    (if (treemacs-get-local-window)
        ;; If Treemacs is visible, just close it
        (progn
          (message "Treemacs is visible, hiding it")
          (treemacs))
      ;; If Treemacs is not visible, show the current project
      (progn
        (message "Treemacs not visible, showing current project")
        (treemacs-add-and-display-current-project-exclusively)
        (treemacs-toggle-fixed-width)))
    (switch-to-buffer current-buffer)))

(defun a/macro-repeat (command count)
  "Repeat a command multiple times.
Prompts for a command that starts with 'z/' and the number of repetitions."
  (interactive
   (list
    (intern
     (completing-read "Command to repeat (starting with 'z/'): "
                      obarray
                      (lambda (cmd)
                        (and (commandp cmd)
                             (string-prefix-p "z/" (symbol-name cmd))))
                      t))
    (read-number "Repeat count: ")))
  (dotimes (_ count)
    (call-interactively command)))

(defun q/harpoon-close-buffer ()
  "Close the Harpoon buffer without selecting a file."
  (interactive)
  (when (eq major-mode 'harpoon-mode)
    (kill-buffer)))

(defun a/gptel-send-normal ()
  (interactive)
  (gptel-send)
  (evil-normal-state))

(defun a/docker-help ()
  "Open the appropriate Docker help transient based on the current buffer name.
Matches buffers like `*docker-containers*` even if they have TRAMP suffixes."
  (interactive)
  (let* ((bn (buffer-name))
         (table '((".*\\*docker-containers\\*.*" . docker-container-help)
                  (".*\\*docker-images\\*.*"     . docker-image-help)
                  (".*\\*docker-volumes\\*.*"    . docker-volume-help)
                  (".*\\*docker-networks\\*.*"   . docker-network-help)))
         (fn (seq-some (lambda (entry)
                         (when (string-match-p (car entry) bn)
                           (cdr entry)))
                       table)))
    (when fn (funcall fn))))

(defun a/evil-paste-after (&optional count register)
  "An `evil-paste-after` variant that keeps the cursor in place."
  (interactive "P<x>")
  (let ((current-pos (point)))
    (evil-paste-after count register)
    (goto-char current-pos)))

(defun a/evil-paste-before (&optional count register)
  "An `evil-paste-before` variant that keeps the cursor in place."
  (interactive "P<x>")
  (let ((current-pos (point)))
    (evil-paste-before count register)
    (goto-char current-pos)))

(defun a/org-babel-next-src-block-center ()
  "Move to the next src block and center the line."
  (interactive)
  (org-babel-next-src-block)
  (evil-scroll-line-to-center nil))

;;* consult
(defun a/consult-ripgrep-here (&optional initial)
  "Run `consult-ripgrep` in the current directory instead of project root."
  (interactive)
  (consult-ripgrep default-directory initial))

(defun a/consult-find-here ()
  "Run `consult-find` in the current directory instead of project root."
  (interactive)
  (consult-find default-directory))

(defun a/consult-files-with-content (pattern)
  "Search for PATTERN in project and show only files that match."
  (interactive "sSearch pattern: ")
  (let* ((default-directory (project-root (project-current t)))
         (files (split-string
                 (shell-command-to-string
                  (format "rg --files-with-matches -g '!*node_modules*' -i -n %s"
                          (shell-quote-argument pattern)))
                 "\n" t)))
    (find-file (completing-read "File: " files))))

(defun a/consult-find-proj-gt-directories-from-file ()
  "Select a repo dir from ~/.list-of-git-projects and open it in Dired."
  (interactive)
  (require 'consult)
  (let* ((dirs (q/find-proj-gt-directories-from-file))
         (choice (consult--read dirs
                                :prompt "Git repo (from file): "
                                :require-match t
                                :sort nil
                                :category 'file
                                :history 'a/consult-find-proj-gt-directories-from-file-history)))
    (when (and choice (file-directory-p choice))
      (dired choice))))

(defun a/consult-apropos ()
  "Consult UI to pick any defined symbol, then show its help.
Requires Consult for the minibuffer UI."
  (interactive)
  (unless (require 'consult nil t)
    (user-error "Consult not loaded (enable :completion vertico or install consult)"))
  ;; Collect only *defined* things to keep the list relevant & smaller.
  (let* ((names
          (let (acc)
            (mapatoms
             (lambda (s)
               (when (or (fboundp s) (boundp s) (facep s))
                 (push (symbol-name s) acc))))
            acc))
         (choice (consult--read
                  names
                  :prompt "Describe symbol: "
                  :category 'symbol         ; lets Marginalia annotate nicely
                  :require-match t
                  :sort t))
         (sym (intern-soft choice)))
    (unless sym (user-error "No symbol interned for %S" choice))
    ;; Prefer the generic help that shows all roles for the symbol.
    (cond
     ((fboundp 'describe-symbol) (describe-symbol sym)) ; C-h o in Emacs
     ((and (fboundp sym))        (describe-function sym))
     ((boundp sym)               (describe-variable sym))
     ((facep sym)                (describe-face sym))
     (t                          (user-error "Don’t know how to describe %S" sym)))

      ;; Jump to help window if it exists
      (when-let ((help-win (get-buffer-window "*Help*" t)))
        (select-window help-win))
    ))

(defun a/consult-functions ()
  "Consult list of ALL functions (interactive or not) with a [cmd]/[fn] flag.
Excludes macros and special forms. Focus the Help window if it opens."
  (interactive)
  (unless (require 'consult nil t)
    (user-error "Consult not loaded"))
  (let* ((tbl (make-hash-table :test 'equal))  ; name -> (SYMBOL . IS-COMMAND)
         (names
          (let (acc)
            (mapatoms
             (lambda (s)
               (when (and (fboundp s)
                          (not (macrop s))
                          (not (special-form-p s)))
                 (let ((name (symbol-name s)))
                   (puthash name (cons s (commandp s)) tbl)
                   (push name acc)))))
            (nreverse acc))))
    (let* ((aff (lambda (cands)
                  (mapcar (lambda (name)
                            (pcase-let ((`(,_sym . ,is-cmd) (gethash name tbl)))
                              (list "" name (if is-cmd "  [cmd]" "  [fn]"))))
                          cands)))
           (completion-extra-properties `(:affixation-function ,aff))
           (choice (consult--read names
                                  :prompt "Function (any): "
                                  :require-match t
                                  :category 'function
                                  :sort t))
           (sym (car (gethash choice tbl))))
      (unless (symbolp sym)
        (user-error "No symbol for %S" choice))
      ;; Show doc
      (describe-function sym)
      ;; Jump to help window if it exists
      (when-let ((help-win (get-buffer-window "*Help*" t)))
        (select-window help-win)))))   ; force focus to help split

(defun a/consult-copy-to-temp-buffer (&optional exit)
  "Snapshot current Consult/Vertico candidates into a buffer with the SAME columns.
Opens an Embark Collect buffer and freezes it. With prefix EXIT, abort minibuffer."
  (interactive "P")
  (unless (minibufferp)
    (user-error "Run this from an active Vertico/Consult minibuffer"))
  (require 'embark)
  (let ((embark-collect-live-update nil)               ; freeze (snapshot)
        (embark-collect-initial-view-alist '((t . list)))) ; list view like your screenshot
    (embark-collect)
    (rename-buffer "*Completions Snapshot*" t)
    (setq-local truncate-lines t)
    (when exit (abort-recursive-edit))))

(defun a/consult-describe-command (&optional exit)
  "In a Consult/Vertico minibuffer (like `execute-extended-command`),
open the documentation for the currently selected command.

With prefix EXIT, also abort the minibuffer."
  (interactive "P")
  (unless (minibufferp)
    (user-error "Run this from an active Vertico/Consult minibuffer"))
  (let* ((cand (vertico--candidate))
         (sym  (intern-soft cand)))
    (unless (commandp sym)
      (user-error "Not a command: %s" cand))
    ;; Describe it
    (describe-function sym)
    ;; Optionally exit minibuffer
    (when exit
      (abort-recursive-edit))))

;;* shell
(defun a/eshell-here ()
  "Open eshell in context of current buffer and make ibuffer group it by project/dir."
  (interactive)
  (require 'projectile)
  (let* ((dir (cond
               ((derived-mode-p 'dired-mode) (dired-current-directory))
               ((buffer-file-name) (file-name-directory (buffer-file-name)))
               (t default-directory)))
         ;; If DIR is in a project, prefer the project root for grouping
         (proj-root (ignore-errors (let ((default-directory dir))
                                     (projectile-project-root))))
         (target (file-name-as-directory (expand-file-name (or proj-root dir))))
         (bufname (format "*eshell: %s*"
                          (file-name-nondirectory (directory-file-name target)))))
    (let ((default-directory target)
          (eshell-buffer (eshell t)))
      (with-current-buffer eshell-buffer
        (rename-buffer bufname t)
        ;; Ensure ibuffer groups this buffer correctly
        (setq-local default-directory target)
        (setq-local list-buffers-directory target)
        (when proj-root
          (setq-local projectile-project-root (file-name-as-directory
                                               (expand-file-name proj-root)))))
      (pop-to-buffer eshell-buffer))))

(defun a/eshell-project-here ()
  "Open eshell in the Projectile project root (fallback to current dir) and make ibuffer group it correctly."
  (interactive)
  (require 'projectile)
  (let* ((project-root (ignore-errors (projectile-project-root)))
         (fallback-dir (cond
                        ((derived-mode-p 'dired-mode) (dired-current-directory))
                        ((buffer-file-name) (file-name-directory (buffer-file-name)))
                        (t default-directory)))
         (target (file-name-as-directory (expand-file-name (or project-root fallback-dir))))
         (bufname (format "*eshell: %s*"
                          (file-name-nondirectory (directory-file-name
                                                   (or project-root target))))))
    ;; Create eshell already at TARGET (no post-open `cd`)
    (let ((default-directory target)
          (eshell-buffer (eshell t)))
      (with-current-buffer eshell-buffer
        (rename-buffer bufname t)
        ;; Ensure ibuffer (ibuffer-projectile) groups this under the project
        (setq-local default-directory target)
        (setq-local list-buffers-directory target)
        (when project-root
          (setq-local projectile-project-root
                      (file-name-as-directory (expand-file-name project-root)))))
      (pop-to-buffer eshell-buffer))))

(defun a/vterm-here (&optional new)
  "Open vterm in the current buffer's directory (NOT the project root).
Reuses *vterm: <dir>* unless NEW (C-u) is given. Opens full-window."
  (interactive "P")
  (require 'vterm)
  (require 'projectile)
  (let* ((bufdir (or (and (derived-mode-p 'dired-mode) (dired-current-directory))
                     (and (buffer-file-name) (file-name-directory (buffer-file-name)))
                     default-directory))
         (dir     (file-name-as-directory (expand-file-name bufdir)))
         (name    (file-name-nondirectory (directory-file-name dir)))
         (bufname (format "*vterm: %s*" name))
         (existing (get-buffer bufname)))
    (if (and existing (not new))
        (progn
          (switch-to-buffer existing)
          (delete-other-windows))
      (let* ((default-directory dir)
             (buf (save-window-excursion (vterm) (current-buffer))))
        (with-current-buffer buf
          (rename-buffer bufname t)
          ;; Keep metadata consistent for ibuffer/project views
          (setq-local default-directory dir
                      list-buffers-directory dir)
          (let ((root (ignore-errors (projectile-project-root))))
            (when root
              (setq-local projectile-project-root
                          (file-name-as-directory (expand-file-name root))))))
        (switch-to-buffer buf)
        (delete-other-windows)))))


(defun a/vterm-project-here (&optional new)
  "Open vterm at the Projectile project root (or current dir) in THIS window, full-window.
Reuses *vterm: <name>* unless NEW (C-u) is provided. Groups correctly in ibuffer."
  (interactive "P")
  (require 'vterm)
  (require 'projectile)
  (let* ((project-root (ignore-errors (projectile-project-root)))
         (dir (or project-root
                  (and (derived-mode-p 'dired-mode) (dired-current-directory))
                  (and (buffer-file-name) (file-name-directory (buffer-file-name)))
                  default-directory))
         (dir (file-name-as-directory (expand-file-name dir)))
         (name (file-name-nondirectory (directory-file-name dir)))
         (bufname (format "*vterm: %s*" name))
         (existing (get-buffer bufname)))
    (cond
     ;; Reuse existing project vterm
     ((and existing (not new))
      (switch-to-buffer existing)
      (delete-other-windows))
     (t
      ;; Create vterm already in DIR (no post-open `cd`)
      (let* ((default-directory dir)
             (buf (save-window-excursion (vterm) (current-buffer))))
        (with-current-buffer buf
          (rename-buffer bufname t)
          ;; Ensure Emacs-side metadata stays tied to the project/dir for ibuffer
          (setq-local default-directory dir)
          (setq-local list-buffers-directory dir)
          (when project-root
            (setq-local projectile-project-root
                        (file-name-as-directory (expand-file-name project-root)))))
        (switch-to-buffer buf)
        (delete-other-windows))))))

;;* gptel

(defvar a/gptel-model-history nil)
(defun a/gptel-select-model ()
  "Select a GPTel model from the *current* backend using Consult/Vertico.
Marks the current model inline; updates `gptel-model`."
  (interactive)
  (require 'gptel)
  (let* ((backend (or gptel-backend
                      (user-error "No active gptel backend")))
         (backend-name (gptel-backend-name backend))
         (models (gptel-backend-models backend)))
    (unless models
      (user-error "Backend %s exposes no models" backend-name))
    ;; Build display -> model mapping
    (let* ((pairs (mapcar (lambda (model)
                            (cons (format "[%s] %s"
                                          backend-name
                                          (gptel--model-name model))
                                  model))
                          models))
           (keys  (mapcar #'car pairs))
           (annot (lambda (cand)
                    (when (eq (alist-get cand pairs nil nil #'string=)
                              gptel-model)
                      (propertize "  (current)" 'face 'success))))
           (choice
            (if (fboundp 'consult--read)
                ;; Use Consult if present
                (consult--read keys
                  :prompt "Select GPTel model: "
                  :require-match t
                  :annotate annot
                  :category 'gptel-model
                  :history 'a/gptel-model-history)
              ;; Plain completing-read path (Vertico handles UI)
              (let ((completion-extra-properties
                     (list :annotation-function annot)))
                (completing-read "Select GPTel model: "
                                 keys nil t nil
                                 'a/gptel-model-history)))))
      (let ((model (alist-get choice pairs nil nil #'string=)))
        (unless model
          (user-error "Invalid selection"))
        (setq gptel-model model)
        (message "GPTel model: %s" (gptel--model-name model))))))

;;* dired
(defun a/dired-toggle-dotfiles ()
  "Toggle hiding of dotfiles in the current Dired buffer using dired-omit.
Preserves/restores this buffer's original dired-omit-files and dired-omit-mode."
  (interactive)
  (unless (derived-mode-p 'dired-mode)
    (user-error "Not in a Dired buffer"))
  (require 'dired-x)
  (let ((dot-rx "\\`\\.[^.].*")        ; dotfiles (not . or ..)
        (hidden (and (local-variable-p 'my/dired--dotfiles-hidden)
                     my/dired--dotfiles-hidden)))
    (if hidden
        ;; Unhide: restore previous omit config.
        (progn
          (when (local-variable-p 'my/dired--saved-omit-files)
            (setq-local dired-omit-files my/dired--saved-omit-files))
          (unless (and (local-variable-p 'my/dired--saved-omit-mode)
                       my/dired--saved-omit-mode)
            (dired-omit-mode 0))
          (kill-local-variable 'my/dired--dotfiles-hidden)
          (kill-local-variable 'my/dired--saved-omit-files)
          (kill-local-variable 'my/dired--saved-omit-mode)
          (revert-buffer)
          (message "Dotfiles visible"))
      ;; Hide: save current omit config and extend it with dotfiles.
      (setq-local my/dired--dotfiles-hidden t)
      (setq-local my/dired--saved-omit-files dired-omit-files)
      (setq-local my/dired--saved-omit-mode (bound-and-true-p dired-omit-mode))
      (setq-local dired-omit-files
                  (if (and (stringp dired-omit-files)
                           (> (length dired-omit-files) 0))
                      (concat dired-omit-files "\\|" dot-rx)
                    dot-rx))
      (dired-omit-mode 1)
      (revert-buffer)
      (message "Dotfiles hidden"))))


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
     ((eq major-mode 'lua-mode) (a/execute-lua-code))
     ((eq major-mode 'yaml-mode) (a/execute-yaml-code))
     ((eq major-mode 'dockerfile-mode) (a/execute-yaml-code))
     ((eq major-mode 'fundamental-mode) (a/execute-elisp-code))
     ((or (eq major-mode 'js-mode) (eq major-mode 'js2-mode) (eq major-mode 'rjsx-mode)) (a/execute-js-code))
     ((eq major-mode 'typescript-mode) (a/execute-ts-code))
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

(defun a/execute-lua-code ()
  "Execute Python code."
  (interactive)
  (write-region (point-min) (point-max) "/tmp/file")
  (a/run-async-shell-command-in-split-window "lua /tmp/file"))

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

(defun a/execute-ts-code ()
  "Execute TypeScript code."
  (interactive)
  (message "passing typescript")
  (write-region (point-min) (point-max) "/tmp/file.ts")
  (let ((node-path (if (and (projectile-project-p)
                            (not (string-prefix-p (expand-file-name "~/.config/tmux") (or (buffer-file-name) ""))))
                       (projectile-project-root)
                     "/usr/local/lib/node_modules")))
    (a/run-async-shell-command-in-split-window (concat "NODE_PATH=" node-path " tsx /tmp/file.ts"))))

(defun a/execute-ts-code ()
  "Execute TypeScript code."
  (interactive)
  (message "passing typescript")
  (write-region (point-min) (point-max) "/tmp/file.ts")
  (let ((node-path (if (and (projectile-project-p)
                            (not (string-prefix-p (expand-file-name "~/.config/tmux") (or (buffer-file-name) ""))))
                       (projectile-project-root)
                     "/usr/local/lib/node_modules")))
    (a/run-async-shell-command-in-split-window (concat "NODE_PATH=" node-path " tsx /tmp/file.ts"))))

(defun a/execute-org-code ()
  "Execute Org Babel code."
  (interactive)
  (a/org-execute-block-in-split-window))

(defvar execute-code-output-window nil
  "Window to display the output of executed code.")

(defun a/run-async-shell-command-in-split-window (code)
  "Run async shell command in a split window."
  (let ((output-buffer (get-buffer-create "*Async Shell Command*")))
    ;; Ensure output buffer is in a split window
    (display-buffer output-buffer '(display-buffer-pop-up-window . ((inhibit-same-window . t))))
    ;; Switch to output buffer and run command
    (with-current-buffer output-buffer
      (let ((process (get-buffer-process output-buffer)))
        (when process
          (delete-process process)))
      (async-shell-command code output-buffer))))

;;* org-mode execution
(require 'cl-lib)
(require 'ob-sql)

(defun a/expand-global-vars ()
  "Return an alist of #+EXPAND variables at the top level (before first heading)."
  (save-excursion
    (goto-char (point-min))
    (let (vars
          (first-heading
            (or (save-excursion
                  (re-search-forward org-heading-regexp nil t))
                (point-max))))
      (while (re-search-forward "^#\\+EXPAND: \\([^ ]+\\) +\\(.+\\)$" first-heading t)
        (push (cons (match-string 1) (match-string 2)) vars))
      vars)))

(defun a/expand-local-vars ()
  "Return an alist of #+EXPAND variables in the current subtree."
  (save-excursion
    (let* ((beg (org-entry-beginning-position))
           (end (org-end-of-subtree t t))
           vars)
      (goto-char beg)
      (while (re-search-forward "^#\\+EXPAND: \\([^ ]+\\) +\\(.+\\)$" end t)
        (push (cons (match-string 1) (match-string 2)) vars))
      vars)))

(defun a/expand-block-vars ()
  "Return an alist of EXPAND variables visible in the current context.
1) Local (current subtree) via a/expand-local-vars
2) Each parent heading, from closest to highest, also via a/expand-local-vars
3) Top-level via a/expand-global-vars
Inner variables always override outer ones."
  (let* ((globals (a/expand-global-vars))
         (vars    (a/expand-local-vars))
         (pos     (point)))
    (save-excursion
      (org-back-to-heading t)
      (while (org-up-heading-safe)
        (let ((pv (a/expand-local-vars)))
          (dolist (pair pv)
            (unless (assoc (car pair) vars)
              (push pair vars))))))
    (goto-char pos)
    (dolist (pair globals)
      (unless (assoc (car pair) vars)
        (push pair vars)))
    vars))

(defun a/expand-block-vars-with-keycloak ()
  "Return alist of EXPAND variables, but only authenticate if some {{{KEYCLOAK_...}}} is used in the block."
  (let* ((expand-alist (a/expand-block-vars))
         (element (org-element-at-point))
         (value (org-element-property :value element)))
    (if (string-match "{{{\\(KEYCLOAK_[A-Z0-9_]+\\)}}}" value)
        (let* ((get (lambda (k) (cdr (assoc k expand-alist))))
               (tem-todos (and (funcall get "KEYCLOAK_SERVER")
                               (funcall get "KEYCLOAK_REALM")
                               (funcall get "KEYCLOAK_USER")
                               (funcall get "KEYCLOAK_PASSWORD")
                               (funcall get "KEYCLOAK_CLIENT_ID")
                               (not (funcall get "KEYCLOAK_TOKEN")))))
          (if tem-todos
              (let ((token (a/keycloak-get-token (funcall get "KEYCLOAK_SERVER")
                                                 (funcall get "KEYCLOAK_REALM")
                                                 (funcall get "KEYCLOAK_CLIENT_ID")
                                                 (funcall get "KEYCLOAK_USER")
                                                 (funcall get "KEYCLOAK_PASSWORD"))))
                (cons (cons "KEYCLOAK_TOKEN" token) expand-alist))
            expand-alist))
      expand-alist)))


(defun a/keycloak-get-token (server realm client-id user password)
  "Return a Keycloak access token string."
  (let* ((url-request-method "POST")
         (url-request-extra-headers '(("Content-Type" . "application/x-www-form-urlencoded")))
         (url-request-data
          (mapconcat #'identity
                     (list
                      (concat "grant_type=password")
                      (concat "client_id=" client-id)
                      (concat "username=" user)
                      (concat "password=" password))
                     "&"))
         (url (format "%s/realms/%s/protocol/openid-connect/token"
                      (replace-regexp-in-string "/$" "" server)
                      realm))
         (response-buffer (url-retrieve-synchronously url))
         token)
    (with-current-buffer response-buffer
      (goto-char (point-min))
      (re-search-forward "\n\n")
      (let* ((json-object-type 'hash-table)
             (json (json-read)))
        (setq token (gethash "access_token" json))))
    (when response-buffer (kill-buffer response-buffer))
    token))



(defun a/org-expand-block-at-point ()
  "Return the body of the block at point, with {{{VAR}}} replaced by #+EXPAND: VAR val."
  (let* ((expand-alist (a/expand-block-vars-with-keycloak))
         (element (org-element-at-point))
         (value (org-element-property :value element)))
    (dolist (var expand-alist value)
      (setq value (replace-regexp-in-string
                   (format "{{{%s}}}" (regexp-quote (car var)))
                   (cdr var) value t t)))
    value))

(defun a/pretty-ascii-table (table &optional truncate-length)
  "Format TABLE (list of lists and 'hline) as an ASCII-art table. Truncates cells over TRUNCATE-LENGTH (default 30)."
  (let* ((truncate-length (or truncate-length 30))
         (truncated
          (mapcar (lambda (row)
                    (if (eq row 'hline) 'hline
                      (mapcar (lambda (cell)
                                (let ((str (format "%s" cell)))
                                  (if (> (length str) truncate-length)
                                      (concat (substring str 0 truncate-length) "…")
                                    str)))
                              row)))
                  table))
         (widths
          (let ((widths nil))
            (dolist (row truncated)
              (unless (eq row 'hline)
                (cl-loop for cell in row
                         for i from 0
                         do (setq widths
                                  (plist-put widths i (max (or (plist-get widths i) 0)
                                                           (length cell)))))))
            (mapcar (lambda (i) (or (plist-get widths i) 1))
                    (number-sequence 0 (1- (length (car (remove 'hline truncated)))))))))
    (let ((lines
           (mapcar
            (lambda (row)
              (if (eq row 'hline)
                  (concat "+"
                          (mapconcat (lambda (w) (make-string (+ w 2) ?-)) widths "+")
                          "+")
                (concat "| "
                        (mapconcat #'identity
                                   (cl-mapcar (lambda (cell w)
                                                (format (format "%%-%ds" w) cell))
                                              row widths)
                                   " | ")
                        " |")))
            truncated)))
      (mapconcat #'identity lines "\n"))))

(defun a/setenv-global-vars ()
  "Return an alist of #+SETENV pairs at the top level (antes do primeiro heading)."
  (save-excursion
    (goto-char (point-min))
    (let ((vars nil)
          (first-heading
           (or (save-excursion (re-search-forward org-heading-regexp nil t))
               (point-max))))
      (while (re-search-forward "^#\\+SETENV:[ \t]+\\(.+\\)$" first-heading t)
        (dolist (pair (split-string (match-string 1) "[ \t]+" t))
          (when (string-match "^\\([^= \t]+\\)=\\(.*\\)$" pair)
            (push (cons (match-string 1 pair)
                        (match-string 2 pair))
                  vars))))
      vars)))

(defun a/setenv-local-vars ()
  "Return an alist of #+SETENV pairs in the current subtree."
  (save-excursion
    (let* ((beg (org-entry-beginning-position))
           (end (org-end-of-subtree t t))
           (vars nil))
      (goto-char beg)
      (while (re-search-forward "^#\\+SETENV:[ \t]+\\(.+\\)$" end t)
        (dolist (pair (split-string (match-string 1) "[ \t]+" t))
          (when (string-match "^\\([^= \t]+\\)=\\(.*\\)$" pair)
            (push (cons (match-string 1 pair)
                        (match-string 2 pair))
                  vars))))
      vars)))

(defun a/setenv-block-vars ()
  "Return an alist of #+SETENV pairs visible in the current context:
1) local (subtree),
2) each parent heading (from closest to highest),
3) global (top-level).
Inner values always override outer ones."
  (let* ((globals (a/setenv-global-vars))
         (vars    (a/setenv-local-vars))
         (orig-pos (point)))
    (save-excursion
      (org-back-to-heading t)
      (while (org-up-heading-safe)
        (dolist (pair (a/setenv-local-vars))
          (unless (assoc (car pair) vars)
            (push pair vars)))))
    (goto-char orig-pos)
    (dolist (pair globals)
      (unless (assoc (car pair) vars)
        (push pair vars)))
    vars))

(defun a/org-setenv-from-top ()
  "Set env vars based on all #+SETENV in the current context."
  (dolist (pair (a/setenv-block-vars))
    (setenv (car pair) (cdr pair))))

(defun a/split-sql-queries-smart (sql)
  "Split SQL string into individual statements, ignoring semicolons in strings.
Very naive, good enough for 80% of real-life blocks."
  (let* ((lines (split-string sql "\n"))
         (stmts '())
         (current ""))
    (dolist (line lines)
      (setq current (concat current (if (string= current "") "" "\n") line))
      (when (string-match ";[ \t]*$" line)
        (push (string-trim current) stmts)
        (setq current "")))
    (when (> (length (string-trim current)) 0)
      (push (string-trim current) stmts))
    (nreverse stmts)))

(defun a/org-execute-block-in-split-window ()
  "Execute the Org src block at point and show the result in a split window.
Expands EXPAND macros ({{{VAR}}}) before executing jupyter-* blocks.
SQL: splits queries, SELECT via org-babel for table formatting, others via shell.
Other languages: normal execution, separate buffer.
"
  (interactive)
  (a/org-setenv-from-top)
  (let* ((orig-window      (selected-window))
          (element          (org-element-at-point))
          (lang             (org-element-property :language element))
          (params           (org-babel-parse-header-arguments
                              (org-element-property :parameters element)))
          (is-jupyter       (string-prefix-p "jupyter-" lang))
          (expanded-body    (a/org-expand-block-at-point))
          (truncate-length  30)
          (result-buffer-name
            (if (string= lang "sql")
              "*Org Babel SQL Result*"
              "*Org Babel Result*")))
    (cond
      ;; --- Jupyter case: temporarily overwrite the expanded body ---
      (is-jupyter
        (let* ((begin (org-element-property :begin element))
                (end (org-element-property :end element))
                (orig-body (org-element-property :value element)))
          (save-excursion
            ;; Go to the beginning of the body
            (goto-char begin)
            (re-search-forward "^[ \t]*#\\+BEGIN_SRC[^\n]*\n")
            (let ((start-body (point)))
              (goto-char end)
              (re-search-backward "^[ \t]*#\\+END_SRC" nil t)
              (let ((inhibit-read-only t))
                ;; Replace the body of the block with the expanded one
                (delete-region start-body (point))
                (goto-char start-body)
                (insert expanded-body))
              ;; Execute normally
              (org-babel-execute-src-block)
              ;; Restore the original body
              (delete-region start-body (point))
              (goto-char start-body)
              (insert orig-body)))
          (select-window orig-window)))
      ;; --- SQL case -------------------
      ((string= lang "sql")
        (let ((buf (get-buffer-create result-buffer-name)))
          (with-current-buffer buf
            (erase-buffer)
            (if (string-match-p "\\$\\$" expanded-body)
              ;; PL/pgSQL block with $$ → execute everything via org-babel
              (let ((res (org-babel-execute:sql expanded-body params)))
                (cond
                  ((and (listp res) res)
                    (insert (a/pretty-ascii-table res truncate-length)))
                  ((stringp res)
                    (insert res))))
              ;; case without $$ → split + original logic
              (dolist (stmt (a/split-sql-queries-smart expanded-body))
                (insert (format "\n\n%s\n" stmt))
                (if (string-match-p "^\\s-*select\\b" (downcase stmt))
                  (let ((res (org-babel-execute:sql stmt params)))
                    (cond
                      ((and res (listp res))
                        (insert (a/pretty-ascii-table res truncate-length)))
                      ((stringp res)
                        (insert res))))
                  (let* ((pguser     (getenv "PGUSER"))
                          (pgpassword (getenv "PGPASSWORD"))
                          (pghost     (getenv "PGHOST"))
                          (pgdb       (getenv "PGDATABASE"))
                          (cmd        (format "PGUSER='%s' PGPASSWORD='%s' PGHOST='%s' PGDATABASE='%s' psql -P pager=off -q -v ON_ERROR_STOP=1 -c \"%s\""
                                        pguser pgpassword pghost pgdb
                                        (replace-regexp-in-string "\"" "\\\\\"" stmt)))
                          (out        (shell-command-to-string cmd)))
                    (insert out)))
                (insert "\n"))))
          (display-buffer buf '(display-buffer-pop-up-window . ((window-height . 0.3))))
          (select-window orig-window)))
      ;; --- Other languages: normal execution + result buffer ---
      (t
        (let* ((info   (list lang expanded-body params))
                (result (org-babel-execute-src-block nil info)))
          (org-babel-remove-result)
          (cond
            ((and (stringp result))
              (let ((buf (get-buffer-create result-buffer-name)))
                (with-current-buffer buf
                  (erase-buffer)
                  (let ((body result))
                    (when (string= lang "restclient")
                      (let* ((sp      (string-match "\n\n" result))
                              (payload (if sp (substring result (+ sp 2)) result)))
                        (setq body payload)
                        (cond
                          ((string-match-p "^<\\?xml\\|<[^>]+>" body) (nxml-mode))
                          ((string-match-p "^{" body) (json-mode)))))
                    (insert body)
                    (goto-char (point-min))))
                (display-buffer buf '(display-buffer-pop-up-window . ((window-height . 0.3))))
                (select-window orig-window)))
            ((and (listp result))
              (let ((buf (get-buffer-create result-buffer-name)))
                (with-current-buffer buf
                  (erase-buffer)
                  (insert (a/pretty-ascii-table result truncate-length))
                  (goto-char (point-min)))
                (display-buffer buf '(display-buffer-pop-up-window . ((window-height . 0.3))))
                (select-window orig-window)))
            (t (message "Nenhum resultado obtido."))))))))


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
(fset 'z/window-down (kbd "L zt"))
(fset 'z/window-up (kbd "H zb"))
;; (fset 'z/window-quit (kbd " bk wk"))

(defalias 'z/dired-magit-pull
   (kmacro "<return> SPC m m F u q h j"))

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
