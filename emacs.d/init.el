;; Startup stuff:
(setq debug-on-error t)
(setq inhibit-startup-message t)
(server-start)
(desktop-save-mode 1)
(tool-bar-mode 0)
(menu-bar-mode 0)
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

;; Put ~ files in one place, not all over the file system.
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

(defvar autosave-dir "~/.saves/")

(make-directory autosave-dir t)

(defun auto-save-file-name-p (filename)
  (string-match "^#.*#$" (file-name-nondirectory filename)))

(defun make-auto-save-file-name ()
  (concat autosave-dir
   (if buffer-file-name
      (concat "#" (file-name-nondirectory buffer-file-name) "#")
    (expand-file-name
     (concat "#%" (buffer-name) "#")))))

(require 'package)
(add-to-list 'package-archives 
         '("melpa" . "http://melpa-stable.milkbox.net/packages/"))
(package-initialize)

(defun my-haskell-mode-hook ()
  (setq line-number-mode t)
  (setq column-number-mode t)
)

(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)
(add-hook 'haskell-mode-hook 'my-haskell-mode-hook)
(setq haskell-font-lock-symbols t)
(setq completion-ignored-extensions (cons ".hi" completion-ignored-extensions))

(setq auto-mode-alist
   (cons '("\\.md" . markdown-mode) auto-mode-alist))

;; Other customizations:
(load "~/.emacs.d/xml-gen.el")
(load "~/.emacs.d/revert-all-buffers.el")
(load "~/.emacs.d/find-library-file.el")

;; For work:
;; Allow hash to be entered  
(global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))

(require 'ido)
(ido-mode t)
