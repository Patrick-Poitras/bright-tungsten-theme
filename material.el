;;; -*- lexical-binding : t -*-
(require 'autothemer)

(defmacro deftheme-material (name description palette &rest body)
  `(autothemer-deftheme ,name
			,description
			,palette
;; Assign colors to faces.
 ((default (:foreground EditorForeground :background EditorBackground))
  (button  (:foreground Cyan :underline t))
  (cursor  (:background Caret))
  (region  (:background SelectionBackground))
  (cua-rectangle (:background SelectionBackground))
  (secondary-selection (:extend t :background SelectionBackground))
  (mouse-drag-and-drop-region (:inherit 'region))

  ;; Not sure about these
  (highlight (:inherit 'region))
  (lazy-highlight (:inherit 'region))

  (mode-line (:foreground Highlight-Gray :background ModeBarBackground))
  (mode-line-inactive (:foreground ModeBarForeground :background ModeBarBackground))
  (mode-line-highlight (:box (:line-width 1 :color SelectionBackground :style 'released-button)))
  (mode-line-buffer-id (:weight 'bold))
  (mode-line-emphasis  (:weight 'bold))

  (fringe (:background ModeBarBackground))
  (vertical-border (:foreground ModeBarBackground))
  (hl-line (:background HighlightActiveBackground))
  (scroll-bar (:foreground EditorBackground :background ModeBarBackground))
  (line-number (:foreground LineNumberUnselected :background EditorBackground))
  (line-number-current-line (:foreground ModeBarForeground :background EditorBackgroundDarker))
  (header-line (:background EditorBackgroundDarker))
  (link (:foreground Cyan :underline t))
  (link-visited (:foreground Magenta :inherit 'link))
  (minibuffer-prompt (:foreground Cyan :weight 'bold))

  (escape-glyph (:foreground Cyan))
  (homoglyph (:foreground Cyan))
  (nobreak-hyphen (:foreground Cyan))
  (nobreak-space (:underline t :foreground Cyan))

  ;; Flat border.
  (border nil)
  (internal-border nil)
  (window-divider-last-pixel (:inherit 'window-divider))
  (window-divider-first-pixel (:inherit 'window-divider))
  (window-divider (:foreground ModeBarBackground))

  (success (:weight 'bold :foreground Green))
  (warning (:weight 'bold :foreground Highlight-Orange))
  (error (:weight 'bold :foreground Red))

  (trailing-whitespace (:background "red2"))

  (isearch (:background A-DiffFineBackground))
  (isearch-fail (:background "red4"))
  (query-replace (:inherit 'isearch))
  (match (:background B-DiffFineBackground))

  (font-lock-warning-face (:foreground Red :weight 'bold))
  (font-lock-keyword-face (:foreground Cyan :slant 'italic :weight 'bold))
  (font-lock-function-name-face (:foreground Blue))
  (font-lock-preprocessor-face (:inherit 'default))
  (font-lock-doc-face (:foreground CommentsForeground))
  (font-lock-type-face (:foreground Yellow))
  (font-lock-builtin-face (:foreground Blue))
  (font-lock-comment-face (:foreground CommentsForeground))
  (font-lock-comment-delimiter-face (:inherit 'font-lock-comment-face))
  (font-lock-string-face (:foreground Green))
  (font-lock-constant-face (:foreground PaleOrange))
  (font-lock-variable-name-face (:inherit 'default))

  ;; Eshell definitions
  (eshell-prompt (:foreground Blue))
  (eshell-ls-backup (:foreground CommentsForeground))
  (eshell-ls-directory (:foreground Yellow :weight 'bold))
  (eshell-ls-symlink (:foreground Cyan))
  (eshell-ls-executable (:foreground Green))
  (eshell-ls-readonly (:foreground PaleOrange))
  (eshell-ls-archive (:foreground Magenta))
  ;;eshell-ls-clutter
  ;;eshell-ls-product
  ;;eshell-ls-missing
  ;;eshell-ls-special
  ;;eshell-ls-unreadable

  (comint-highlight-input (:weight 'bold))
  (comint-highlight-prompt (:inherit 'eshell-prompt))

  ;; Ediff
  (ediff-even-diff-A (:background DiffInactiveBackground))
  (ediff-even-diff-B (:background DiffInactiveBackground))
  (ediff-even-diff-C (:background DiffInactiveBackground))
  (ediff-odd-diff-A  (:background DiffInactiveBackground))
  (ediff-odd-diff-B  (:background DiffInactiveBackground))
  (ediff-odd-diff-C  (:background DiffInactiveBackground))
  (ediff-current-diff-A (:background A-DiffCurrentBackground))
  (ediff-fine-diff-A    (:background A-DiffFineBackground))
  (ediff-current-diff-B (:background B-DiffCurrentBackground))
  (ediff-fine-diff-B    (:background B-DiffFineBackground))
  (ediff-current-diff-C (:background C-DiffCurrentBackground))
  (ediff-fine-diff-C    (:background C-DiffFineBackground))

  (diff-refine-added (:background Add-DiffFineBackground :inherit 'diff-refine-changed))
  (diff-refine-removed (:background A-DiffFineBackground :inherit 'diff-refine-changed))
  (diff-refine-changed (:background  B-DiffFineBackground))
  (diff-nonexistent (:inherit 'diff-file-header))
  (diff-context (:extend t))
  (diff-function (:inherit 'diff-header))
  (diff-indicator-changed (:foreground DeepYellow :inherit 'diff-changed))
  (diff-indicator-added (:background Add-DiffFineBackground :inherit 'diff-added))
  (diff-indicator-removed (:background A-DiffFineBackground :inherit 'diff-removed))
  (diff-added (:extend t :background Add-DiffCurrentBackground))
  (diff-removed (:extend t :background A-DiffCurrentBackground))
  (diff-hunk-header (:inherit 'diff-header))
  (diff-index (:inherit 'diff-file-header))
  (diff-file-header  (:extend t :foreground White :background "grey35"))
  (diff-header (:extend t :foreground PaleBlue :background "grey20"))

  ;; Ido-mode
  ;; -> ido-indicator (not done)
  (ido-only-match (:foreground Green))
  (ido-subdir (:foreground Yellow :weight 'bold))

  ;; Magit mode
  (magit-keyword (:foreground Magenta))
  ;;(magit-section-highlight (:foreground Yellow :))
  (magit-section-heading (:foreground Yellow))
  (magit-branch-local (:foreground Cyan))
  (magit-head (:inherit 'magit-branch-local))
  (magit-branch-remote (:foreground Green))
  (magit-dimmed (:foreground CommentsForeground))

  (magit-blame-heading (:extend t :foreground PaleBlue :background "grey20"))
  (magit-blame-dimmed  (:inherit 'magit-dimmed))
  (magit-blame-margin  (:inherit 'magit-blame-heading))
  (magit-blame-highlight (:extend t :foreground White :background "grey35"))

  (magit-cherry-equivalent (:foreground Magenta))
  (magit-cherry-unmatched (:foreground Cyan))

  (magit-diff-whitespace-warning (:inherit 'trailing-whitespace))
  (magit-diff-context-highlight (:foreground EditorForeground :background "grey15"))
  (magit-diff-context (:inherit 'default))
  (magit-diff-their-highlight (:inherit 'magit-diff-added-highlight))
  (magit-diff-base-highlight (:extend t :background C-DiffFineBackground))
  (magit-diff-our-highlight (:inherit 'magit-diff-removed-highlight))
  (magit-diff-removed-highlight (:extend t :background A-DiffFineBackground))
  (magit-diff-added-highlight (:extend t :background Add-DiffFineBackground))
  (magit-diff-their (:inherit 'magit-diff-added))
  (magit-diff-base (:extend t :background C-DiffCurrentBackground))
  (magit-diff-our (:inherit 'magit-diff-removed))
  (magit-diff-removed (:extend t :background A-DiffCurrentBackground))
  (magit-diff-added (:extend t :background Add-DiffCurrentBackground))

  (magit-diff-hunk-heading (:inherit 'magit-blame-heading))
  (magit-diff-conflict-heading (:inherit 'magit-diff-hunk-heading))
  (magit-diff-lines-boundary  (:extend t :inherit 'magit-diff-lines-heading))
  (magit-diff-lines-heading (:extend t :background B-DiffFineBackground :foreground White))
  (magit-diff-revision-summary-highlight (:inherit 'magit-blame-highlight))
  (magit-diff-revision-summary (:inherit 'magit-diff-hunk-heading))
  (magit-diff-hunk-region (:extend t :inherit 'bold))
  (magit-diff-hunk-heading-selection (:inherit 'magit-diff-lines-heading))
  (magit-diff-hunk-heading-highlight (:inherit 'magit-blame-highlight))
  (magit-diff-file-heading-highlight (:foreground Highlight-Gray :inherit 'magit-diff-hunk-heading))
  (magit-diff-file-heading-selection (:slant 'italic :foreground White
					     :inherit 'magit-diff-file-heading))
  (magit-diff-file-heading (:weight 'bold :extend t))

  (magit-diffstat-removed (:foreground Red))
  (magit-diffstat-added (:foreground Green))

  (magit-process-ng (:foreground Red :inherit 'magit-section-heading))
  (magit-process-ok (:foreground Green :inherit 'magit-section-heading))
  (magit-mode-line-process-error (:inherit 'error))
  (magit-mode-line-process (:inherit 'mode-line-emphasis))

  (magit-reflog-other (:foreground Cyan ))
  (magit-reflog-remote (:foreground Cyan ))
  (magit-reflog-cherry-pick (:foreground Green ))
  (magit-reflog-rebase (:foreground Magenta))
  (magit-reflog-reset  (:foreground Red ))
  (magit-reflog-checkout (:foreground Blue))
  (magit-reflog-merge (:foreground Green ))
  (magit-reflog-amend (:foreground Magenta ))
  (magit-reflog-commit (:foreground Green ))

  (magit-bisect-bad (:foreground "IndianRed"))
  (magit-bisect-skip (:foreground Yellow))
  (magit-bisect-good (:foreground Green)) ;;browngreen
  (magit-sequence-exec (:inherit 'magit-hash))
  (magit-sequence-onto (:inherit 'magit-sequence-done))
  (magit-sequence-done (:inherit 'magit-hash))
  (magit-sequence-drop (:foreground "IndianRed"))
  (magit-sequence-head (:foreground Cyan))
  (magit-sequence-part (:foreground Yellow))
  (magit-sequence-stop (:foreground Green))

  ;;(magit-section-child-count nil)
  ;;(magit-section-heading-selection (:extend t :foreground ModeBarBackground))
  (magit-section-secondary-heading (:weight 'bold :extend t))

  (magit-blame-date nil)
  (magit-blame-name nil)
  (magit-blame-hash nil)
  (magit-blame-summary nil)
  (magit-sequence-pick (:inherit 'default))
  (magit-filename (:weight 'normal))
  (magit-signature-error (:foreground "Red"))
  (magit-signature-revoked (:foreground "Red"))
  (magit-signature-expired-key (:inherit 'magit-signature-expired))
  (magit-signature-expired (:inherit 'warning))
  (magit-signature-untrusted (:foreground Magenta))
  (magit-signature-bad (:foreground "Red" :weight 'bold))
  (magit-signature-good (:foreground Green))
  (magit-keyword-squash (:foreground Magenta))
  (magit-refname-pullreq (:inherit 'magit-refname))
  (magit-refname-wip (:inherit 'magit-refname))
  (magit-refname-stash (:inherit 'magit-refname))
  (magit-refname (:foreground White))
  (magit-branch-warning (:inherit 'warning))
  (magit-branch-upstream (:slant 'italic))
  (magit-branch-current (:box 1 :inherit 'magit-branch-local))
  (magit-branch-remote-head (:box 1 :inherit 'magit-branch-remote))
  (magit-tag (:foreground Yellow))
  (magit-hash (:foreground CommentsForeground))
  (magit-header-line-key  (:inherit 'font-lock-builtin-face))
  (magit-header-line (:inherit 'magit-section-heading))
  (magit-header-line-log-select (:inherit 'bold))
  (magit-log-date (:weight 'normal :slant 'normal :foreground PaleBlue))
  (magit-log-author (:foreground Magenta))
  (magit-log-graph (:foreground PaleBlue))

  (org-level-1 (:foreground Blue :weight 'bold))
  (org-level-2 (:foreground Yellow :weight 'bold))
  (org-level-3 (:foreground Red :weight 'bold))
  (org-level-4 (:foreground Magenta :weight 'bold))
  (org-level-5 (:foreground Cyan :weight 'bold))
  (org-level-6 (:foreground PaleOrange :weight 'bold))
  (org-level-7 (:foreground Green :weight 'bold))
  (org-level-8 (:inherit 'default :slant 'italic :weight 'bold))
  (org-block   (:inherit 'default))
  (org-todo    (:foreground PaleOrange :weight 'bold :underline t))
  (org-done    (:foreground Green :weight 'bold :underline t))
  (org-headline-done (:inherit 'org-done :underline nil))
  (org-headline-todo (:inherit 'org-todo))

  (org-mode-line-clock-overrun (:background Red :foreground White))
  (org-mode-line-clock (:inherit 'mode-line))
  (org-tag-group (:inherit 'org-tag))
  (org-macro (:inherit 'org-latex-and-related))
  (org-latex-and-related (:foreground PaleOrange))
  (org-agenda-calendar-sexp (:inherit 'default))
  (org-agenda-calendar-event (:inherit 'default))
  (org-agenda-diary (:inherit 'default))
  (org-agenda-current-time (:inherit 'org-time-grid))
  (org-time-grid (:foreground Yellow))
  (org-agenda-filter-regexp (:inherit 'mode-line))
  (org-agenda-filter-effort (:inherit 'mode-line))
  (org-agenda-filter-category (:inherit 'mode-line))
  (org-agenda-filter-tags (:inherit 'mode-line))
  (org-agenda-restriction-lock (:foreground PaleBlue :background "grey20"))
  (org-upcoming-distant-deadline (:inherit 'org-default))
  (org-upcoming-deadline (:foreground Highlight-Orange))
  (org-scheduled-previously (:foreground Highlight-Orange))
  (org-agenda-dimmed-todo-face (:foreground CommentsForeground))
  (org-scheduled-today (:foreground Green))
  (org-scheduled (:foreground Green))
  (org-agenda-date-weekend (:weight 'bold :inherit 'org-agenda-date))
  (org-agenda-clocking (:inherit 'secondary-selection))
  (org-agenda-date-today (:weight 'bold :slant 'italic :inherit 'org-agenda-date))
  (org-agenda-date (:inherit 'org-agenda-structure))
  (org-agenda-structure (:foreground Cyan))
  (org-clock-overlay (:background B-DiffFineBackground :foreground White))
  (org-verse (:inherit 'org-block))
  (org-quote (:inherit 'org-block))
  (org-verbatim (:inherit 'shadow))
  (org-block-end-line (:extend t :inherit 'org-block-begin-line))
  (org-block-begin-line (:extend t :inherit 'org-meta-line))
  (org-document-info-keyword (:inherit 'shadow))
  (org-document-info (:foreground Cyan))
  (org-document-title (:weight 'bold :foreground Cyan))
  (org-meta-line (:inherit 'font-lock-comment-face))
  (org-code (:inherit 'shadow))
  (org-formula (:foreground DeepYellow))
  (org-table-header (:foreground Black :background "LightGray" :inherit 'org-table))
  (org-table (:foreground Cyan))
  (org-checkbox-statistics-done (:inherit 'org-done))
  (org-checkbox-statistics-todo (:inherit 'org-todo))
  (org-checkbox (:inherit 'bold))
  (org-priority (:inherit 'font-lock-keyword-face))
  (org-agenda-done (:foreground Green))
  (org-list-dt (:weight 'bold))
  (org-tag (:weight 'bold))
  (org-sexp-date (:foreground Cyan))
  (org-date-selected (:inverse-video t :inherit 'org-date))
  (org-date (:underline t :foreground Cyan))
  (org-target (:underline t))
  (org-ellipsis  (:underline t :foreground Yellow))
  (org-footnote (:underline t :foreground Cyan))
  (org-link (:inherit 'link))
  (org-archived (:inherit 'shadow))
  (org-warning (:inherit 'font-lock-warning-face))
  (org-agenda-column-dateline (:inherit 'org-column))
  (org-column-title (:inherit 'org-column :weight 'bold :underline t))
  (org-column (:background "grey35"))
  (org-property-value nil)
  (org-drawer (:foreground Cyan))
  (org-special-keyword (:inherit 'font-lock-keyword-face))
  (org-hide (:foreground EditorBackground))

  (outline-1 (:foreground Blue))
  (outline-2 (:foreground EditorForeground))
  (outline-3 (:foreground Cyan))
  (outline-4 (:foreground Magenta))
  (outline-5 (:foreground Yellow))
  (outline-6 (:foreground Red))
  (outline-7 (:foreground Green))
  (outline-8 (:foreground PaleOrange))

  ;;;; Language font-locking
  ;;Slime/sldb/sly
  (slime-repl-output-face (:foreground PaleOrange :slant 'italic))

  (slime-repl-result-face (:foreground Blue))
  (slime-repl-prompt-face (:inherit 'minibuffer-prompt :weight 'normal))
  (slime-repl-input-face (:inherit 'default))
  (slime-repl-inputed-output-face (:foreground Green))
  (sldb-restart-type-face (:foreground PaleOrange))
  (sldb-restartable-frame-line-face (:foreground Blue))
  (sldb-restart-number-face (:foreground Cyan))
  (sldb-section-face (:slant 'italic :foreground Magenta))
  (sldb-frame-label-face (:foreground BrightBlack :background EditorBackground))
  (slime-repl-output-mouseover-face (:underline t :inherit 'slime-repl-inputed-output-face))

  (slime-note-face (:underline Yellow))
  (slime-style-warning-face (:underline Caret))
  (slime-warning-face (:underline Highlight-Orange))
  (slime-error-face (:underline "red"))

  (slime-inspector-type-face (:inherit 'font-lock-type-face))
  (slime-inspector-action-face (:foreground Cyan))
  (slime-inspector-value-face (:inherit 'font-lock-builtin-face))
  (slime-inspector-label-face (:foreground Magenta))
  (slime-inspector-topline-face nil)
  (slime-apropos-label (:inherit 'italic))
  (slime-apropos-symbol (:inherit 'bold))
  (slime-highlight-face (:underline nil :inherit 'highlight))
  (slime-reader-conditional-face (:inherit 'font-lock-comment-face))

  ;; Sly
  (sly-action-face (:foreground Green))
  (sly-mrepl-output-face (:foreground PaleOrange :slant 'italic))
  (sly-mrepl-note-face nil)
  (sly-mrepl-prompt-face (:inherit 'minibuffer-prompt :weight 'normal))
  (sly-part-button-face (:foreground Green))

  (sly-error-face (:underline Red))
  (sly-warning-face (:underline Highlight-Orange))
  (sly-style-warning-face (:underline Caret))
  (sly-note-face (:underline Yellow))
  (sly-db-topline-face nil)
  (sly-db-condition-face (:inherit 'error))
  (sly-db-restart-number-face  (:foreground Cyan))
  (sly-db-section-face (:foreground Magenta :slant 'italic))
  (sly-db-restartable-frame-line-face  (:foreground Blue))

  (sly-db-frame-label-face  (:foreground Cyan))

  (sly-db-restart-face nil)
  (sly-db-frame-line-face nil)
  (sly-db-non-restartable-frame-line-face nil)
  (sly-db-local-name-face nil)
  (sly-db-catch-tag-face nil)
  (sly-mode-line (:weight 'bold :foreground PaleOrange))
  (sly-apropos-symbol  (:inherit 'sly-part-button-face))
  (sly-apropos-label  (:inherit 'italic))
  (sly-reader-conditional-face   (:inherit 'font-lock-comment-face))

  (hi-blue (:foreground Black :background Blue))
  (hi-green (:foreground Black :background Green))
  (hi-pink (:foreground Black :background "IndianRed1"))

  (sly-stickers-placed-face  (:foreground Black :background EditorForeground))
  (sly-stickers-armed-face  (:strike-through nil :inherit 'hi-blue))
  (sly-stickers-recordings-face   (:strike-through nil :inherit 'hi-green))
  (sly-stickers-empty-face   (:strike-through nil :inherit 'hi-pink))
  (sly-stickers-exited-non-locally-face   (:strike-through t :inherit 'sly-stickers-empty-face))

  ;; tree-sitter
  (tree-sitter-hl-face:method (:foreground Blue))
  (tree-sitter-hl-face:method.call (:foreground Blue))
  (tree-sitter-hl-face:function (:foreground Blue))
  (tree-sitter-hl-face:function.call (:foreground Blue))
  (tree-sitter-hl-face:function.macro (:foreground Blue))
  (tree-sitter-hl-face:variable.parameter (:foreground Red))
  (tree-sitter-hl-face:variable.builtin (:foreground Red))
  (tree-sitter-hl-face:variable (:inherit 'default))
  (tree-sitter-hl-face:operator (:foreground Magenta))
  (tree-sitter-hl-face:number (:foreground PaleOrange))
  (tree-sitter-hl-face:property (:inherit 'default))
  (tree-sitter-hl-face:constructor (:foreground Yellow))
  (tree-sitter-hl-face:constant.builtin (:foreground PaleOrange))
  (tree-sitter-hl-face:punctuation (:foreground Cyan))
  (tree-sitter-hl-face:type (:foreground Yellow))
  (tree-sitter-hl-face:type.builtin (:foreground Yellow))
  (tree-sitter-hl-face:keyword (:inherit 'font-lock-keyword-face))

  (tree-sitter-hl-face:attribute (:inherit 'font-lock-preprocessor-face))
  (tree-sitter-hl-face:tag (:inherit 'font-lock-builtin-face))
  (tree-sitter-hl-face:punctuation.special (:inherit 'tree-sitter-hl-face:keyword))
  (tree-sitter-hl-face:punctuation.delimiter (:inherit 'tree-sitter-hl-face:punctuation))
  (tree-sitter-hl-face:punctuation.bracket (:inherit 'tree-sitter-hl-face:punctuation))
  (tree-sitter-hl-face:constant (:inherit 'font-lock-constant-face))
  (tree-sitter-hl-face:label (:inherit 'font-lock-preprocessor-face))
  (tree-sitter-hl-face:embedded (:inherit 'default))
  (tree-sitter-hl-face:escape(:inherit 'font-lock-keyword-face))
  (tree-sitter-hl-face:string.special (:foreground Cyan))
  (tree-sitter-hl-face:string (:inherit 'font-lock-string-face))
  (tree-sitter-hl-face:doc (:inherit 'font-lock-doc-face))
  (tree-sitter-hl-face:comment (:inherit 'font-lock-comment-face))
  (tree-sitter-hl-face:property.definition (:inherit 'tree-sitter-hl-face:variable.parameter))
  (tree-sitter-hl-face:variable.special (:foreground Red :slant 'italic))
  (tree-sitter-hl-face:type.super (:inherit 'tree-sitter-hl-face:type))
  (tree-sitter-hl-face:type.argument (:inherit 'tree-sitter-hl-face:type))
  (tree-sitter-hl-face:type.parameter  (:inherit 'font-lock-type-face))
  (tree-sitter-hl-face:function.special (:inherit 'font-lock-preprocessor-face))
  (tree-sitter-hl-face:function.builtin (:inherit 'font-lock-builtin-face))

  (js2-function-param (:inherit 'tree-sitter-hl-face:variable.parameter))
  (js2-function-call (:inherit 'tree-sitter-hl-face:function.call)))
 ,@body))
