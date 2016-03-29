;;; blockdiag-mode-test.el --- Test for blockdiag-mode

(require 'ert)
(require 'blockdiag-mode)

(defvar blockdiag-mode-test-directory (expand-file-name "."
                                                        (if load-file-name
                                                            (file-name-directory load-file-name)
                                                          default-directory)))

(ert-deftest blockdiag-mode-test:set-auto-mode ()
  (with-temp-buffer
    (declare (debug t) (indent 1))
    (insert-file-contents (expand-file-name "sample.diag" blockdiag-mode-test-directory))
    (goto-char (point-min))
    (set-auto-mode)
    (should (equal major-mode 'blockdiag-mode))))

(defmacro blockdiag-mode-test-with-temp-buffer (contents &rest body)
  "Create `blockdiag-mode' enabled temp buffer with CONTENTS
BODY is code to be executed within the temp buffer.  Point is
always located at the beginning of buffer."
  `(with-temp-buffer
     (declare (debug t) (indent 1))
     (blockdiag-mode)
     (insert ,contents)
     (goto-char (point-min))
     ,@body))

;;; blockdiag-mode-test.el ends here
