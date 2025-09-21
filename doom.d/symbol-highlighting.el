;;; symbol-highlighting.el -*- lexical-binding: t; -*-

(setq lsp-enable-symbol-highlighting nil) ; disable symbol highlighting

;; (defun scvalex/highlight-symbol-next ()
;;   (interactive)
;;   (highlight-symbol-next)
;;   (recenter 'nil))
;; (defun scvalex/highlight-symbol-prev ()
;;   (interactive)
;;   (highlight-symbol-prev)
;;   (recenter 'nil))

;; (map! :leader "h s" #'evil-ex-search-word-forward)
;; (map! :leader "h s" #'highlight-symbol-at-point)
;; (map! "M-n" #'scvalex/highlight-symbol-next)
;; (map! "M-p" #'scvalex/highlight-symbol-prev)
;;
;;(require 'hi-lock)
(defun jpt-toggle-mark-word-at-point ()
  (interactive)
  (if hi-lock-interactive-patterns
      (unhighlight-regexp (car (car hi-lock-interactive-patterns)))
    (highlight-symbol-at-point)))


(map! :leader "h s" #'jpt-toggle-mark-word-at-point)
;; (global-set-key (kbd "s-.") 'jpt-toggle-mark-word-at-point)

(defun vsinha/unhighlight ()
  (interactive)
  ;; (highlight-symbol-remove-all)
  ;; (evil-ex-nohighlight)
  (unhighlight-regexp t)
  )
(map! :leader "h a" #'vsinha/unhighlight)
