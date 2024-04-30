
(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(csv
     javascript
     emacs-lisp
     (helm :variables
           helm-enable-auto-resize t
           helm-no-header t
           helm-position 'right
           helm-use-fuzzy 'source
           spacemacs-helm-rg-max-column-number 1024
           )
     multiple-cursors
     (treemacs :variables treemacs-use-follow-mode 'tag
               treemacs-use-filewatch-mode t
               treemacs-use-scope-type 'Perspectives
               treemacs-use-git-mode 'deferred
               treemacs-collapse-dirs 3
               treemacs-use-all-the-icons-theme t
               )
     (c-c++ :variables c-c++-backend 'lsp-clangd
            c-c++-dap-adapters '(dap-lldb dap-cpptools)
            c-c++-default-mode-for-headers 'c++-mode
            c-c++-enable-organize-includes-on-save t
            c-c++-enable-clang-format-on-save t
            c-c++-enable-google-style t
            c-c++-enable-google-newline t
            c-c++-enable-auto-newline t
            c-c++-adopt-subprojects t
            )
     (ibuffer :variables
              ibuffer-group-buffers-by 'projects
              )
     (org :variables
          org-todo-dependencies-strategy 'naive-auto
          org-todo-dependencies-strategy 'naive-auto
          org-enable-github-support t
          org-enable-reveal-js-support t
          org-enable-sticky-header t
          org-enable-valign t
          org-enable-modern-support t
          org-enable-appear-support t
          org-enable-transclusion-support t
          org-enable-verb-support t
          )
     (better-defaults :variables
                      better-defaults-move-to-beginning-of-code-first t
                      better-defaults-move-to-end-of-code-first nil
                      )
     helpful
     outshine
     dtrt-indent
     nav-flash
     (spacemacs-editing :variables
                        vim-style-enable-undo-region t)
     spacemacs-editing-visual
     (spacemacs-evil :variables
                     spacemacs-evil-collection-allowed-list
                     '(eglot))
     spacemacs-language
     spacemacs-modeline
     spacemacs-navigation
     spacemacs-org
     spacemacs-project
     spacemacs-purpose
     spacemacs-visual

     graphviz

     (html :variables
           web-fmt-tool 'web-beautify
           html-enable-leex-support t
           )
     json
     (markdown :variables
               markdown-mmm-auto-modes '("c" "c++" "python" "scala" ("elisp" "emacs-lisp"))
               )
     (plantuml :variables
               plantuml-jar-path "~/.local/plantuml.jar"
               plantuml-default-exec-mode 'library
               )
     (shell-scripts :variables
                    shell-scripts-format-on-save t
                    shell-scripts-backend 'lsp
                    )
     (python :variables
             python-backend 'lsp
             python-lsp-server 'pyright
             python-test-runner 'pytest
             python-formatter 'yapf
             python-format-on-save t
             python-fill-column 99
             python-sort-imports-on-save t
             )

     speed-reading
     (git :variables
          git-enable-magit-delta-plugin t
          git-enable-magit-gitflow-plugin t
          it-enable-magit-todos-plugin t

          )
     (colors :variables
             colors-colorize-identifiers 'all
             colors-colorize-identifiers 'all
             colors-default-rainbow-identifiers-sat 42
             colors-default-rainbow-identifiers-light 86
             ;; colors-enable-nyan-cat-progress-bar t
             ;; colors-enable-nyan-cat-progress-bar (display-graphic-p)
             )
     (cmake :variables
            cmake-backend 'lsp
            cmake-enable-cmake-ide-support t
            )
     dap
     (debug :variables
            debug-additional-debuggers '("remake")
            )
     eww
     imenu-list
     (lsp :variables
          lsp-lens-enable t
          lsp-modeline-diagnostics-enable nil
          lsp-headerline-breadcrumb-segments '(symbols)
          lsp-headerline-breadcrumb-segments '(project file symbols)
          )
     prettier
     (shell :variables
            shell-default-shell 'eshell
            shell-default-position 'right
            shell-default-width 40
            shell-default-term-shell "/bin/bash"
            multi-term-program "/bin/bash"
            shell-default-full-span nil
            shell-enable-smart-eshell t
            shell-protect-eshell-prompt nil
            close-window-with-terminal t
            )
     tmux
     (tree-sitter :variables
                  spacemacs-tree-sitter-hl-black-list '(js2-mode rjsx-mode)
                  tree-sitter-syntax-highlight-enable t
                  tree-sitter-fold-enable t
                  tree-sitter-fold-indicators-enable nil
                  )
     (xclipboard :variables
                 xclipboard-enable-cliphist t
                 )
     evil-better-jumper
     openai
     search-engine
     theming
     themes-megapack
     )

   dotspacemacs-additional-packages '()
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '()
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  (setq-default
   dotspacemacs-enable-emacs-pdumper nil
   dotspacemacs-emacs-pdumper-executable-file "emacs"
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-gc-cons '(100000000 0.1)
   dotspacemacs-read-process-output-max (* 1024 1024)
   dotspacemacs-use-spacelpa nil
   dotspacemacs-verify-spacelpa-archives t
   dotspacemacs-check-for-update nil
   dotspacemacs-elpa-subdirectory 'emacs-version
   dotspacemacs-editing-style 'vim
   dotspacemacs-startup-buffer-show-version t
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-banner-scale 'auto
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-show-startup-list-numbers t
   dotspacemacs-startup-buffer-multi-digit-delay 0.4
   dotspacemacs-startup-buffer-show-icons nil
   dotspacemacs-new-empty-buffer-major-mode 'text-mode
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-scratch-buffer-persistent nil
   dotspacemacs-scratch-buffer-unkillable nil
   dotspacemacs-initial-scratch-message nil
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Source Code Pro"
                               :size 10.0
                               :weight normal
                               :width normal)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-ex-command-key ":"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-auto-generate-layout-names nil
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-enable-paste-transient-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-switch-to-buffer-prefers-purpose nil
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup t
   dotspacemacs-undecorated-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-background-transparency 90
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-scroll-bar-while-scrolling t
   dotspacemacs-line-numbers nil
   dotspacemacs-folding-method 'evil
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-activate-smartparens-mode t
   dotspacemacs-smart-closing-parenthesis nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-enable-server nil
   dotspacemacs-server-socket-dir nil
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
   dotspacemacs-frame-title-format "%I@%S"
   dotspacemacs-icon-title-format nil
   dotspacemacs-show-trailing-whitespace t
   dotspacemacs-whitespace-cleanup nil
   dotspacemacs-use-clean-aindent-mode t
   dotspacemacs-use-SPC-as-y nil
   dotspacemacs-swap-number-row nil
   dotspacemacs-zone-out-when-idle nil
   dotspacemacs-pretty-docs nil
   dotspacemacs-home-shorten-agenda-source nil
   dotspacemacs-byte-compile nil
   dotspacemacs-distinguish-gui-tab t
   )
  )

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env)
  )

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  (setq-default git-magit-status-fullscreen t)
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  (add-hook 'eshell-mode-hook
            (lambda ()
              (eshell/alias "ff" "find-file $1")))
  (setq-default font-lock-mode 'minimal)
  (with-eval-after-load 'lsp-mode
    ;; define keybindings for your desired functionality
    (define-key lsp-mode-map (kbd "<f12>") 'lsp-find-definition)
    (define-key lsp-mode-map (kbd "<f2>") 'lsp-rename)
    (define-key lsp-mode-map (kbd "S-<f12>") 'lsp-find-references)
    (define-key lsp-mode-map (kbd "C-SPC") 'company-complete)
    (define-key lsp-mode-map (kbd "C-]") 'evil-jump-item)
    ;; add more keybindings if needed
    )
  (with-eval-after-load 'org
    (setq org-superstar-headline-bullets-list '(?■ ?◆ ?▲ ?▶))
    )

  (defun shell/post-init-window-purpose ()
    (purpose-set-extension-configuration
     :shell-layer
     (purpose-conf :mode-purposes '((vterm-mode . terminal)
                                    (eshell-mode . terminal)
                                    (shell-mode . terminal)
                                    (term-mode . terminal)))))
  (purpose-add-user-purposes :names '(("*Anaconda Help*" . general))
                             :regexps '(("\\.hy$" . python)))

  (require 'git-commit)
  (global-git-commit-mode t)

  (setq browse-url-browser-function 'browse-url-generic
        engine/browser-function 'browse-url-generic
        browse-url-generic-program "google-chrome"
        )
  (global-set-key (kbd "<f1>"   ) 'grep                                              )
  (global-set-key (kbd "<f2>"   ) 'split-window-below                                )
  (global-set-key (kbd "<f3>"   ) 'helm-projectile-rg                                )
  (global-set-key (kbd "<f4>"   ) 'find-file                                         )
  (global-set-key (kbd "M-<f4>" ) 'projectile-find-file                              )
  (global-set-key (kbd "<f6>"   ) 'spacemacs-layouts/non-restricted-buffer-list-helm )
  (global-set-key (kbd "<f7>"   ) 'compile                                           )
  (global-set-key (kbd "<f8>"   ) 'next-error                                        )
  (global-set-key (kbd "M-<f8>" ) 'previous-error                                    )
  (global-set-key (kbd "<f9>"   ) 'helm-occur                                        )
  (global-set-key (kbd "M-<f9>" ) 'multi-occur                                       )
  (global-set-key (kbd "<f10>"  ) 'other-window                                      )

  ;; (custom-set-faces
  ;;  '(markdown-header-face-1 ((t (:inherit default :foreground "#6c71c4" :weight bold :height 1.3)))) ; a soft indigo
  ;;  '(markdown-header-face-2 ((t (:inherit default :foreground "#9f95f8" :weight bold :height 1.2)))) ; a muted cyan
  ;;  '(markdown-header-face-3 ((t (:inherit default :foreground "#859900" :weight bold :height 1.1)))) ; a calm green
  ;;  '(markdown-header-face-4 ((t (:inherit default :foreground "#2aa198" :weight bold :height 1.0)))) ; a teal
  ;;  '(markdown-header-face-5 ((t (:inherit default :foreground "#d33682" :weight bold :height 0.9)))) ; a subdued magenta
  ;;  '(markdown-header-face-6 ((t (:inherit default :foreground "#cb4b16" :weight bold :height 0.8)))) ; a warm orange
  ;;  '(markdown-bold-face ((t (:inherit default :foreground "SaddleBrown" :weight bold :height 1.0)))) ; a neutral slate
  ;;  )
  (custom-set-faces
   '(markdown-header-face-1 ((t (:inherit default :foreground "#2188b6" :weight bold :height 1.3 :underline (:color "#6D8143" :style line)))))
   '(markdown-header-face-2 ((t (:inherit default :foreground "#6D8143" :weight bold :height 1.2 :underline (:color "#2188b6" :style line)))))
   '(markdown-header-face-3 ((t (:inherit default :foreground "#48746D" :weight bold :height 1.1 :underline (:color "#6A9FB5" :style line)))))
   '(markdown-header-face-4 ((t (:inherit default :foreground "#6A9FB5" :weight bold :height 1.0 :slant italic :underline (:color "#48746D" :style line)))))
   '(markdown-header-face-5 ((t (:inherit default :foreground "#446674" :weight bold :height 1.0 :slant italic :underline (:color "#6A9FB5" :style line)))))
   '(markdown-header-face-6 ((t (:inherit default :foreground "#6A9FB5" :weight bold :height 1.0 :slant italic :underline (:color "#446674" :style line)))))
   '(markdown-bold-face ((t (:inherit default :foreground "#72584B" :weight bold :height 1.0))))
   )
  (defun my/evil-shift-right-keep-region (beg end)
    "Shift right and keep the region selected."
    (interactive "r")
    (evil-shift-right beg end)
    (evil-normal-state)
    (evil-visual-restore))

  (define-key evil-visual-state-map (kbd "TAB") 'my/evil-shift-right-keep-region)
  (setq c-default-style "stroustrup")
  (setq-default c-basic-offset 4)

  (set-terminal-parameter nil 'background-mode 'dark)
  (set-frame-parameter nil 'background-mode 'dark)
  )

(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cmake-ide-cmake-opts "-DCMAKE_EXPORT_COMPILE_COMMANDS=ON --preset default")
 '(connection-local-criteria-alist
   '(((:application eshell)
      eshell-connection-default-profile)
     ((:application tramp)
      tramp-connection-local-default-system-profile tramp-connection-local-default-shell-profile)))
 '(connection-local-profile-alist
   '((eshell-connection-default-profile
      (eshell-path-env-list))
     (tramp-connection-local-darwin-ps-profile
      (tramp-process-attributes-ps-args "-acxww" "-o" "pid,uid,user,gid,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" "-o" "state=abcde" "-o" "ppid,pgid,sess,tty,tpgid,minflt,majflt,time,pri,nice,vsz,rss,etime,pcpu,pmem,args")
      (tramp-process-attributes-ps-format
       (pid . number)
       (euid . number)
       (user . string)
       (egid . number)
       (comm . 52)
       (state . 5)
       (ppid . number)
       (pgrp . number)
       (sess . number)
       (ttname . string)
       (tpgid . number)
       (minflt . number)
       (majflt . number)
       (time . tramp-ps-time)
       (pri . number)
       (nice . number)
       (vsize . number)
       (rss . number)
       (etime . tramp-ps-time)
       (pcpu . number)
       (pmem . number)
       (args)))
     (tramp-connection-local-busybox-ps-profile
      (tramp-process-attributes-ps-args "-o" "pid,user,group,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" "-o" "stat=abcde" "-o" "ppid,pgid,tty,time,nice,etime,args")
      (tramp-process-attributes-ps-format
       (pid . number)
       (user . string)
       (group . string)
       (comm . 52)
       (state . 5)
       (ppid . number)
       (pgrp . number)
       (ttname . string)
       (time . tramp-ps-time)
       (nice . number)
       (etime . tramp-ps-time)
       (args)))
     (tramp-connection-local-bsd-ps-profile
      (tramp-process-attributes-ps-args "-acxww" "-o" "pid,euid,user,egid,egroup,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" "-o" "state,ppid,pgid,sid,tty,tpgid,minflt,majflt,time,pri,nice,vsz,rss,etimes,pcpu,pmem,args")
      (tramp-process-attributes-ps-format
       (pid . number)
       (euid . number)
       (user . string)
       (egid . number)
       (group . string)
       (comm . 52)
       (state . string)
       (ppid . number)
       (pgrp . number)
       (sess . number)
       (ttname . string)
       (tpgid . number)
       (minflt . number)
       (majflt . number)
       (time . tramp-ps-time)
       (pri . number)
       (nice . number)
       (vsize . number)
       (rss . number)
       (etime . number)
       (pcpu . number)
       (pmem . number)
       (args)))
     (tramp-connection-local-default-shell-profile
      (shell-file-name . "/bin/sh")
      (shell-command-switch . "-c"))
     (tramp-connection-local-default-system-profile
      (path-separator . ":")
      (null-device . "/dev/null"))))
 '(custom-enabled-themes '(sanityinc-solarized-dark))
 '(custom-safe-themes
   '("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default))
 '(font-lock-maximum-decoration '((t . 0)))
 '(package-selected-packages
   '(csv-mode helm-rg darkmine-theme treemacs-icons-dired yasnippet-snippets winum professional-theme markdown-toc reverse-theme spacemacs-whitespace-cleanup evil-exchange lsp-python-ms soft-morning-theme helm-c-yasnippet cpp-auto-include symbol-overlay lsp-pyright js2-refactor darktooth-theme quickrun nodejs-repl git-messenger json-mode org-present expand-region orgit-forge company-c-headers emmet-mode helm-xref flycheck-elsa seti-theme npm-mode helm-mode-manager tree-sitter-langs better-jumper gotham-theme gitignore-templates gruber-darker-theme yapfify nose impatient-mode railscasts-theme term-cursor organic-green-theme clean-aindent-mode org-modern fancy-battery hybrid-mode pcre2el spaceline evil-visual-mark-mode code-cells lsp-origami helm-make birds-of-paradise-plus-theme ws-butler molokai-theme pug-mode undo-tree flatui-theme lorem-ipsum mwim eval-sexp-fu password-generator shell-pop white-sand-theme uuidgen gh-md pytest esh-help helpful helm-git-grep eyebrowse define-word volatile-highlights helm-ctest ox-gfm centered-cursor-mode dap-mode company-shell helm-rtags editorconfig occidental-theme space-doc twilight-theme texfrag helm-comint evil-args toxi-theme underwater-theme valign cyberpunk-theme fish-mode web-beautify flycheck-rtags disaster naquadah-theme prettier-js company-web subatomic-theme helm-css-scss spacegray-theme monochrome-theme org-superstar doom-themes git-link dumb-jump terminal-here chocolate-theme py-isort zenburn-theme tao-theme dakrone-theme jbeans-theme importmagic org-sticky-header js-doc golden-ratio evil-indent-plus restart-emacs hemisu-theme sphinx-doc spray color-theme-sanityinc-solarized evil-surround lsp-ui evil-visualstar org-projectile evil-tutor zonokai-emacs treemacs-magit evil-org treemacs-persp rainbow-delimiters devdocs gnuplot helm-lsp sass-mode vi-tilde-fringe vim-powerline evil-easymotion git-modes open-junk-file elisp-slime-nav macrostep evil-mc phoenix-dark-pink-theme unfill evil-iedit-state magit-delta helm-purpose pydoc purple-haze-theme grandshell-theme highlight-parentheses aggressive-indent evil-textobj-line farmhouse-themes diminish treemacs-evil anti-zenburn-theme rebecca-theme planet-theme ujelly-theme symon evil-escape solarized-theme plantuml-mode hide-comnt spacemacs-purpose-popwin apropospriate-theme helm-ls-git hc-zenburn-theme helm-projectile evil-anzu web-mode pipenv slim-mode afternoon-theme oldlace-theme json-reformat auto-highlight-symbol gendoxy org-appear ample-theme elisp-def ample-zen-theme pip-requirements multi-term twilight-bright-theme org-mime soft-charcoal-theme org-rich-yank kaolin-themes eshell-prompt-extras smyx-theme lush-theme omtose-phellack-theme realgud helm-pydoc evil-cleverparens multi-line scss-mode heroku-theme org-download pippel highlight-numbers dracula-theme modus-themes light-soap-theme flatland-theme evil-matchit clues-theme toc-org evil-goggles helm-swoop obsidian-theme inkpot-theme dired-quick-sort color-identifiers-mode dall-e evil-collection magit-gitflow cmake-mode minimal-theme color-theme-sanityinc-tomorrow gandalf-theme string-edit-at-point espresso-theme writeroom-mode treemacs-all-the-icons zen-and-art-theme eziam-themes org-contrib google-c-style flx-ido company-anaconda eshell-z shfmt exotica-theme tango-plus-theme flycheck-ycmd jazz-theme darkokai-theme moe-theme gruvbox-theme sunny-day-theme ccls hungry-delete evil-nerd-commenter helm-ag ir-black-theme smeargle pyenv-mode hl-todo paradox ace-jump-helm-line outshine graphviz-dot-mode drag-stuff alect-themes verb info+ evil-numbers nav-flash popwin org-transclusion codegpt dotenv-mode string-inflection busybee-theme soft-stone-theme blacken cherry-blossom-theme twilight-anti-bright-theme inspector material-theme madhat2r-theme helm-descbinds org-re-reveal treemacs-projectile insert-shebang evil-evilified-state tangotango-theme flycheck-pos-tip evil-unimpaired evil-lisp-state poetry mmm-mode helm-themes ibuffer-projectile git-timemachine ace-link helm-org dtrt-indent json-navigator phoenix-dark-mono-theme django-theme column-enforce-mode google-translate link-hint multi-vterm soothe-theme tango-2-theme indent-guide pylookup company-rtags auto-compile livid-mode company-ycmd flycheck-bashate subatomic256-theme chatgpt flycheck-package live-py-mode rainbow-identifiers monokai-theme highlight-indentation bubbleberry-theme holy-mode majapahit-themes evil-lion org-cliplink helm-company cmake-ide which-key sublime-themes emr rainbow-mode tagedit badwolf-theme noctilux-theme nameless helm-org-rifle ts-fold mustang-theme org-pomodoro overseer cython-mode engine-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(font-lock-function-name-face ((t (:inherit bold))))
 '(markdown-bold-face ((t (:inherit default :foreground "#72584B" :weight bold :height 1.0))))
 '(markdown-header-face-1 ((t (:inherit default :foreground "#2188b6" :weight bold :height 1.3 :underline (:color "#6D8143" :style line)))))
 '(markdown-header-face-2 ((t (:inherit default :foreground "#6D8143" :weight bold :height 1.2 :underline (:color "#2188b6" :style line)))))
 '(markdown-header-face-3 ((t (:inherit default :foreground "#48746D" :weight bold :height 1.1 :underline (:color "#6A9FB5" :style line)))))
 '(markdown-header-face-4 ((t (:inherit default :foreground "#6A9FB5" :weight bold :height 1.0 :slant italic :underline (:color "#48746D" :style line)))))
 '(markdown-header-face-5 ((t (:inherit default :foreground "#446674" :weight bold :height 1.0 :slant italic :underline (:color "#6A9FB5" :style line)))))
 '(markdown-header-face-6 ((t (:inherit default :foreground "#6A9FB5" :weight bold :height 1.0 :slant italic :underline (:color "#446674" :style line))))))
)
