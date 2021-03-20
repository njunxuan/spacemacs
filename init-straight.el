;; The rest of this file sets up straight.el so that packages are installed by
;; it rather than built-in package.el.

;; Use "develop" rather than default "master" to use bleeding edge version.
(setq straight-repository-branch "develop")

;; Enable this (default is nil) so that (use-package ...) will use straight.
(setq straight-use-package-by-default t)

;; Default value is '(find-at-startup find-when-checking)
(setq straight-check-for-modifications '(find-at-startup find-when-checking))

;; Default is 'full which means to clone complete history.
(setq straight-vc-git-default-clone-depth 10)

;; 'https is the default, but can be set to 'ssh
(setq straight-vc-git-default-protocol 'https)

;; Following are standard setup lines from https://github.com/raxod502/straight.el.git
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Install use-package first and setup so that use-package will use straight.el
;; rather than package.el by default.
(straight-use-package 'use-package)

;; Following is from https://github.com/raxod502/straight.el/issues/352
;; This can be fixed when org 9.5 is released where org and contrib will be separate packages.
(straight-use-package '(org-plus-contrib :includes (org)))
