;;; pcmpl-args-extra.el --- pcmpl-arg-extra          -*- lexical-binding: t; -*-

;; Copyright (C) 2021  Valeriy Litkovskyy

;; Author: Valeriy Litkovskyy <vlr.ltkvsk@protonmail.com>
;; Keywords:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; should work on remote too

;;; Code:

(require 'subr-x)
(require 'cl-seq)
(require 'pcmpl-args)

;;;; GIT FIX

(defun pcmpl-args-git-commands ()
  (pcmpl-args-cached 'git-commands t
    (with-temp-buffer
      (pcmpl-args-process-file "git" "help" "-a")
      (goto-char (point-min))
      (let ((cmds (copy-sequence pcmpl-args-git-commands)))
        (while (re-search-forward (rx bol (+ " ") (group (+ (not space)))
                                      (+ space) (group (*? any)) eol)
                                  nil t)
          (let ((cmd (match-string 1))
                (help (match-string 2)))
            (unless (assoc cmd cmds)
              (push (list cmd help) cmds))))
        (setq cmds (cl-sort cmds #'string< :key #'car))
        (pcmpl-args-completion-table-with-annotations
         cmds `(metadata (category . git-command)))))))

;;;; PASS

(defalias 'pcmpl-args-pass-commands
  (pcmpl-args-completion-table-with-annotations
   '(("cp" "Copy password or directory")
     ("edit" "Insert a new password or edit an existing password")
     ("find" "List names of passwords inside the tree that match patterns")
     ("generate" "Generate new password")
     ("git" "Execute git commands")
     ("grep" "Searches inside each decrypted password file")
     ("help" "Show usage message")
     ("init" "Initialize new password storage")
     ("insert" "Insert a new password into the password store")
     ("ls" "List names of passwords")
     ("mv" "Move password or directory")
     ("rm" "Remove password or directory")
     ("show" "Decrypt and print a password")
     ("version" "Show version information"))))

(defun pcmpl-args-pass-prefix ()
  (let ((directory (or (getenv "PASSWORD_STORE_DIR")
                       (expand-file-name "~/.password-store"))))
    (concat directory "/")))

(defun pcmpl-args-pass-entry-from-path (prefix path)
  (thread-last path
    (string-remove-prefix prefix)
    (string-remove-suffix ".gpg")))

(defun pcmpl-args-pass-find (&rest find-args)
  (let* ((prefix (pcmpl-args-pass-prefix))
         (args `("find" "-L" ,prefix
                 "(" "-name" ".git*" "-o" "-name" ".gpg-id" ")" "-prune"
                 "-o" ,@find-args "-print"))
         (paths (cdr (apply #'process-lines args)))
         (entry-from-path (apply-partially 'pcmpl-args-pass-entry-from-path prefix)))
    (sort (mapcar entry-from-path paths) #'string<)))

(defun pcmpl-args-pass-keys (args)
  (thread-first
      (thread-last (process-lines "gpg2" "--list-secret-keys" "--with-colons")
        (mapcar (lambda (key) (elt (split-string key ":") 9)))
        (delete ""))
    (cl-delete-duplicates :test 'string=)
    (sort 'string<)
    (cl-set-difference (cadr (assq '* args)) :test #'string=)))

(defun pcmpl-args-pass-command-specs (cmd)
  (pcase cmd
    ("edit"
     (list
      '((argument 0 (("PASSNAME" (:eval (pcmpl-args-pass-find "-type" "f"))))))))

    ("find"
     (list
      '((argument * (("PATTERN" none))))))

    ("generate"
     (list
      '((option "-n, --no-symbols" :help "Use only alphanumeric characters")
        (option "-c, --clip" :help "Copy the password to the clipboard")
        (option "-i, --in-place" :help "Only replace the first line of the password file")
        (option "-f, --force" :help "Don't prompt before overwriting an existing password")
        (argument 0 (("PASSNAME" (:eval (pcmpl-args-pass-find)))))
        (argument 1 (("PASSLENGTH" none))))))

    ((or "git" "grep")
     (list
      '((argument 0 (("CMDOPTS" none))
                  :subparser
                  (lambda (args specs seen)
                    (push (plist-get (pop seen) :stub) args)
                    (pcmpl-args-command-subparser args specs seen))))))

    ("init"
     (list
      '((option "-p, --path=SUBFOLDER" (("SUBFOLDER" (:eval (pcmpl-args-pass-find "-type" "d"))))
                :help "GPGIDs are assigned for that specific SUBFOLDER of the store")
        (argument * (("GPGID" (:lambda pcmpl-args-pass-keys)))))))

    ("insert"
     (list
      '((option "-e, --echo" :help "Enable keyboard echo and don't confirm the password")
        (option "-m, --multiline" :help "Read lines until EOF or Ctrl+D is reached")
        (option "-f, --force" :help "Don't prompt before overwriting an existing password")
        (argument 0 (("PASSNAME" (:eval (pcmpl-args-pass-find))))))))

    ("ls"
     (list
      '((argument 0 (("SUBFOLDER" (:eval (pcmpl-args-pass-find "-type" "d"))))))))

    ("rm"
     (list
      '((option "-r, --recursive" :help "Delete PASSNAME recursively if it is a directory")
        (option "-f, --force" :help "Do not interactively prompt before removal")
        (argument 0 (("PASSNAME" (:eval (pcmpl-args-pass-find))))))))

    ("show"
     (list
      '((option "-c[LINENUMBER], --clip[=LINENUMBER]" (("LINENUMBER" none))
                :help "Copy the first (or specified) line to the clipboard")
        (option "-q[LINENUMBER], --qrcode[=LINENUMBER]" (("LINENUMBER" none))
                :help "Display a QR code of the first (or specified) line")
        (argument 0 (("PASSNAME" (:eval (pcmpl-args-pass-find "-type" "f"))))))))

    ((or "cp" "mv")
     (list
      '((option "-f, --force" :help "Silently overwrite NEWPATH if it exists")
        (argument 0 (("OLDPATH" (:eval (pcmpl-args-pass-find)))))
        (argument 1 (("NEWPATH" (:eval (pcmpl-args-pass-find))))))))))

(defun pcomplete/pass ()
  (pcmpl-args-pcomplete
   (pcmpl-args-make-argspecs
    '((argument 0 (("OPTIONS" nil))
                :subparser
                (lambda (arguments argspecs seen)
                  (let ((command (pop arguments)))
                    (push (list :name 0
                                :stub command
                                :values (list command)
                                :action '("COMMAND" pcmpl-args-pass-commands))
                          seen)
                    (when arguments
                      (let ((specs (pcmpl-args-pass-command-specs command)))
                        (setq argspecs (apply 'pcmpl-args-make-argspecs specs)))))
                  (list arguments argspecs seen)))))))

;;;; PARTED

(defalias 'pcmpl-args-parted-alignment-type
  (pcmpl-args-completion-table-with-annotations
   '(("none" "Use the minimum alignment allowed by the disk type")
     ("cylinder" "Align partitions to cylinders")
     ("minimal" "Use minimum alignment as given by the disk  topology  information")
     ("optimal" "Use optimum alignment as given by the disk  topology  information"))))

(defalias 'pcmpl-args-parted-commands
  (pcmpl-args-completion-table-with-annotations
   '(("disk_set" "Changes a flag on the disk")
     ("help" "Print general help, or help on command")
     ("align-check" "Check if partition satisfies the alignment constraint")
     ("mklabel" "Create a new disklabel (partition table)")
     ("mkpart" "Create a new partition")
     ("name" "Set the name of partition to name")
     ("print" "Display the partition table")
     ("rescue" "Rescue a lost partition")
     ("resizepart" "Change the end position of partition")
     ("rm" "Delete partition")
     ("select" "Choose device as the current device to edit")
     ("set" "Change the state of the flag on partition")
     ("unit" "Set unit as the unit to use")
     ("toggle" "Toggle the state of flag on partition")
     ("version" "Display version information and a copyright message"))))

(defun pcmpl-args-parted-block-devices ()
  (pcmpl-args-cached 'parted-block-devices 60
    (with-temp-buffer
      (call-process "sudo" nil t nil "-A" "parted" "--list" "--machine")
      (goto-char (point-min))
      (save-match-data
        (cl-loop do (forward-line)
                 for beg = (point)
                 for end = (1- (search-forward ":"))
                 collect (buffer-substring beg end)
                 while (and (search-forward "\n\n") (not (eobp))))))))

(defun pcmpl-args-parted-partitions (device)
  (pcmpl-args-cached 'parted-partitions 60
    (with-temp-buffer
      (call-process "sudo" nil t nil "-A" "parted" "--machine" device "print")
      (goto-char (point-min))
      (forward-line 2)
      (save-match-data
        (cl-loop
         until (eobp)
         for params = (split-string (substring (thing-at-point 'line) 0 -2) ":")
         for (number . rest) = params
         collect (list number (apply 'format "%s - %s = %s [ %s | %s | %s ]" rest))
         do (forward-line))))))

(defun pcmpl-args-parted-partitions-completion-table (device)
  (pcmpl-args-completion-table-with-annotations
   (pcmpl-args-parted-partitions device)))

(defun pcmpl-args-parted-partition-table (device)
  (pcmpl-args-cached 'parted-partition-table 60
    (with-temp-buffer
      (call-process "sudo" nil t nil "-A" "parted" "--machine" device "print")
      (goto-char (point-min))
      (forward-line)
      (let ((beg (search-forward ":" nil nil 5))
            (end (1- (search-forward ":"))))
        (buffer-substring beg end)))))

(defun pcmpl-args-parted-disk-flags (device)
  (pcmpl-args-cached 'parted-disk-flags 60
    (with-temp-buffer
      (call-process "sudo" nil t nil "-A" "parted" "--machine" device "print")
      (goto-char (point-min))
      (forward-line)
      (let ((beg (search-forward ":" nil nil 7))
            (end (1- (search-forward ";"))))
        (if (/= beg end)
            (split-string (buffer-substring beg end) "," nil " ")
          (ignore (message "No disk flags!")))))))

(defvar pcmpl-args-parted-flags
  (map-into
   '(("bios_grub" . "selected partition is a GRUB BIOS partition")
     ("legacy_boot" . "tell special purpose software that the partition may be bootable")
     ("boot" . "enable to boot off the partition")
     ("msftdata" . "partition contain Microsoft filesystems (NTFS or FAT)")
     ("msftres" . "Microsoft Reserved partition, which is used by Windows (NTFS or FAT)")
     ("irst" . "Intel Rapid Start Technology partition")
     ("esp" . "UEFI System Partition. On GPT it is an alias for boot")
     ("lba" . "use Linear (LBA) mode")
     ("root" . "partition is the root device to be used by Linux")
     ("swap" . "partition is the swap device to be used by Linux")
     ("hidden" . "hide partitions from Microsoft operating systems")
     ("raid" . "tell linux the partition is a software RAID partition")
     ("lvm" . "tell linux the partition is a physical volume")
     ("palo" . "partition can be used by the Linux/PA-RISC boot loader, palo")
     ("prep" . "partition can be used as a PReP boot partition on PowerPC PReP or IBM RS6K/CHRP hardware")
     ("diag" . "partition can be used as a diagnostics / recovery partition"))
   'hash-table))

(defun pcmpl-args-parted-flags (device)
  (pcmpl-args-completion-table-with-annotations
   (mapcar
    (lambda (flag)
      (list flag (gethash flag pcmpl-args-parted-flags)))
    (pcase (pcmpl-args-parted-partition-table device)
      ("gpt"
       '("bios_grub" "legacy_boot" "msftdata" "msftres" "irst" "esp" "prep"))
      ("msdos"
       '("boot" "msftres" "irst" "esp" "lba" "raid" "lvm" "palo" "prep" "diag" "hidden"))
      ("mac"
       '("boot" "root" "swap"))
      ("pc98"
       '("boot" "hidden"))))))

(defalias 'pcmpl-args-parted-units
  (pcmpl-args-completion-table-with-annotations
   '(("s" "sector (n bytes depending on the sector size, often 512)")
     ("B" "byte")
     ("KiB" "kibibyte (1024 bytes)")
     ("MiB" "mebibyte (1048576 bytes)")
     ("GiB" "gibibyte (1073741824 bytes)")
     ("TiB" "tebibyte (1099511627776 bytes)")
     ("kB" "kilobyte (1000 bytes)")
     ("MB" "megabyte (1000000 bytes)")
     ("GB" "gigabyte (1000000000 bytes)")
     ("TB" "terabyte (1000000000000 bytes)")
     ("%" "percentage of the device (between 0 and 100)")
     ("cyl" "cylinders (related to the BIOS CHS geometry)")
     ("chs" "cylinders, heads, sectors addressing (related to the BIOS CHS geometry)")
     ("compact" "megabytes for input, compact human readable for output"))))

(defun pcmpl-args-parted-command-specs (command device)
  (let ((cmd-specs
         (pcase command
           ("disk_set"
            `((argument 0 (("DISK_FLAG" (:eval (pcmpl-args-parted-disk-flags ,device)))))
              (argument 1 (("STATE" (:eval (list "on" "off")))))))

           ("help"
            '((argument 0 (("PARTED_COMMAND" pcmpl-args-parted-commands)))))

           ("align-check"
            `((argument 0 (("TYPE" (:eval (list "minimal" "optimal")))))
              (argument 1 (("PARTITION" (:eval (pcmpl-args-parted-partitions-completion-table ,device)))))))

           ("mklabel"
            '((argument 0 (("LABEL_TYPE" (:eval (list "aix" "amiga" "bsd" "dvh" "gpt"
                                                      "loop" "mac" "msdos" "pc98"
                                                      "sun")))))))

           ("mkpart"
            (let ((fs-types '(list "btrfs" "ext2" "ext3" "ext4" "fat16" "fat32" "hfs"
                                   "hfs+" "linux-swap" "ntfs" "reiserfs" "udf" "xfs")))
              (pcase (pcmpl-args-parted-partition-table device)
                ((or "msdos" "dvh")
                 `((argument 0 (("PART_TYPE" (:eval (list "primary" "logical" "extended")))))
                   (argument 1 (("NAME" none)))
                   (argument 2 (("FS_TYPE" (:eval ,fs-types))))
                   (argument 3 (("START" none)))
                   (argument 4 (("END" none)))))
                ("sun"
                 `((argument 0 (("FS_TYPE" (:eval ,fs-types))))
                   (argument 1 (("START" none)))
                   (argument 2 (("END" none)))))
                (_
                 `((argument 0 (("NAME" none)))
                   (argument 1 (("FS_TYPE" (:eval ,fs-types))))
                   (argument 2 (("START" none)))
                   (argument 3 (("END" none))))))))

           ("name"
            (pcase (pcmpl-args-parted-partition-table device)
              ((or "gpt" "mac" "pc98")
               `((argument 0 (("PARTITION" (:eval (pcmpl-args-parted-partitions-completion-table ,device)))))
                 (argument 1 (("NAME" none)))))))

           ("print"
            (let ((completion-table
                   (pcmpl-args-completion-table-with-annotations
                    `(("devices"   "all active block devices")
                      ("free"      "free unpartitioned space")
                      ("list" "partition tables of all active block devices")
                      ("all" "partition tables of all active block devices")
                      . ,(pcmpl-args-parted-partitions device)))))
              `((argument 0 (("PRINTOPTS" (:eval ,completion-table)))))))

           ("rescue"
            '((argument 0 (("START" none)))
              (argument 1 (("END" none)))))

           ("resizepart"
            `((argument 0 (("PARTITION" (:eval (pcmpl-args-parted-partitions-completion-table ,device)))))
              (argument 1 (("END" none)))))

           ("rm"
            `((argument 0 (("PARTITION" (:eval (pcmpl-args-parted-partitions-completion-table ,device)))))))

           ("select"
            '((argument 0 (("DEVICE" (:eval (pcmpl-args-parted-block-devices)))))))

           ("set"
            `((argument 0 (("PARTITION" (:eval (pcmpl-args-parted-partitions-completion-table ,device)))))
              (argument 1 (("FLAG" (:eval (pcmpl-args-parted-flags ,device)))))
              (argument 2 (("STATE" (:eval (list "on" "off")))))))

           ("unit"
            '((argument 0 (("UNIT" pcmpl-args-parted-units)))))

           ("toggle"
            `((argument 0 (("PARTITION" (:eval (pcmpl-args-parted-partitions-completion-table ,device)))))
              (argument 1 (("FLAG" (:eval (pcmpl-args-parted-flags ,device))))))))))
    (append
     cmd-specs
     '((argument 10 (("COMMAND" nil)) :subparser pcmpl-args-parted-subparser)))))

(defun pcmpl-args-parted-subparser (arguments argspecs seen)
  (let ((command (pop arguments)))
    (push (list :name 'command
                :stub command
                :values (list command)
                :action '("COMMAND" pcmpl-args-parted-commands))
          seen)

    (when arguments
      (let* ((by-name (lambda (a) (plist-get a :name)))
             (device
              (thread-first 0
                (cl-find seen :test #'equal :key by-name :from-end t)
                (plist-get :values)
                car)))
        (setq argspecs
              (pcmpl-args-make-argspecs
               (pcmpl-args-parted-command-specs command device))))))
  (list arguments argspecs seen))

(defun pcomplete/parted ()
  (pcmpl-args-pcomplete
   (pcmpl-args-make-argspecs
    '((option "-h, --help" :help "displays a help message")
      (option "-l, --list" :help "lists partition layout on all block devices")
      (option "-m, --machine" :help "displays machine parseable output")
      (option "-s, --script" :help "never prompts for user intervention")
      (option "-v, --version" :help "displays the version")
      (option "-a ALIGNMENT_TYPE, --align ALIGNMENT_TYPE"
              (("ALIGNMENT_TYPE" pcmpl-args-parted-alignment-type))
              :help "Set alignment for newly created partitions")
      (argument 0 (("DEVICE" (:eval (pcmpl-args-parted-block-devices)))))
      (argument 1 (("COMMAND" nil)) :subparser pcmpl-args-parted-subparser)))))

;;; PROVIDE

(provide 'pcmpl-args-extra)
;;; pcmpl-args-extra.el ends here
