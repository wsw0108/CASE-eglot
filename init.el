(package-initialize)
(package-refresh-contents)

(unless (package-installed-p 'eglot)
  (package-install 'eglot))
(unless (package-installed-p 'go-mode)
  (package-install 'go-mode))

(setq make-backup-files nil
      auto-save-default nil)
(show-paren-mode 1)

(require 'project)
(require 'eglot)
(require 'go-mode)

(setq eglot-autoshutdown t)
(setq eglot-extend-to-xref t)
(setq eglot-server-programs '((go-mode . ("gopls" "-v" "-rpc.trace" "-logfile" "eglot-gopls.txt"))))

(add-hook 'go-mode-hook 'eglot-ensure)
