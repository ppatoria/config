;;; init.el --- Spacemacs Initialization File -*- no-byte-compile: t -*-
;;
;; Copyright (c) 2012-2022 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.


;; Without this comment emacs25 adds (package-initialize) here
;; (package-initialize)

;; Avoid garbage collection during startup.
;; see `SPC h . dotspacemacs-gc-cons' for more info
(defconst emacs-start-time (current-time))
(setq gc-cons-threshold 402653184 gc-cons-percentage 0.6)
(load (concat (file-name-directory load-file-name)
              "core/core-versions")
      nil (not init-file-debug))
(load (concat (file-name-directory load-file-name)
              "core/core-load-paths")
      nil (not init-file-debug))
(load (concat spacemacs-core-directory "core-dumper")
      nil (not init-file-debug))

;; Remove compiled core files if they become stale or Emacs version has changed.
(load (concat spacemacs-core-directory "core-compilation")
      nil (not init-file-debug))
(load spacemacs--last-emacs-version-file t (not init-file-debug))
(when (or (not (string= spacemacs--last-emacs-version emacs-version))
          (> 0 (spacemacs//dir-byte-compile-state
                (concat spacemacs-core-directory "libs/"))))
  (spacemacs//remove-byte-compiled-files-in-dir spacemacs-core-directory))
;; Update saved Emacs version.
(unless (string= spacemacs--last-emacs-version emacs-version)
  (spacemacs//update-last-emacs-version))

(if (not (version<= spacemacs-emacs-min-version emacs-version))
    (error (concat "Your version of Emacs (%s) is too old. "
                   "Spacemacs requires Emacs version %s or above.")
           emacs-version spacemacs-emacs-min-version)
  ;; Disabling file-name-handlers for a speed boost during init might seem like
  ;; a good idea but it causes issues like
  ;; https://github.com/syl20bnr/spacemacs/issues/11585 "Symbol's value as
  ;; variable is void: \213" when emacs is not built having:
  ;; `--without-compress-install`
  (let ((please-do-not-disable-file-name-handler-alist nil))
    (require 'core-spacemacs)
    (spacemacs/dump-restore-load-path)
    (configuration-layer/load-lock-file)
    (spacemacs/init)
    (configuration-layer/stable-elpa-init)
    (configuration-layer/load)
    (spacemacs-buffer/display-startup-note)
    (spacemacs/setup-startup-hook)
    (spacemacs/dump-eval-delayed-functions)
    (when (and dotspacemacs-enable-server (not (spacemacs-is-dumping-p)))
      (require 'server)
      (when dotspacemacs-server-socket-dir
        (setq server-socket-dir dotspacemacs-server-socket-dir))
      (unless (server-running-p)
        (message "Starting a server...")
        (server-start)))))
(add-to-list 'load-path "~/.emacs.d/site-lisp/emacs-application-framework/")
;; (require 'eaf)
;; (require 'eaf-browser)
;; (require 'eaf-pdf-viewer)

 (global-set-key (kbd "<f1>"    ) 'helm-semantic-or-imenu                            )
 (global-set-key [(shift f1)]     'lsp-ui-imenu                                      )
 (global-set-key (kbd "<f2>"    ) 'split-window-vertically                           )
 (global-set-key (kbd "<f3>"    ) 'helm-projectile-rg                                )
 (global-set-key (kbd "<f4>"    ) 'find-file                                         )
 (global-set-key (kbd "<f5>"    ) 'helm-projectile-find-file                         )
 (global-set-key (kbd "<f6>"    ) 'spacemacs-layouts/non-restricted-buffer-list-helm )
(global-set-key  [(shift f6)]     'buffer-menu                                       )
 (global-set-key (kbd "<f7>"    ) 'compile                                           )
 (global-set-key (kbd "<f8>"    ) 'next-error                                        )
 (global-set-key [(shift f8)]     'previous-error                                    )
 (global-set-key (kbd "<f9>"    ) 'helm-swoop                                        )
 (global-set-key [(shift f9)]     'occur                                             )
 (global-set-key (kbd "<f10>"   ) 'other-window                                      )
 (global-set-key (kbd "<f11>"   ) 'shell-command                                     )
 (global-set-key (kbd "<f12>"   ) 'lsp-find-definition                               )
 (global-set-key [(shift f12)]    'lsp-find-references                               )
 (global-set-key (kbd "M-,"     ) 'helm-find                                         )
 (global-set-key (kbd "M-l"     ) 'toggle-truncate-lines                             )

(xterm-mouse-mode -1)

(eval-after-load 'grep
  '(progn
     (add-to-list 'grep-find-ignored-directories "bin")
     (add-to-list 'grep-find-ignored-files "*.so")
     (add-to-list 'grep-find-ignored-files "*.db")
     (add-to-list 'grep-find-ignored-files "*.a")))

(setq-default dotspacemacs-configuration-layers
              '((c-c++ :variables
                       c-c++-default-mode-for-headers 'c++-mode)))

(setq-default dotspacemacs-configuration-layers
              '((c-c++ :variables c-c++-enable-clang-support t)))

;; Bind clang-format-region to C-M-tab in all modes:
(global-set-key [C-M-tab] 'clang-format-region)
;; Bind clang-format-buffer to tab on the c++-mode only:
(add-hook 'c++-mode-hook 'clang-format-bindings)
(defun clang-format-bindings ()
  (define-key c++-mode-map [tab] 'clang-format-buffer))

;; enable pcre glob ally
(rxt-global-mode 1)

;; sql mode
(defun my-sql-save-history-hook ()
  (let ((lval 'sql-input-ring-file-name)
        (rval 'sql-product))
    (if (symbol-value rval)
        (let ((filename
               (concat "~/.sql_history/"
                       (symbol-name (symbol-value rval))
                       "-emacs.sql")))
          (set (make-local-variable lval) filename))
      (error
       (format "SQL history will not be saved because %s is nil"
               (symbol-name rval))))))

(add-hook 'sql-interactive-mode-hook
          (lambda()
            (toggle-truncate-lines t)
            (my-sql-save-history-hook)))


(defun my-sql-login-hook ()
  "Custom SQL log-in behaviours. See `sql-login-hook'."
  (when (eq sql-product 'oracle)
    (let ((proc (get-buffer-process (current-buffer))))
      (comint-send-string proc "SET COLSEP    \"|\"    ;\n" )
      (comint-send-string proc "SET LINESIZE  32767    ;\n" )
      (comint-send-string proc "SET PAGESIZE  50000    ;\n" )
      (comint-send-string proc "SET TRIMSPOOL ON       ;\n" )
      (comint-send-string proc "SET TRIMOUT   ON       ;\n" )
      (comint-send-string proc "SET WRAP      ON       ;\n" )
      (comint-send-string proc "set termout   off      ;\n" )
      (comint-send-string proc "set heading   on       ;\n" )
      (comint-send-string proc "set long      99999999 ;\n" )
      ;; (comint-send-string proc "select SYS_CONTEXT('USERENV','SERVER_HOST') from dual;")
      ;; (comint-send-string proc "select SYS_CONTEXT('USERENV','DB_NAME') from dual;")
      ;; (comint-send-string proc "select SYS_CONTEXT('USERENV','HOST') from dual;")
      ;; (comint-send-string proc "select SYS_CONTEXT('USERENV','IP_ADDRESS') from dual;")
      ;; (comint-send-string proc "select SYS_CONTEXT('USERENV','SID') from dual;")
      )))
(rxt-global-mode 1)


(add-hook 'sql-login-hook 'my-sql-login-hook)


(custom-set-variables
 '(sql-connection-alist
   '(
     (" ats-dev"
      (sql-product 'oracle)
      (sql-user "ppatoria")
      f (sql-database "njats2d"))
     (" ats-qa"
      (sql-product 'oracle)
      (sql-user "ln_prod")
      f(sql-database "njats2q"))
      )
     )
   )
;;(load-file "~/.emacs.d/gtest-mode.el")
(load-file "/home/ppatoria/.emacs.d/sqlplus.el")

(add-hook 'shell-mode-hook 'my-shell-mode-setup-function)
(defun my-shell-mode-setup-function ()
    (company-mode -1)
    )

(menu-bar-mode 1)
(add-hook 'shell-mode-hook (lambda () (company-mode -1)) 'append)
;;(setq-default ediff-forward-word-function 'forward-char)
;; (require 'package)
;; ( add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;; (package-initialize)

(with-eval-after-load 'flycheck
  (require 'flycheck-clang-analyzer)
  (flycheck-clang-analyzer-setup))

(use-package flycheck-clang-analyzer
  :ensure t
  :after flycheck
  :config (flycheck-clang-analyzer-setup))

(setq-default dotspacemacs-themes '(list-themes-here)) 
