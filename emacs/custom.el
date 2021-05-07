(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Man-notify-method 'pushy)
 '(abbrev-file-name "/home/val/.config/nixpkgs/emacs/abbrev_defs")
 '(after-save-hook '(executable-make-buffer-file-executable-if-script-p))
 '(ange-ftp-netrc-filename "~/.authinfo.gpg")
 '(apropos-sort-by-scores t)
 '(async-shell-command-buffer 'new-buffer)
 '(auth-sources '("~/.authinfo.gpg" "~/.netrc" "~/.authinfo"))
 '(auto-revert-avoid-polling t)
 '(auto-revert-remote-files t)
 '(auto-save-file-name-transforms '((".*" "/home/val/.cache/emacs/auto-saves/" t)))
 '(auto-save-list-file-prefix "/home/val/.cache/emacs/auto-saves-list/.saves-")
 '(avy-background t)
 '(avy-goto-word-0-regexp "\\_<\\(?:\\sw\\|\\s_\\)")
 '(avy-keys '(97 111 101 117 104 116 110 115))
 '(avy-style 'words)
 '(backup-by-copying t)
 '(backup-directory-alist '((".*" . "/home/val/.local/share/emacs/backups")))
 '(before-save-hook '(whitespace-cleanup delete-trailing-whitespace))
 '(bookmark-default-file "/home/val/.local/share/emacs/bookmarks")
 '(bookmark-save-flag 1)
 '(browse-url-browser-function 'browse-url-multi)
 '(browse-url-chromium-program "chromium-incognito")
 '(browse-url-generic-program "qutebrowser")
 '(browse-url-multi-invidious-instances
   '("invidious.tube" "invidious.zapashcanon.fr" "tube.connect.cafe" "vid.puffyan.us" "invidious.048596.xyz" "invidious.himiko.cloud" "invidious.zee.li" "invidious.namazso.eu" "yewtu.be" "ytprivate.com" "vid.mint.lgbt" "inv.skyn3t.in" "invidious.kavin.rocks" "au.ytprivate.com"))
 '(browse-url-secondary-browser-function 'browse-url-multi)
 '(c-default-style '((java-mode . "java") (other . "awk")))
 '(calendar-week-start-day 1)
 '(cargo-process--command-build "build --color never")
 '(cargo-process--command-check "check --color never")
 '(cargo-process--command-clippy "clippy --color never -Zunstable-options")
 '(cargo-process--command-current-file-tests "test --color never")
 '(cargo-process--command-current-test "test --color never")
 '(cargo-process--command-rm "rm --color never")
 '(cargo-process--command-run "run --color never")
 '(cargo-process--command-test "test --color never")
 '(column-number-mode t)
 '(comint-buffer-maximum-size 10000)
 '(comint-input-ignoredups t)
 '(comint-input-ring-size 10000)
 '(comint-mode-hook '(smartparens-mode))
 '(comint-password-prompt-regexp
   "\\(^ *\\|\\( SMB\\|'s\\|Bad\\|CVS\\|Enter\\(?: \\(?:Auth\\|\\(?:sam\\|th\\)e\\)\\)?\\|Kerberos\\|LDAP\\|New\\|Old\\|PEM\\|Re\\(?:peat\\|type\\)\\|SUDO\\|UNIX\\|\\[sudo]\\|enter\\(?: \\(?:auth\\|\\(?:sam\\|th\\)e\\)\\)?\\|login\\|new\\|old\\) +.*\\)\\(?:\\(?:adgangskode\\|contrase\\(?:\\(?:ny\\|ñ\\)a\\)\\|geslo\\|h\\(?:\\(?:asł\\|esl\\)o\\)\\|iphasiwedi\\|jelszó\\|l\\(?:ozinka\\|ösenord\\)\\|m\\(?:ot de passe\\|ật khẩu\\)\\|p\\(?:a\\(?:rola\\|s\\(?:ahitza\\|s\\(?: phrase\\|code\\|ord\\|phrase\\|wor[dt]\\)\\|vorto\\)\\)\\|in\\)\\|s\\(?:alasana\\|enha\\|laptažodis\\)\\|wachtwoord\\|лозинка\\|пароль\\|ססמה\\|كلمة السر\\|गुप्तशब्द\\|शब्दकूट\\|গুপ্তশব্দ\\|পাসওয়ার্ড\\|ਪਾਸਵਰਡ\\|પાસવર્ડ\\|ପ୍ରବେଶ ସଙ୍କେତ\\|கடவுச்சொல்\\|సంకేతపదము\\|ಗುಪ್ತಪದ\\|അടയാളവാക്ക്\\|රහස්පදය\\|ពាក្យសម្ងាត់\\|パスワード\\|密[码碼]\\|암호\\)\\|Response\\)\\(?:\\(?:, try\\)? *again\\| (empty for no passphrase)\\| (again)\\)?\\(?: [[:alpha:]]+ .+\\)?[[:blank:]]*[:：៖][[:blank:]]*\\'\\|[Pp]assword \\'")
 '(compilation-always-kill t)
 '(compilation-scroll-output 'first-error)
 '(completion-category-overrides '((bookmark (styles basic))))
 '(completion-pcm-complete-word-inserts-delimiters t)
 '(completion-show-help nil)
 '(completion-styles '(orderless partial-completion))
 '(create-lockfiles nil)
 '(current-language-environment "UTF-8")
 '(cursor-in-non-selected-windows nil)
 '(custom-file "/home/val/.config/nixpkgs/emacs/custom.el")
 '(default-frame-alist '((menu-bar-lines 0) (tool-bar-lines 0)))
 '(delete-old-versions t)
 '(dired-async-mode-lighter "")
 '(dired-create-destination-dirs 'ask)
 '(dired-dwim-target t)
 '(dired-guess-shell-alist-user
   '(("\\.\\(?:csv\\|docx?\\|od[pst]\\|pptx?\\|xlsx?\\)\\'" "setsid -f libreoffice * >/dev/null 2>&1" "libreoffice --invisible --headless --convert-to pdf * &")
     ("\\.\\(?:bmp\\|gif\\|j\\(?:fif\\|p\\(?:e?g\\)\\)\\|nef\\|png\\|t\\(?:hm\\|if\\)\\|webp\\|xpm\\)\\'" "setsid -f sxiv * >/dev/null 2>&1" "setsid -f gimp * >/dev/null 2>&1")
     ("\\.\\(?:ai\\|eps\\)\\'" "setsid -f inkscape * >/dev/null 2>&1" "setsid -f gimp * >/dev/null 2>&1")
     ("\\.\\(?:djvu\\|fb2\\)\\'" "ebook-convert ? .epub &")
     ("\\.pdf\\'" "setsid -f libreoffice * >/dev/null 2>&1" "setsid -f gimp * >/dev/null 2>&1")
     ("\\.\\(?:3gp\\|a\\(?:iff\\|vi\\)\\|fl\\(?:ac\\|v\\)\\|m\\(?:4a\\|kv\\|ov\\|p[34g]\\)\\|o\\(?:g[gv]\\|pus\\)\\|vob\\|w\\(?:av\\|ebm\\|mv\\)\\)\\'" "setsid -f mpv --force-window=yes --no-terminal * >/dev/null 2>&1" "video_duration * | format_duration" "video_duration * | awk '{s+=$1}END{print s}' | format_duration" "compress_video * &" "strip_video * &" "mediainfo ?" "mpv -vo=drm")
     ("\\.cue\\'" "setsid -f mpv --force-window=yes --no-terminal * >/dev/null 2>&1")
     ("\\.rar\\'" "temp=\"$(echo `?` | rev | cut -d. -f 2- | rev)\"; mkdir -p \"${temp}\"; unrar x ? \"${temp}\"")
     ("\\.torrent\\'" "transmission-show ?")
     ("\\.epub\\'" "ebook-convert ? .mobi &")))
 '(dired-listing-switches "-lF --si --group-directories-first")
 '(dired-ls-F-marks-symlinks t)
 '(dired-mode-hook '(dired-hide-details-mode hl-line-mode))
 '(display-time-24hr-format t)
 '(ede-project-placeholder-cache-file "/home/val/.cache/emacs/ede/projects.el")
 '(ediff-before-setup-hook
   '((lambda
       (&rest _)
       (window-configuration-to-register 119))))
 '(ediff-window-setup-function 'ediff-setup-windows-plain)
 '(eglot-autoshutdown t)
 '(eglot-confirm-server-initiated-edits nil)
 '(eglot-sync-connect nil)
 '(eldoc-minor-mode-string "")
 '(emacs-lisp-mode-hook
   '(skempo-mode hs-minor-mode outline-minor-mode form-feed-mode flymake-mode smartparens-mode))
 '(enable-recursive-minibuffers t)
 '(eval-expression-print-length t)
 '(eval-expression-print-level t)
 '(eww-bookmarks-directory "/home/val/.local/share/emacs/")
 '(eww-browse-url-new-window-is-tab nil)
 '(eww-search-prefix "https://ddg.co/lite/?q=")
 '(executable-chmod 64)
 '(fd-dired-ls-option
   '("| xargs -0 ls -ldF --si --quoting-style=literal" . "-ldhF"))
 '(fill-column 80)
 '(find-ls-option
   '("-print0 | xargs -0 ls -ldF --si --quoting-style=literal" . "-ldhF"))
 '(flymake-no-changes-timeout nil)
 '(flyspell-default-dictionary "russian")
 '(flyspell-dictionaries-that-consider-dash-as-word-delimiter '("francais" "deutsch8" "norsk" "russian"))
 '(form-feed-lighter "")
 '(gdb-many-windows t)
 '(gdb-show-main t)
 '(global-so-long-mode t)
 '(grep-files-aliases
   '(("php" . "*.php *.phtml")
     ("all" . "* .[!.]* ..?*")
     ("el" . "*.el")
     ("ch" . "*.[ch]")
     ("c" . "*.c")
     ("cc" . "*.cc *.cxx *.cpp *.C *.CC *.c++")
     ("cchh" . "*.cc *.[ch]xx *.[ch]pp *.[CHh] *.CC *.HH *.[ch]++")
     ("hh" . "*.hxx *.hpp *.[Hh] *.HH *.h++")
     ("h" . "*.h")
     ("l" . "[Cc]hange[Ll]og*")
     ("m" . "[Mm]akefile*")
     ("tex" . "*.tex")
     ("texi" . "*.texi")
     ("asm" . "*.[sS]")))
 '(history-delete-duplicates t)
 '(history-length 1000)
 '(hscroll-step 1)
 '(html-mode-hook '(emmet-mode))
 '(ibuffer-default-sorting-mode 'major-mode)
 '(ibuffer-show-empty-filter-groups nil)
 '(image-dired-db-file "/home/val/.cache/emacs/image-dired/db")
 '(image-dired-dir "/home/val/.cache/emacs/image-dired/thumbnails/")
 '(image-dired-external-viewer "sxiv")
 '(image-dired-gallery-dir "/home/val/.cache/emacs/image-dired/gallery/")
 '(image-dired-temp-image-file "/home/val/.cache/emacs/image-dired/temp")
 '(image-dired-temp-rotate-image-file "/home/val/.cache/emacs/image-dired/rotate_temp")
 '(imenu-after-jump-hook '(outline-show-after-jump))
 '(imenu-auto-rescan t)
 '(imenu-level-separator "/")
 '(imenu-space-replacement " ")
 '(imenu-use-popup-menu nil)
 '(indent-tabs-mode nil)
 '(indicate-buffer-boundaries 'left)
 '(indicate-empty-lines t)
 '(inferior-lisp-program "nix-shell -p sbcl --run sbcl")
 '(inhibit-startup-echo-area-message t)
 '(inhibit-startup-screen t)
 '(initial-frame-alist '((vertical-scroll-bars)))
 '(initial-scratch-message nil)
 '(isearch-allow-scroll t)
 '(isearch-lazy-count t)
 '(ispell-local-dictionary-alist
   '(("russian" "[А-Яа-яA-Za-z]" "[^А-Яа-яA-Za-z]" "[-]" nil
      ("-d" "ru_RU,en_US")
      "~tex" utf-8)
     ("english" "[A-Za-z]" "[^A-Za-z]" "[-']" nil nil "~tex" utf-8)))
 '(ispell-program-name "hunspell")
 '(java-mode-hook '(subword-mode))
 '(js-indent-level 2)
 '(kept-new-versions 10)
 '(kill-do-not-save-duplicates t)
 '(kill-read-only-ok t)
 '(leaf-expand-minimally t)
 '(ledger-default-date-format "%Y-%m-%d")
 '(lisp-mode-hook
   '(skempo-mode smartparens-mode form-feed-mode sly-editing-mode))
 '(magit-credential-cache-daemon-socket "/home/val/.cache/git/credential/socket")
 '(mail-user-agent 'mu4e-user-agent)
 '(marginalia-annotators '(marginalia-annotators-light marginalia-annotators-heavy) t)
 '(marginalia-mode t)
 '(max-mini-window-height 1.0)
 '(mediainfo-mode-open-method
   '("setsid" "-f" "mpv" "--force-window=yes" "--no-terminal" file-name))
 '(message-kill-buffer-on-exit t)
 '(message-send-mail-function 'message-send-mail-with-sendmail)
 '(message-subject-re-regexp
   "^[[:blank:]]*\\(?:\\(?:R\\(?:is\\|[Ee]\\)?\\)\\(?:\\[[[:digit:]]*]\\)* ?:[[:blank:]]*\\)*")
 '(minibuffer-depth-indicate-mode t)
 '(minibuffer-eldef-shorten-default t)
 '(minibuffer-electric-default-mode t)
 '(mpc-browser-tags '(file))
 '(mpc-data-directory "~/.cache/emacs/mpc")
 '(mpc-mpd-music-directory "/home/val/Music")
 '(mpc-songs-format "%-6{Time} %{file}")
 '(mu4e-attachment-dir "/home/val/Downloads")
 '(mu4e-change-filenames-when-moving t)
 '(mu4e-compose-context-policy 'always-ask)
 '(mu4e-context-policy 'pick-first)
 '(mu4e-headers-date-format "%d %b %a %R")
 '(mu4e-headers-fields '((:human-date . 16) (:flags . 6) (:from . 22) (:subject)))
 '(mu4e-headers-time-format "%16R")
 '(mu4e-headers-visible-lines 7)
 '(mu4e-modeline-max-width 100)
 '(mu4e-view-actions
   '(("capture message" . mu4e-action-capture-message)
     ("view as pdf" . mu4e-action-view-as-pdf)
     ("show this thread" . mu4e-action-show-thread)
     ("browser view" . mu4e-action-view-in-browser)))
 '(mu4e-view-attachment-assoc
   '(("jpeg" . "sxiv")
     ("jpg" . "sxiv")
     ("gif" . "sxiv")
     ("png" . "sxiv")
     ("bmp" . "sxiv")
     ("tif" . "sxiv")
     ("thm" . "sxiv")
     ("nef" . "sxiv")
     ("jfif" . "sxiv")
     ("webp" . "sxiv")
     ("csv" . "libreoffice")
     ("doc" . "libreoffice")
     ("docx" . "libreoffice")
     ("xlsx" . "libreoffice")
     ("xls" . "libreoffice")
     ("odt" . "libreoffice")
     ("ods" . "libreoffice")
     ("odp" . "libreoffice")
     ("ppt" . "libreoffice")
     ("pptx" . "libreoffice")
     ("m4a" . "mpv")
     ("mp3" . "mpv")
     ("ogg" . "mpv")
     ("opus" . "mpv")
     ("webm" . "mpv")
     ("mkv" . "mpv")
     ("mp4" . "mpv")
     ("avi" . "mpv")
     ("mpg" . "mpv")
     ("mov" . "mpv")
     ("3gp" . "mpv")
     ("vob" . "mpv")
     ("wmv" . "mpv")
     ("aiff" . "mpv")
     ("wav" . "mpv")
     ("ogv" . "mpv")
     ("flv" . "mpv")))
 '(mu4e-view-date-format "%a %d %b %Y %T")
 '(mu4e-view-show-addresses t)
 '(mu4e-view-show-images t)
 '(newsticker-automatically-mark-items-as-old nil)
 '(newsticker-automatically-mark-visited-items-as-old nil)
 '(newsticker-dir "/home/val/.cache/emacs/newsticker")
 '(newsticker-new-item-functions '(newsticker-extra-add-thumbnail))
 '(newsticker-obsolete-item-max-age 31536000)
 '(newsticker-retrieval-interval 0)
 '(newsticker-retrieval-method 'extern)
 '(newsticker-treeview-automatically-mark-displayed-items-as-old nil)
 '(newsticker-treeview-listwindow-height 6)
 '(newsticker-treeview-treewindow-width 30)
 '(newsticker-url-list
   '(("The Alternative Hypothesis Bitchute" "https://www.bitchute.com/feeds/rss/channel/thealthype" nil nil nil)
     ("The Alternative Hypothesis Website" "http://thealternativehypothesis.org/index.php/feed" nil nil nil)
     ("American Renaissance" "https://www.bitchute.com/feeds/rss/channel/amrenaissance" nil nil nil)
     ("Mouthy Buddha" "https://www.bitchute.com/feeds/rss/channel/mouthybuddha" nil nil nil)
     ("TealDeer" "https://www.bitchute.com/feeds/rss/channel/tealdeer" nil nil nil)
     ("Простая Академия" "https://www.youtube.com/feeds/videos.xml?channel_id=UC8mmPf2oKdfE2pdjqctTWUw" nil nil nil)
     ("Простые Мысли" "https://www.youtube.com/feeds/videos.xml?channel_id=UCZuRMfF5ZUHqYlKkvU12xvg" nil nil nil)
     ("Luke Smith Blog" "https://lukesmith.xyz/rss.xml" nil nil nil)
     ("Luke Smith PeerTube" "https://lukesmith.xyz/peertube" nil nil nil)
     ("Паучительные Истории" "https://www.youtube.com/feeds/videos.xml?channel_id=UC4rpWi42yPqTA0wnfx7MqOA" nil nil nil)
     ("КоверАраб" "https://www.youtube.com/feeds/videos.xml?channel_id=UCjulQNQQJmpYzI-BD1-s03w" nil nil nil)
     ("PewDiePie" "https://www.youtube.com/feeds/videos.xml?user=pewdiepie" nil nil nil)
     ("JFG Tonight" "https://www.bitchute.com/feeds/rss/channel/jfgtonight" nil nil nil)
     ("Uebermarginal" "https://www.youtube.com/feeds/videos.xml?channel_id=UCJ10M7ftQN7ylM6NaPiEB6w" nil nil nil)))
 '(newsticker-url-list-defaults nil)
 '(next-screen-context-lines 10)
 '(nov-save-place-file "/home/val/.cache/emacs/nov-places")
 '(nov-text-width 80)
 '(nsm-settings-file "/home/val/.cache/emacs/network-security.data")
 '(nxml-child-indent 4)
 '(orderless-component-separator "[[:space:]]+")
 '(orderless-matching-styles '(orderless-regexp orderless-literal orderless-prefixes))
 '(org-agenda-files '("~/org/life.org"))
 '(org-babel-load-languages '((calc . t) (emacs-lisp . t) (sql . t) (shell . t)))
 '(org-capture-templates
   '(("r" "Remember" entry
      (file+headline "~/org/life.org" "Remember")
      "* TODO %?
  SCHEDULED: %t
")))
 '(org-html-htmlize-output-type 'css)
 '(org-id-locations-file "/home/val/.cache/emacs/org/id-locations")
 '(org-log-into-drawer t)
 '(org-log-reschedule 'note)
 '(org-mode-hook '(smartparens-mode) t)
 '(org-refile-allow-creating-parent-nodes 'confirm)
 '(org-refile-targets '((org-agenda-files :level . 1)))
 '(org-refile-use-outline-path 'file)
 '(org-startup-folded t)
 '(package-archives nil)
 '(php-mode-coding-style 'php)
 '(php-mode-hook '(skempo-mode smartparens-mode subword-mode))
 '(proced-tree-flag t)
 '(project-list-file "/home/val/.cache/emacs/project.list")
 '(project-switch-commands
   '((magit-project-status "Magit" nil)
     (project-find-file "Find file" nil)
     (project-find-regexp "Find regexp" nil)
     (project-dired "Dired" nil)
     (project-vc-dir "VC-Dir" nil)
     (project-eshell "Eshell" nil)))
 '(read-buffer-completion-ignore-case t)
 '(read-file-name-completion-ignore-case t)
 '(rust-format-on-save t)
 '(safe-local-variable-values
   '((eval hl-line-mode t)
     (eval add-hook 'after-save-hook
           (lambda nil
             (byte-recompile-file
              (buffer-file-name)))
           nil t)))
 '(save-place-file "/home/val/.cache/emacs/saveplace")
 '(save-place-limit 1000)
 '(save-place-mode t)
 '(save-place-skip-check-regexp
   "\\`/\\(?:cdrom\\|floppy\\|mnt\\|\\(?:[^@/:]*@\\)?[^@/:]*[^@/:.]:\\)\\|\\`http")
 '(savehist-file "/home/val/.cache/emacs/savehist")
 '(savehist-mode t)
 '(savehist-save-hook '(savehist-filter-file-name-history))
 '(scheme-mode-hook
   '(smartparens-mode form-feed-mode geiser-mode--maybe-activate))
 '(scheme-program-name "guile")
 '(scroll-conservatively 10000)
 '(scroll-step 1)
 '(search-whitespace-regexp ".*?")
 '(selection-coding-system 'utf-8)
 '(send-mail-function 'message-send-mail-with-sendmail)
 '(sendmail-program "msmtp")
 '(sgml-basic-offset 4)
 '(sh-mode-hook '(sh-electric-here-document-mode smartparens-mode))
 '(shell-dynamic-complete-functions
   '(bash-completion-dynamic-complete comint-c-a-p-replace-by-expanded-history shell-environment-variable-completion shell-command-completion shell-c-a-p-replace-by-expanded-directory pcomplete-completions-at-point shell-filename-completion comint-filename-completion))
 '(shell-mode-hook '(ansi-color-for-comint-mode-on bash-completion-setup))
 '(shift-select-mode nil)
 '(shr-max-image-proportion 0.7)
 '(shr-use-fonts nil)
 '(size-indication-mode t)
 '(skempo-always-create-abbrev t)
 '(skempo-always-create-tag t)
 '(skempo-completing-read t)
 '(skempo-delete-duplicate-marks t)
 '(skempo-mode-lighter "")
 '(skempo-skeleton-marks-support t)
 '(skempo-update-identical-tags t)
 '(small-temporary-file-directory "/dev/shm/")
 '(sql-interactive-mode-hook '(sql-indent-enable))
 '(sql-mode-hook '(sqlup-mode sql-indent-enable smartparens-mode))
 '(sql-sqlite-options '("-column" "-header" "-cmd" "PRAGMA foreign_keys = ON;"))
 '(tab-width 4)
 '(text-mode-hook '(abbrev-mode text-mode-hook-identify))
 '(tramp-completion-reread-directory-timeout nil)
 '(tramp-default-method "ssh")
 '(tramp-persistency-file-name "/home/val/.cache/emacs/tramp/connection-history")
 '(tramp-remote-path
   '("/run/current-system/sw/bin" "~/.local/bin" tramp-own-remote-path tramp-default-remote-path "/bin" "/usr/bin" "/sbin" "/usr/sbin" "/usr/local/bin" "/usr/local/sbin" "/local/bin" "/local/freeware/bin" "/local/gnu/bin" "/usr/freeware/bin" "/usr/pkg/bin" "/usr/contrib/bin" "/opt/bin" "/opt/sbin" "/opt/local/bin"))
 '(transient-enable-popup-navigation t)
 '(transient-history-file "/home/val/.cache/emacs/transient/history.el")
 '(transient-levels-file "/home/val/.cache/emacs/transient/levels.el")
 '(transient-values-file "/home/val/.cache/emacs/transient/values.el")
 '(truncate-lines t)
 '(undo-limit 200000)
 '(undo-strong-limit 300000)
 '(uniquify-ignore-buffers-re "^\\*")
 '(url-configuration-directory "/home/val/.cache/emacs/url/")
 '(url-handler-mode t)
 '(use-dialog-box nil)
 '(user-full-name "Valeriy Litkovskyy")
 '(version-control t)
 '(web-mode-markup-indent-offset 2)
 '(wgrep-auto-save-buffer t)
 '(x-gtk-use-system-tooltips nil)
 '(x-stretch-cursor t)
 '(xref-after-jump-hook '(outline-show-after-jump recenter xref-pulse-momentarily)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
