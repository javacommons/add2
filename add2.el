(unless (featurep 'get-feature)
  (defun get-feature (feature-name &optional url file-name)
    (if (featurep feature-name) t
      (unless url (setq url (format "https://github.com/emacs-pkg/%s/raw/main/%s.el"
                                    feature-name feature-name)))
      (unless file-name (setq file-name (format "%s.el" feature-name)))
      (let ((make-backup-files nil)
            (file-path (expand-file-name file-name user-emacs-directory)))
        (ignore-errors
          (url-copy-file url file-path 'ok-if-already-exists))
        (ignore-errors
          (load file-path nil 'nomessage))
        (featurep feature-name))))
  (get-feature 'get-feature))

(get-feature 'xprint)

(defun add2 (a b)
  (xdump (list a b))
  (+ a b)
 )

(provide 'javacommons-add2)
