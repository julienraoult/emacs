
;; ===================================
;; MELPA Package Support
;; ===================================
;; Enables basic packaging support
(require 'package)

;; Adds the Melpa archive to the list of available repositories
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; Initializes the package infrastructure
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; Installs packages
;;
;; myPackages contains a list of package names
(defvar myPackages
  '(better-defaults                 ;; Set up some better Emacs defaults
    elpy                            ;; Emacs Lisp Python Environment
    flycheck                        ;; On the fly syntax checking
    py-autopep8                     ;; Run autopep8 on save
    blacken                         ;; Black formatting on save
    ein                             ;; Emacs IPython Notebook
    material-theme                  ;; Theme
    )
  )

;; Scans the list in myPackages
;; If the package listed is not already installed, install it
(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      myPackages)

;; ====================================
;; Development Setup
;; ====================================
;; Enable elpy
(elpy-enable)

;; Use IPython for REPL
(setq python-shell-interpreter "jupyter"
      python-shell-interpreter-args "console --simple-prompt"
      python-shell-prompt-detect-failure-warning nil)
(add-to-list 'python-shell-completion-native-disabled-interpreters
             "jupyter")

;; Enable Flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; Enable autopep8
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; ===================================
;; Basic Customization
;; ===================================

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(backup-by-copying t)
 '(c-basic-offset 3)
 '(case-fold-search t)
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(current-language-environment "Latin-1")
 '(custom-enabled-themes (quote (leuven)))
 '(custom-safe-themes
   (quote
    ("89885317e7136d4e86fb842605d47d8329320f0326b62efa236e63ed4be23c58" "e6df46d5085fde0ad56a46ef69ebb388193080cc9819e2d6024c9c6e27388ba9" default)))
 '(default-input-method "latin-1-prefix")
 '(fci-rule-color "#37474f")
 '(gdb-many-windows t)
 '(gdb-show-main t)
 '(global-font-lock-mode t nil (font-lock))
 '(global-set-key (quote C-xg) t)
 '(hl-sexp-background-color "#1c1f26")
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(mouse-drag-copy-region t)
 '(mouse-wheel-scroll-amount (quote (1 ((shift) . 1) ((control)))))
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages (quote (zenburn-theme flycheck)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(set-default-font "Courier New 8")
 '(setq default-tab-width)
 '(show-paren-mode t nil (paren))
 '(vhdl-align-groups nil)
 '(vhdl-basic-offset 3)
 '(vhdl-word-completion-case-sensitive t)
 '(void-text-area-pointer (quote arrow)))
 ;;'(put-text-property start end pointer arrow))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mouse ((t nil))))

;; Backup directory pour avoir tous les fichiers de backup dans un
;; seul repertoire plutôt que d'en avoir partout
(setq backup-directory-alist '(("." . "E:/temp/backup")))

;Affichage du nom du buffer/fichier dans la barre de titre
(setq frame-title-format '(buffer-file-name "Emacs: %b (%f)" "Emacs: %b"))

(setq inhibit-startup-message t)    ;; Hide the startup message
(load-theme 'material t)            ;; Load material theme
;;(global-linum-mode t)               ;; Enable line numbers globally

;; Nécessaire pour pouvoir configurer les packages additionnels
(require 'package)
(package-initialize)
 
;; Vérifications en cours de frappe
(when (functionp 'global-flycheck-mode)
  (global-flycheck-mode 1)
  (push 'python-pylint flycheck-checkers))

(put 'upcase-region 'disabled nil)

(setq ps-printer-name '"\\\\IMPSERV-UL\\photoco17")

;; user key link
(define-key global-map [f5] "goto-line")
