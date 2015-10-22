
(defun calcNumNotPrime(setOfOutputs) ; input is the return set of a Similar-to-Euler function
       "Determine the number of outputs from a Similar-to-Euler set that are not prime."

; Function body
(
   (defvar numNotPrime 0)

   (dotimes (i (length setOfOutputs))
    (if (elt truePrimeSet i)
        ((setq numNotPrime (1+ numNotPrime)))
      ;
   (print numNotPrime)
)

)
