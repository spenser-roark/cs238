(reduce (lambda (x y) (+ (* 2 x) y)) '(1 0 1 1))

(defvar aList (list 1 0 0 1 1))

(defun bin-to-dec (l)
  (reduce (lambda (x y) (+ (* 2 x) y)) (l))
)

(bin-to-dec aList)
