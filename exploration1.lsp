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


;  I suppose another vector (truePrimeSet) will be set previously
;  and it will be a global vector object of booleans

(defun calcNumNotPrime(setOfOutputs) ; input is the return set of a Similar-to-Euler function
       "Determine the number of outputs from a Similar-to-Euler set that are not prime."

; Function body
(
   (defvar numNotPrime 0)

   (dotimes (i (length setOfOutputs))
    (if (elt truePrimeSet i)
        ((setq numNotPrime (1+ numNotPrime)))
      ;
   (prin1 numNotPrime)
)

)

