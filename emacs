(show-paren-mode 1)
(setq show-paren-delay 0)

;; ===== Set standard indent to 2 rather that 4 ====
(setq standard-indent 2)

;; ========== Enable Line and Column Numbering ==========

;; Show line-number in the mode line
(line-number-mode 1)

;; Show column-number in the mode line
(column-number-mode 1)

;; space as tab
(setq-default indent-tabs-mode nil)

;; ========== Prevent Emacs from making backup files ==========
(setq make-backup-files nil)
