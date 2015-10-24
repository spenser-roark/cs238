
(defun main()
(progn
(require 'cl)
"this function will load and run exploration 1"
(load "~/git/cs238/getPrimes.lsp")
(load "~/git/cs238/eulerFunction.lsp")
(load "~/git/cs238/getUserInput.lsp")
(load "~/git/cs238/calcNumPrime.lsp")
(print "functions loaded")

; run getPrimes method to get a bool-vector of prime numbers
(print "getting primes")
(setq range 100)
(setq sqRange (sqrt range))
(setq actualPrimes (getPrimes range))
(print "got primes")

; count the number of primes in the actualPrimes list


; run the euler-like function to get a list of possible primes
(print "running euler")
(setq bestC 0)
(setq sweetestRatio 0.0)
(dotimes (c sqRange)
  (print "running for c=")
  (print c)
  ; keep track of the number the eurler function got wrong and right
  (setq right 0)
  (setq wrong 0)
  ; this list will be filled with all of the values found by the euler function
  (setq possiblePrimes (make-list 0 0))
  ; for 0 to 100
  (dotimes (x sqRange)
    ; get the euler function's absolute value for x and c
    (setq value (abs (euler x c)))
    ; check to see if this value has already been found
    (setq found (find value possiblePrimes))
    (if (not found)
	; if this value has not been found, add it to the possible primes list
	( 
	 (setq junklist (list 1 value))
	 (setq possiblePrimes (append junklist possiblePrimes))
	 ; then check to see if it is a correct prime
         (if (elt actualPrimes value)
	   (setq right (+ correct 1)) ; if true
	   (setq wrong (+ wrong 1))   ; if false
	 )
	)
    )
  )
  ; check the sweetness here
  ; we will define sweetness as how many primes were found over the range
  (setq posSweet (/ right range))
  (if (> posSweet sweetestRatio)
      (
       (setq bestC (c))
       (setq sweetestRatio (posSweet))
      )
  )
)
	  
    
)
)


(main)
