;;; conf/visual.el -*- lexical-binding: t; -*-

(defun my/select-current-function ()
  "Select the current function at point, or org block if in org-mode."
  (interactive)
  (if (eq major-mode 'org-mode)
      ;; In org-mode, select the current block
      (my/select-org-block-content)
    ;; Otherwise, select function
    (let ((start nil) (end nil)
          (original-point (point)))
      (save-excursion
        (end-of-defun)
        (beginning-of-defun)
        (when (> original-point (point))
          (goto-char original-point)
          (end-of-defun)
          (beginning-of-defun))
        (while (and (not (eobp))
                    (looking-at "^[ \t]*$"))
          (forward-line 1))
        (setq start (point))
        (end-of-defun)
        (forward-line -1)
        (while (and (> (point) start)
                    (looking-at "^[ \t]*$"))
          (forward-line -1))
        (end-of-line)
        (setq end (point)))
      (when (and start end (< start end))
        (goto-char start)
        (set-mark end)
        (activate-mark)
        (message "Function selected")))))

(defun my/select-org-block-content ()
  "Select the entire org block including begin/end lines."
  (interactive)
  (let ((start nil)
        (end nil)
        (original-point (point)))
    (save-excursion
      ;; If we're on a begin line, move forward first to avoid selecting previous block
      (when (looking-at "^[ \t]*#\\+begin_")
        (forward-line 1))

      ;; Find the beginning of the current block
      (when (re-search-backward "^[ \t]*#\\+begin_" nil t)
        (beginning-of-line)
        (setq start (point))
        ;; Find the end of the block
        (when (re-search-forward "^[ \t]*#\\+end_" nil t)
          (end-of-line)
          (setq end (point)))))
    (when (and start end (< start end))
      (goto-char start)
      (set-mark end)
      (activate-mark)
      (message "Org block selected"))))

;; Smart solution: Handle vp/vo while preserving vap/vip etc.
(defun my/smart-v-handler ()
  "Handle 'v' key smartly - check next key to decide action."
  (interactive)
  (let ((next-key (read-key)))
    (cond
     ;; Our custom bindings
     ((eq next-key ?p) (my/select-current-function))
     ((eq next-key ?o) (my/select-org-block-content))
     ;; For 'a' (text objects like 'ap', 'aw', etc.), enter visual mode first
     ((eq next-key ?a)
      (evil-visual-char)
      (setq unread-command-events (list ?a)))
     ;; For 'i' (text objects like 'ip', 'iw', etc.), enter visual mode first
     ((eq next-key ?i)
      (evil-visual-char)
      (setq unread-command-events (list ?i)))
     ;; For any other key, enter visual mode and pass the key through
     (t
      (evil-visual-char)
      (setq unread-command-events (list next-key))))))

;; Bind our smart handler to 'v'
(define-key evil-normal-state-map "v" 'my/smart-v-handler)
