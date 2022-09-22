;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Viraj Sinha"
      user-mail-address "")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(load! "~/.doom.d/symbol-highlighting.el")
(load! "~/.doom.d/autocomplete.el")
(load! "~/.doom.d/windowing.el")
;; (load! "~/.doom.d/bazel.el")
(load! "~/.doom.d/go.el")

(setq xterm-set-window-title nil)
(setq confirm-kill-emacs nil) ; don't confirm on quit

;; TODO this doesn't work, line is still highlighting
;; (global-hl-line-modes nil)
(remove-hook 'doom-first-buffer-hook #'global-hl-line-mode)
(remove-hook! (prog-mode text-mode conf-mode special-mode) #'hl-line-mode) ; disable highlighting the current line
;; (remove-hook! (prog-mode text-mode conf-mode special-mode) #'global-hl-line-modes) ; disable highlighting the current line

(unless window-system
  (map! "<mouse-4>" #'scroll-down-line)
  (map! "<mouse-5>" #'scroll-up-line))

(map! "C-j" (lambda () (interactive) (next-line  8)))
(map! "C-k" (lambda () (interactive) (next-line -8)))
(map! :leader "rl" #'vertico-repeat)

(map! :nv "s" #'evil-surround-region) ; by default this is S
(map! :leader :nv ";" #'evilnc-comment-operator)

(map! :leader "ah" #'magit)


(map! :after flycheck :map flycheck-mode-map "C-c C-l" #'flycheck-list-errors)
(map! :after flycheck :map flycheck-mode-map :localleader "en" #'flycheck-next-error)
(map! :after flycheck :map flycheck-mode-map :localleader "ep" #'flycheck-previous-error)
(map! :after lsp :map lsp-mode-map :localleader "rr" #'lsp-rename)

(map! :leader "aft" #'(lambda () (interactive) (+doom-dashboard/open (selected-frame)) (projectile-switch-project)))

;; Set up lookup functions which go to the other window
(dolist (fn '(definition references))
  (fset (intern (format "+lookup/%s-other-window" fn))
        (lambda (identifier &optional arg)
          "Results open in a new window"
          (interactive (list (doom-thing-at-point-or-region)
                             current-prefix-arg))
          (let ((pt (point)))
            (switch-to-buffer-other-window (current-buffer))
            (goto-char pt)
            (funcall (intern (format "+lookup/%s" fn)) identifier arg)))))
(map! :n ",gg" #'+lookup/definition)
(map! :n ",gG" #'+lookup/definition-other-window)

;; show a paste transient state
(general-def
  :prefix-map 'custom-paste-map
  "C-j" #'evil-paste-pop-next
  "C-k" #'evil-paste-pop)
(hercules-def
 :show-funs '(evil-paste-after evil-paste-before)
 :keymap 'custom-paste-map
 :transient t)

(after! dired (setq diff-hl-dired-ignored-backends (append '((Git) (RCS)))))

(evil-define-motion vsinha/next-visual-line (count)
  "Move the cursor COUNT screen lines down, or 5."
  :type exclusive
  (let ((line-move-visual t))
    (evil-line-move (or count 5))))

(evil-define-motion vsinha/prev-visual-line (count)
  "Move the cursor COUNT screen lines down, or 5."
  :type exclusive
  (let ((line-move-visual t))
    (evil-line-move (or count -5))))

(map! :nv "C-j" #'vsinha/next-visual-line)
(map! :nv "C-k" #'vsinha/prev-visual-line)
