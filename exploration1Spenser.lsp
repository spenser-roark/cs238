
(defun main()
(progn
(require 'cl)
"this function will load and run exploration 1"
(load "/home/spenser/programs/school/238/getPrimes.lsp")
(load "/home/spenser/programs/school/238/eulerFunction.lsp")
(load "/home/spenser/programs/school/238/getUserInput.lsp")
(load "/home/spenser/programs/school/238/calcNumPrime.lsp")
(print "functions loaded")

; run getPrimes method to get a bool-vector of prime numbers
(print "getting primes")
(setq range 10000)
(setq sqRange (sqrt range))
(setq actualPrimes (getPrimes range))
(print "got primes")

; count the number of primes in the actualPrimes list

  ; keep track of the number the eurler function got wrong and right
(setq right 0)
(setq wrong 0)

; run the euler-like function to get a list of possible primes
(print "running euler")
(setq bestC -1)
(setq sweetestRatio -1.0)
(dotimes (c sqRange)

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
    (setq found (find '(value) possiblePrimes))
    (unless found
      ; if this value has not been found, add it to the possible primes list
      (setq junklist (make-list 1 value))
      (setq possiblePrimes (append junklist possiblePrimes))

	 ; then check to see if it is a correct prime
         (if (elt actualPrimes value)
	   (setq right (+ right 1)) ; if true
	   (setq wrong (+ wrong 1))   ; if false
	 )
    )
  )
  ; check the sweetness here
  ; we will define sweetness as how many primes were found 
  ; over the total given primes

(print "")
(print "right")
(print right)
(print "wrong")
(print wrong)
(print "bestC")
(print bestC)
(print "c")
(print c)
(print "sweetestRatio")
(print sweetestRatio)

  (if (> right sweetestRatio)
      (progn 
	(print "new best c")
       (setq bestC c)
       (setq sweetestRatio right)
      )
  )
)
	 
(print "the best c was")
(print bestC)
(print "the number of primes found was")
(print sweetestRatio)
(print "The bestC was")
(print bestC)
    bestC
)
)

(print (main))