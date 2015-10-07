(defun get-user-input(input)
"inline doc string"
  (interactive "sEnter a number between 1-40: ")
  (message "%d" (+ (+ (expt (string-to-number input) 2)) (string-to-number input) 41))
)



(defun getPrimes () "getprimes"
       (
	(setq v (make-vector 1000 t)) print v
	(setq i 2)
	(while (< i (length v))
	  (setq curVal (elt v i))
	  (setq j 2)
	  (while (< j (length v))
	    (setq notPrime (* curVal (elt v j)))
	    (if (< notPrime (length v)) (aset v notPrime nil))
	    (setq j (+ j 1))
	    )
	  (setq i (+ i 1))
	  )
	v
	)
       )
