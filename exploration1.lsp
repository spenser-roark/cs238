(defun get-user-input(input)
"inline doc string"
  (interactive "sEnter a number between 1-40: ")
  (message "%d" (+ (+ (expt (string-to-number input) 2)) (string-to-number input) 41))
)
