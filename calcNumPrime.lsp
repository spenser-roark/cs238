
(defun calcNumPrime(actualPrimes possiblePrimes) 
(progn
   (setq numPrime 0)

   (dotimes (i (length possiblePrimes))
     (setq pPrime (elt possiblePrimes i))
     (if (<= pPrime (length actualPrimes))
	 (if (elt actualPrimes pPrime)
	     (setq numPrime (+ numPrime 1))	     
	 )
     )
   )
   numPrime
)
)
