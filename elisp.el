;;; elisp.el -*- lexical-binding: t; -*-

;;* unbind keys
(map! :leader "f e" nil)
(map! :leader "SPC" nil)

;;* evil shortcuts
(with-eval-after-load 'evil
  (progn
    ;;(evil-define-key 'normal 'global (kbd "<tab>") 'q/toggle-outline)
    (evil-define-key 'normal 'global (kbd "SPC o o") 'q/toggle-outline)
    (evil-define-key 'insert 'global (kbd "<S-iso-lefttab>") 'q/go-to-column-50)
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
    ;;(evil-define-key 'normal 'global (kbd "p") 'a/evil-paste-after)
    (evil-define-key 'normal 'global (kbd "z a") 'a/toggle-current-outline)
    (evil-define-key 'normal 'global (kbd "z e") 'a/org-next-src-block)
    (evil-define-key 'normal 'global (kbd "z f a") 'outline-hide-body)
    (evil-define-key 'normal 'global (kbd "z f u") 'outline-show-all)
    (evil-define-key 'normal 'global (kbd "z n") 'a/narrow-to-outline)
    (evil-define-key 'normal 'global (kbd "z u") 'a/widen-and-collapse-if-narrowed)
    (evil-define-key 'visual 'global (kbd "<tab>") 'a/toggle-comments)
    (evil-define-key 'visual 'global (kbd "ts") 'sort-lines)
    (evil-define-key 'visual 'global (kbd "tt") 'a/create-temp-buffer-with-selection)
    (evil-define-key 'visual 'global (kbd "t p") 'speed-type-region)
    ))

(fset 'a/window-down (kbd "L zt"))
(fset 'q/window-up (kbd "H zb"))

;;* shortcuts global
(global-set-key (kbd "C-j") 'windmove-down)
(global-set-key (kbd "C-k") 'windmove-up)
(global-set-key (kbd "C-l") 'windmove-right)
(global-set-key (kbd "C-h") 'windmove-left)

;;* shortcuts SPC
(shortcut "f e d" 'a/open-file "open-config-el" (concat (getenv "HOME") "/.doom.d/config.el"))
(shortcut "f e i" 'a/open-file "open-init-el" (concat (getenv "HOME") "/.doom.d/init.el"))
(shortcut "f e m" 'a/open-file "open-elisp-el" (concat (getenv "HOME") "/.doom.d/elisp.el"))
(shortcut "f e p" 'a/open-file "open-packages-el" (concat (getenv "HOME") "/.doom.d/packages.el"))

(shortcut "," 'a/helm-fuzzy-folder-find-files)
(shortcut "." 'helm-M-x)

(shortcut "SPC 1" 'delete-other-windows)
(shortcut "SPC 0" 'delete-window)

;;* functions
(defun a/open-file (path)
  "opens a file from the system"
  (interactive)
  (find-file path))

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

(defun a/toggle-comments (beg end)
  "Toggle comment on selected code."
  (interactive "r")
  (comment-or-uncomment-region beg end))

(setq-default major-mode
              (lambda () (if buffer-file-name
                          (fundamental-mode)
                            (let ((buffer-file-name (buffer-name)))
                          (set-auto-mode)))))


;;* exec functions


;;* helm
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

