;;; autocomplete.el -*- lexical-binding: t; -*-

;; from here: https://emacs.stackexchange.com/questions/13286/how-can-i-stop-the-enter-key-from-triggering-a-completion-in-company-mode
;; TODO upgrade with what's here?
;; https://github.com/radian-software/radian/blob/223abc524f693504af6ebbc70ad2d84d9a6e2d1b/radian-emacs/radian-autocomplete.el#L6-L182

;;; Prevent suggestions from being triggered automatically. In particular,
;;; this makes it so that:
;;; - TAB will always complete the current selection.
;;; - RET will only complete the current selection if the user has explicitly
;;;   interacted with Company.
;;; - SPC will never complete the current selection.
;;;
;;; Based on:
;;; - https://github.com/company-mode/company-mode/issues/530#issuecomment-226566961
;;; - https://emacs.stackexchange.com/a/13290/12534
;;; - http://stackoverflow.com/a/22863701/3538165
;;;
;;; See also:
;;; - https://emacs.stackexchange.com/a/24800/12534
;;; - https://emacs.stackexchange.com/q/27459/12534

;; <return> is for windowed Emacs; RET is for terminal Emacs
(after! company
  (dolist (key '("<return>" "RET"))
    ;; Here we are using an advanced feature of define-key that lets
    ;; us pass an "extended menu item" instead of an interactive
    ;; function. Doing this allows RET to regain its usual
    ;; functionality when the user has not explicitly interacted with
    ;; Company.
    (define-key company-active-map (kbd key)
      `(menu-item nil company-complete
                  :filter ,(lambda (cmd)
                             (when (company-explicit-action-p)
                               cmd)))))
  (map! :map company-active-map "TAB" #'company-complete-selection)
  (map! :map company-active-map "SPC" nil)

  ;; Company appears to override the above keymap based on company-auto-complete-chars.
  ;; Turning it off ensures we have full control.
  (setq company-auto-complete-chars nil)
)
