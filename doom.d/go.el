;;; go.el -*- lexical-binding: t; -*-

(setq lsp-go-use-gofumpt t)
(setq lsp-gopls-staticcheck t)
(setq lsp-eldoc-render-all t)
(setq lsp-gopls-complete-unimported t)

(defun vsinha/gofumpt ()
  "Run gofumpt on current file"
  (interactive)
  (shell-command (format "gofumpt -l -w %s" (shell-quote-argument (buffer-file-name))))
  (revert-buffer t t t))

;; (add-hook 'go-mode-hook #'(add-hook 'before-save-hook #'(lsp-organize-imports t t)))

(defun vsinha/go-tidy ()
  "Run go mod tidy in current directory"
  (interactive)
  (shell-command "go mod tidy"))

(map! :after go :map go-mode-map :localleader "tt" #'go-test-current-project)

(defun vsinha/println ()
  (interactive)
  (setq word (thing-at-point 'symbol))
  (setq data (format "fmt.Printf(\"%%#v\\n\", %s)" word ))
  (message "Thing at point: %s" word)
  (message "Copied %s to kill-ring" data)
  (kill-new data))


(after! go-mode
  (setq gofmt-command "goimports")
  (add-hook 'go-mode-hook
            (lambda ()
              (add-hook 'after-save-hook 'gofmt nil 'make-it-local))))
