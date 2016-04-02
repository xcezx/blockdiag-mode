;;; blockdiag-mode-test.el --- Test for blockdiag-mode

(require 'ert)
(require 'blockdiag-mode)

(defvar blockdiag-mode-test-directory (expand-file-name "."
                                                        (if load-file-name
                                                            (file-name-directory load-file-name)
                                                          default-directory)))

(ert-deftest blockdiag-mode-test--set-auto-mode ()
  (with-temp-buffer
    (declare (debug t) (indent 1))
    (insert-file-contents (expand-file-name "sample.diag" blockdiag-mode-test-directory))
    (goto-char (point-min))
    (set-auto-mode)
    (should (equal major-mode 'blockdiag-mode))))

;;; blockdiag-mode-test.el ends here
