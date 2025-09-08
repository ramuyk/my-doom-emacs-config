;;; conf/gptel.el -*- lexical-binding: t; -*-

;;* gptel ask rewrite
(require 'cl-lib)

;; Configuration
(defvar a/gptel-history-file "~/.doom.d/gptel-rewrite-history.txt"
  "File to store GPTel history.")

(defvar a/gptel--prompt-history '()
  "List of GPTel prompts.")

;; Core functions
(defun a/gptel--save-history ()
  "Save history to file."
  (with-temp-file a/gptel-history-file
    (insert ";; GPTel Rewrite History\n")
    (insert ";; Edit this file to manage your rewrite prompts\n")
    (insert ";; Each line represents one prompt\n\n")
    (dolist (prompt a/gptel--prompt-history)
      (insert prompt "\n"))))

(defun a/gptel--add-prompt-to-file (prompt)
  "Add PROMPT to history file, avoiding duplicates."
  ;; Create file if it doesn't exist
  (unless (file-exists-p a/gptel-history-file)
    (with-temp-file a/gptel-history-file
      (insert ";; GPTel Rewrite History\n")
      (insert ";; Edit this file to manage your rewrite prompts\n")
      (insert ";; Each line represents one prompt\n\n")))

  ;; Read existing prompts
  (let ((existing-prompts (a/gptel--read-prompts-from-file)))
    ;; Only add if not already present
    (unless (member prompt existing-prompts)
      ;; Add to beginning of file (after header)
      (with-temp-buffer
        (insert-file-contents a/gptel-history-file)
        (goto-char (point-min))
        ;; Skip comment lines
        (while (looking-at ";;")
          (forward-line 1))
        ;; Skip empty line after comments
        (when (looking-at "^$")
          (forward-line 1))
        ;; Insert new prompt at the beginning
        (insert prompt "\n")
        (write-file a/gptel-history-file)))))

(defun a/gptel--load-history ()
  "Load history from file."
  (when (file-exists-p a/gptel-history-file)
    (condition-case nil
        (with-temp-buffer
          (insert-file-contents a/gptel-history-file)
          (goto-char (point-min))
          ;; Skip comment lines
          (while (looking-at ";;")
            (forward-line 1))
          ;; Skip empty line after comments
          (when (looking-at "^$")
            (forward-line 1))
          ;; Read prompts line by line
          (let ((prompts '()))
            (while (not (eobp))
              (let ((line (string-trim (buffer-substring-no-properties
                                         (line-beginning-position)
                                         (line-end-position)))))
                (when (not (string-empty-p line))
                  (push line prompts)))
              (forward-line 1))
            (setq a/gptel--prompt-history (nreverse prompts))))
      (error (setq a/gptel--prompt-history '())))))

(defun a/gptel--read-prompts-from-file ()
  "Read prompts directly from file."
  (when (file-exists-p a/gptel-history-file)
    (condition-case nil
        (with-temp-buffer
          (insert-file-contents a/gptel-history-file)
          (goto-char (point-min))
          ;; Skip comment lines
          (while (looking-at ";;")
            (forward-line 1))
          ;; Skip empty line after comments
          (when (looking-at "^$")
            (forward-line 1))
          ;; Read prompts line by line
          (let ((prompts '()))
            (while (not (eobp))
              (let ((line (string-trim (buffer-substring-no-properties
                                         (line-beginning-position)
                                         (line-end-position)))))
                (when (not (string-empty-p line))
                  (push line prompts)))
              (forward-line 1))
            (nreverse prompts)))
      (error '()))))

(defun a/gptel-ask-rewrite ()
  "Ask for a rewrite prompt using consult, with history integration."
  (interactive)
  (unless (use-region-p)
    (user-error "Select a region first"))

  ;; Read prompts from file
  (let ((prompts (a/gptel--read-prompts-from-file)))
    ;; Use consult to search through history or create new prompt
    (let ((selection
           (if (fboundp 'consult--read)
               (consult--read prompts
                             :prompt "GPTel Rewrite: "
                             :category 'gptel-rewrite)
             (completing-read "GPTel Rewrite (or type new): " prompts))))

      (when selection
        (let ((prompt selection))
          (when (and prompt (not (string-empty-p (string-trim prompt))))
            ;; Add to history if it's new
            (unless (member prompt prompts)
              (a/gptel--add-prompt-to-file prompt))
            ;; Execute the rewrite
            (a/gptel--execute-rewrite prompt)))))))

(defun a/gptel-edit-rewrite-history ()
  "Edit history in file."
  (interactive)
  ;; Create the file if it doesn't exist
  (unless (file-exists-p a/gptel-history-file)
    (with-temp-file a/gptel-history-file
      (insert ";; GPTel Rewrite History\n")
      (insert ";; Edit this file to manage your rewrite prompts\n")
      (insert ";; Each line represents one prompt\n\n")))
  ;; Open the file for editing
  (find-file a/gptel-history-file)
  (message "Edit history file. Use standard Emacs file operations (C-x C-s to save, C-x k to kill buffer)."))





;; Configuration for original GPTel system
(defcustom a/gptel-rewrite-echo-request nil
  "Non-nil means to echo the rewrite request in the minibuffer."
  :type 'boolean
  :group 'a/gptel)

(defcustom a/gptel-rewrite-context-window 500
  "Characters to include before/after the region as surrounding context."
  :type 'integer
  :group 'a/gptel)

;; Helper functions
(defun a/gptel--target-lang-and-ext ()
  "Return (EXT LANG) for current buffer. EXT may be nil."
  (let* ((fname (buffer-file-name))
         (ext (when fname (downcase (or (file-name-extension fname) ""))))
         (lang
          (cond
           ((member ext '("js" "mjs" "cjs" "jsx")) "javascript")
           ((member ext '("ts" "tsx"))             "typescript")
           (t (replace-regexp-in-string "-mode\\'" "" (symbol-name major-mode))))))
    (list ext lang)))

(defun a/gptel--rewrite-callback (buf beg end response info)
  "Replace [BEG,END] with RESPONSE, fixing only the first non-empty line's indent.
Preserves original trailing newline."
  (when (buffer-live-p buf)
    (with-current-buffer buf
      (let ((b (marker-position beg))
            (e (marker-position end)))
        (unwind-protect
            (save-excursion
              (goto-char b)
              (let* ((bol (line-beginning-position))
                     (ws-end (progn (goto-char bol) (skip-chars-forward " \t") (point)))
                     (base-indent (buffer-substring-no-properties bol ws-end))
                     (had-final-nl (save-excursion (goto-char e) (eq (char-before) ?\n)))
                     (raw (if (stringp response) response
                            (format "/* Error: %s */" (plist-get info :status))))
                     (lines (split-string raw "\n" nil))
                     (fixed
                      (let ((acc '()) (done nil))
                        (dolist (ln lines (mapconcat #'identity (nreverse acc) "\n"))
                          (if (and (not done) (string-match-p "\\S-" ln))
                              (progn
                                (push (replace-regexp-in-string "^[ \t]*" base-indent ln) acc)
                                (setq done t))
                            (push ln acc))))))
                (goto-char b)
                (delete-region b e)
                (insert fixed)
                (when had-final-nl (insert "\n"))))
          (set-marker beg nil)
          (set-marker end nil))))))

(defun a/gptel--execute-rewrite (prompt)
  "Execute rewrite with PROMPT."
  (let* ((beg (copy-marker (region-beginning)))
         (end (copy-marker (region-end)))
         (before (buffer-substring-no-properties
                  (max (point-min) (- beg a/gptel-rewrite-context-window)) beg))
         (focus  (buffer-substring-no-properties beg end))
         (after  (buffer-substring-no-properties
                  end (min (point-max) (+ end a/gptel-rewrite-context-window))))
         (buf (current-buffer))
         (info (a/gptel--target-lang-and-ext))
         (ext  (car info))
         (lang (cadr info))
         (diag (when (fboundp 'a/flycheck-diagnostics-string-for-region)
                 (a/flycheck-diagnostics-string-for-region beg end)))
         (js-guard (and ext (member ext '("js" "mjs" "cjs" "jsx"))
                        "- Because the target extension is JavaScript (.js/.mjs/.cjs/.jsx), do NOT use TypeScript-only features (types, interfaces, enums, generics).")))
    (let* ((payload
            (concat
             "### Language and target file\n"
             "Language: " lang "\n"
             (when ext (concat "Extension: ." ext "\n"))
             (when diag (concat "\n### Diagnostics (Flycheck, selected region)\n" diag "\n"))
             "\n### Surrounding context (before)\n" before
             "\n\n### Focus region (rewrite THIS region only)\n" focus
             "\n\n### Surrounding context (after)\n" after
             "\n\n### Request\n" prompt
             "\n\n### Output format\n"
             "- Return ONLY the corrected code for the Focus region.\n"
             "- The code must be valid " lang (when ext (format " for .%s" ext)) ".\n"
             "- No explanations. No comments. No Markdown/Org fences.\n"
             "- Your main focus is to accomplish what the Request asks and output something that substitutes the Focus region.\n"
             (or js-guard ""))))
      (when a/gptel-rewrite-echo-request
        (message "%s" (concat "[gptel] payload:\n" payload)))
      (let ((gptel-stream nil))
        (gptel-request
         payload
         :system (format
                  (concat "You are a code-rewriting assistant.\n"
                          "Output only %s code"
                          (if ext " targeting .%s files" "")
                          ", no prose, no comments, no Markdown or Org fences.\n"
                          "Do not echo the original snippet.\n"
                          "The diagnostics is the output of flycheck for the focused region. It may help you understand issues.\n"
                          "When extension and editor mode disagree, EXTENSION WINS.")
                  lang ext)
         :callback (apply-partially #'a/gptel--rewrite-callback buf beg end))))
    (when (fboundp 'evil-force-normal-state) (evil-force-normal-state))))

;; Initialize
(message "GPTel rewrite system loaded")

;;* flycheck`'
(defun a/flycheck--uniq (errors)
 "Deduplicate ERRORS by checker/pos/message."
 (let ((seen (make-hash-table :test 'equal))
       out)
   (dolist (e errors (nreverse out))
     (let ((k (list (flycheck-error-checker e)
                    (flycheck-error-line e)
                    (flycheck-error-column e)
                    (flycheck-error-end-line e)
                    (flycheck-error-message e))))
       (unless (gethash k seen)
         (puthash k t seen)
         (push e out))))))

(defun a/flycheck-errors-in-region (beg end &optional src-buf)
  "Return Flycheck errors in [BEG, END] in SRC-BUF or current buffer."
  (let ((buf (or src-buf (current-buffer))))
    (with-current-buffer buf
      (unless flycheck-mode
        (user-error "Flycheck is not active in %s" (buffer-name)))
      (let* ((lb (line-number-at-pos beg))
             (le (line-number-at-pos end))
             (raw (or (flycheck-overlay-errors-in beg end)
                      (cl-remove-if-not
                       (lambda (e)
                         (let* ((s   (flycheck-error-line e))
                                (eend (or (flycheck-error-end-line e) s)))
                           (and s (<= s le) (<= lb eend))))
                       flycheck-current-errors))))
        (cl-stable-sort
         (a/flycheck--uniq raw)
         (lambda (a b)
           (let ((la (flycheck-error-line a))  (lb (flycheck-error-line b))
                 (ca (or (flycheck-error-column a) 0))
                 (cb (or (flycheck-error-column b) 0)))
             (if (/= la lb) (< la lb) (< ca cb)))))))))

(defun a/flycheck-diagnostics-string-for-region (beg end)
  "Return a newline-joined list of Flycheck diagnostics for [BEG, END], or nil.
Includes all severities; no truncation; flat list."
  (when (and (bound-and-true-p flycheck-mode))
    (let ((errs (a/flycheck-errors-in-region beg end (current-buffer))))
      (when errs
        (mapconcat
         (lambda (e)
           (let ((lvl (pcase (flycheck-error-level e)
                        ('error "E") ('warning "W") ('info "I") (_ "?")))
                 (ln  (flycheck-error-line e))
                 (col (or (flycheck-error-column e) 0))
                 (msg (flycheck-error-message e))
                 (chk (flycheck-error-checker e)))
             (format "[%s] %d:%d %s%s"
                     lvl ln col msg (if chk (format " (%s)" chk) ""))))
         errs
         "\n")))))
