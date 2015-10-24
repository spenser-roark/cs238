(require 'cl)


(defun euler(x c)
  (progn
    (setq val (+ (* x x) c))
    val
  )
)


;(defun get-user-input (a x y)
 ; "Find primes yo"

  ;(setq primes '())
  ;(setq input x)
  ;(while (< x y)
   ; (print (+ (+ (expt x 2) x) a))

    ;(setq x (+ x 1))
    ;)
  ;)

;(get-user-input 41 -4 4)

;(defun a (n)
;(cond ((= n 0) 1)
 ;     ((= n 1) 3)
  ;    ((= n 2) 2)
   ;   (t (+ (* 2 (a (1- n))) (a (- n 2)) (* -2 (a (- n 3))))))
