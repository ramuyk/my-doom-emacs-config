;;; alias.el -*- lexical-binding: t; -*-

;;* my
  ;;* aliases
(a/defalias alias/refresh-docstrings a/alias-refresh-docstrings alias)

  ;;* exec
(a/defalias exec/display-tree a/exec-display-tree exec)
(a/defalias exec/display-tree-json a/exec-display-tree-json exec)
(a/defalias exec/display-exiftool a/exec-display-exiftool exec)
(a/defalias exec/frequency-analysis a/exec-frequency-analysis exec)

  ;;* git
(a/defalias git/init magit-init magit)
(a/defalias git/remote-add magit-remote-add magit)
(a/defalias git/commit-amend magit-commit-amend magit)

  ;;* sudo
(a/defalias sudo/find-alternate-file find-alternate-file sudo)

  ;;* cd
(a/defalias cd/consult-shortcuts a/consult-shortcuts cd)

;;* main
  ;;* avy
  ;;* claude-code
  ;;* corfu
  ;;* consult
  ;;* copilot
(a/defalias copilot/login copilot-login copilot)
(a/defalias copilot/restart-and-diagnose copilot-diagnose copilot)


  ;;* dired
(a/defalias dired/do-async-shell-command dired-do-async-shell-command dired)
(a/defalias dired/peep peep-dired dired)
(a/defalias dired/mark-files-regexp dired-mark-files-regexp dired)
(a/defalias dired/do-kill-lines dired-do-kill-lines dired)
(a/defalias dired/peep-kill-buffers-without-window peep-dired-kill-buffers-without-window dired)
(a/defalias dired/toggle-marks dired-toggle-marks dired)
(a/defalias dired/mark-files-containing-regexp dired-mark-files-containing-regexp dired)
(a/defalias dired/diff-split-or-current dired-diff dired)

  ;;* dirvish
(a/defalias dirvish/narrow dirvish-narrow dired)
(a/defalias dirvish/side dirvish-side dired)
(a/defalias dirvish/total-file-size dirvish-total-file-size dired)

  ;;* gptel
(a/defalias gptel/add gptel-add gptel)
(a/defalias gptel/menu gptel-menu gptel)
(a/defalias gptel/ask-visual-content a/gptel-ask-visual-content gptel)
(a/defalias gptel/rewrite-region a/gptel-rewrite-region gptel)
(a/defalias gptel/search-rewrite-history a/gptel-search-rewrite-history gptel)
(a/defalias gptel/edit-rewrite-history a/gptel-edit-rewrite-history gptel)



  ;;* lsp
(a/defalias lsp/rename lsp-rename lsp)
(a/defalias lsp/find-definition lsp-find-definition lsp)
(a/defalias lsp/find-references lsp-find-references lsp)
(a/defalias lsp/organize-imports lsp-organize-imports lsp)
(a/defalias lsp/format-buffer lsp-format-buffer lsp)
(a/defalias lsp/format-region lsp-format-region lsp)
(a/defalias lsp/describe-thing-at-point lsp-describe-thing-at-point lsp)
(a/defalias lsp/doctor lsp-doctor lsp)
(a/defalias lsp/restart-workspace lsp-restart-workspace lsp)
(a/defalias lsp/describe-session lsp-describe-session lsp)
(a/defalias lsp/consult-diagnostics consult-lsp-diagnostics lsp)
(a/defalias lsp/consult-symbols consult-lsp-symbols lsp)
(a/defalias lsp/consult-file-symbols consult-lsp-file-symbols lsp)
(a/defalias lsp/debug-python-env a/debug-python-lsp-environment lsp)
(a/defalias lsp/restart-python a/restart-python-lsp lsp)

  ;;* kmacro
(a/defalias macro/consult-kmacro consult-kmacro macro)
(a/defalias macro/evil-record-macro evil-record-macro macro)
(a/defalias macro/name-last-kbd-macro name-last-kbd-macro macro)
(a/defalias macro/repeat a/macro-repeat macro)
(a/defalias macro/edit-named-kbd-macro edit-named-kbd-macro macro)
(a/defalias macro/insert-kbd-macro insert-kbd-macro macro)

  ;;* magit
(a/defalias magit/log-buffer-file magit-log-buffer-file magit)
(a/defalias magit/log-current magit-log-current magit)
(a/defalias magit/blame magit-blame magit)
(a/defalias magit/commit-amend magit-commit-amend magit)

  ;;* org
(a/defalias org/goto org-goto org)
(a/defalias org/occur org-occur org)
(a/defalias org/tags-sparse-tree org-tags-sparse-tree org)
(a/defalias org/show-next-fold-level +org/show-next-fold-level org)

  ;;* projectile
(a/defalias projectile/invalidate-cache projectile-invalidate-cache projectile)


  ;;* vertico
  ;;* vterm
(a/defalias vterm/beginning-of-line vterm-beginning-of-line vterm)

  ;;* tramp
(a/defalias tramp/cleanup-all-buffers tramp-cleanup-all-buffers tramp)
(a/defalias tramp/cleanup-all-connections tramp-cleanup-all-connections tramp)
;;(a/defalias tramp/cleanup-this-connection tramp-cleanup-this-connection tramp)

  ;;* yasnippet
(a/defalias yasnippet/consult consult-yasnippet company)

;;* secondary
  ;;* bookmark
  ;;* centaur-tabs
(a/defalias tab/ace-jump centaur-tabs-ace-jump centaur-tabs)
(a/defalias tab/kill-other-buffers-in-current-group centaur-tabs-kill-other-buffers-in-current-group centaur-tabs)
(a/defalias tab/kill-match-buffers-in-current-group centaur-tabs-kill-match-buffers-in-current-group centaur-tabs)
(a/defalias tab/refresh a/centaur-tabs-refresh centaur-tabs)
(a/defalias tab/copy-path-to-clipboard centaur-tabs--copy-file-name-to-clipboard centaur-tabs)
(a/defalias tab/new-empty-buffer +default/new-buffer centaur-tabs)
(a/defalias tab/rename-buffer rename-buffer centaur-tabs)

  ;;* eshell
  ;;* embark
(a/defalias embark/bindings embark-bindings embark)

  ;;* flycheck
(a/defalias flycheck/mode flycheck-mode flycheck)
(a/defalias flycheck/consult consult-flycheck flycheck)
(a/defalias flycheck/lsp-ui-list lsp-ui-flycheck-list flycheck)


  ;;* hacks
(a/defalias hack/save-buffer-to-tmp a/save-buffer-to-tmp hack)

  ;;* help
(a/defalias help/at-point helpful-at-point help)

  ;;* ibuffer
(a/defalias ibuffer-filter-by-mode ibuffer-filter-by-mode help)
(a/defalias ibuffer-filter-by-name ibuffer-filter-by-name help)
(a/defalias ibuffer-filter-by-content ibuffer-filter-by-content help)

  ;;* imenu
(a/defalias imenu/consult consult-imenu imenu)
(a/defalias imenu/consult-multi consult-imenu-multi imenu)
(a/defalias imenu/lsp-ui-imenu lsp-ui-imenu imenu)
(a/defalias imenu/lsp-ui-imenu--refresh lsp-ui-imenu--refresh imenu)

  ;;* lookup
(a/defalias lookup/references +lookup/references lookup)

  ;;* occur
(a/defalias occur/buffer occur lookup)

  ;;* org-babel
  ;;* org-capture
  ;;* org-drill
  ;;* org-roam
(a/defalias roam/node-find org-roam-node-find org-roam)
(a/defalias roam/roam-dailies-goto-today org-roam-dailies-goto-today org-roam)
(a/defalias roam/roam-dailies-find-date org-roam-dailies-find-date org-roam)

  ;;* org-table
(a/defalias table/import org-table-import org)
(a/defalias table/create org-table-create org)
(a/defalias table/align org-table-align org)
(a/defalias table/insert-column-left +org/table-insert-column-left org)

  ;;* persp
  ;;* swiper
(a/defalias swiper/default-search-buffer +default/search-buffer help)
(a/defalias swiper/vertico-search-symbol-at-point +vertico/search-symbol-at-point help)

  ;;* treemacs
(a/defalias treemacs/collapse-all-projects treemacs-collapse-all-projects treemacs)

  ;;* treesit
  ;;* which-key
  ;;* workspaces
(a/defalias workspace/delete +workspace/delete workspaces)
(a/defalias workspace/kill +workspace/kill workspaces)
(a/defalias workspace/load +workspace/load workspaces)
(a/defalias workspace/new +workspace/new workspaces)
(a/defalias workspace/rename +workspace/rename workspaces)
(a/defalias workspace/restore-last-session +workspace/restore-last-session workspaces)
(a/defalias workspace/save +workspace/save workspaces)
(a/defalias workspace/switch-to +workspace/switch-to workspaces)

  ;;* window
(a/defalias window/swap-states window-swap-states workspaces)
  ;;* tailwindcss
(a/defalias tailwindcss/sort lsp-tailwindcss-rustywind workspaces)

  ;;* undo
(a/defalias undo/tree-visualize undo-tree-visualize workspaces)

;;* check
  ;;* docker
(a/defalias docker/images docker-images docker)
(a/defalias docker/image-inspect docker-image-inspect docker)
(a/defalias docker/volume-dired docker-volume-dired docker)
(a/defalias docker/volumes docker-volumes docker)
(a/defalias docker/containers docker-containers docker)
(a/defalias docker/container-dired docker-container-dired docker)
(a/defalias docker/networks docker-networks docker)
(a/defalias docker/vterm docker-container-vterm docker)
(a/defalias docker/eshell docker-container-eshell docker)
(a/defalias docker/help a/docker-help docker)

  ;;* jupyter
(a/defalias jupyter/eval-buffer jupyter-eval-buffer jupyter)
;;(a/defalias jupyter/run-repl jupyter-run-repl jupyter)
(a/defalias jupyter/repl-associate-buffer jupyter-repl-associate-buffer jupyter)
(a/defalias jupyter/server-list-kernels jupyter-server-list-kernels jupyter)
(a/defalias jupyter/repl-restart-kernel jupyter-repl-restart-kernel jupyter)

;;* utils
  ;;* toggle
(a/defalias toggle/truncate-wrap-lines toggle-truncate-lines toggle)

  ;;* bookmark
