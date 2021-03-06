(require 'cl)
(require 'calc)
(require 'calc-bin)

(defun get-wire-value (w)
  (car w)
  )

(defvar *use-1-and-0* t
  "Use 1 and 0 to show a wire's value, if t (the default);
   otherwise use a * and a blank."
)

; Represent a wire as a cons cell storing t or nil, 
; the car holding the "current" value, the cdr holding the "new" value

(defun make-wire ()
  (cons nil nil))

(defun set-value (w value) (setcar w value))

(defun set-new-value (w value) (setcdr w value))

(defun print-wire (w)
  (let ((val (get-wire-value w)))
    (princ (if *use-1-and-0*
	       (if val "1" "0")
	     (if val "*" " ")))))

(defun num-to-bool (decimal)
  (let (bool (list))
    (dotimes (number 8 bool)
      (setq bool (cons (mod decimal 2) bool))
      (setq decimal (/ decimal 2)))))

;; Represent a Boolean function of degree 3 with an 8-bit integer

(defun evaluate-Boolean-function (bfn i1 i2 i3)
  (let* ((index 0) ;; 111
	 (index (logior index (if i1 1 0)))
	 (index (logior index (if i2 2 0)))
	 (index (logior index (if i3 4 0))))
    (not (zerop (logand (lsh bfn (- index)) 1))))
;;  (let ((index 7))
  ;;  (not (zerop (logand 1 (lsh bfn (- index))))))
  )

(evaluate-Boolean-function 90 t t t)


;(abr 90 2)


; Represent a cell as a function evaluating a Boolean function
; of degree 3. It gets its input wire values and sets the new
; value of its "output" (wire y).

(defun cell (bfn x y z)
  (setcdr y (evaluate-Boolean-function bfn (car z) (car y) (car x)))
  )

(defun build-network-and-simulate-it (Boolean-function-number
				      number-of-cells
				      number-of-steps)
  (setq *use-1-and-0* nil)
  (let* ((wires (make-vector (+ number-of-cells 1) nil)))
    (loop for i from 0 to number-of-cells
	  do (aset wires i (make-wire)))

    (setcar (aref wires (/ number-of-cells 2)) t)

    (dotimes (k (+ number-of-cells 1))
      (print-wire (aref wires k))
      (princ "\n")

      (loop for i from 0 to number-of-steps
	    do (loop for j from 1 to number-of-cells
		     do (setcdr (aref wires j)
				(cell Boolean-function-number
				      (aref wires (- j 1))
				      (aref wires j)
				      (aref wires (mod (+ j 1) number-of-cells)))))
      
	    do (loop for w across wires
		     do (setcar w (cdr w))
		     (print-wire w))
	    do (princ "\n")))))


;; one example lots of triangles and junk
;;(build-network-and-simulate-it 1234 20 1)

;; another one, just play around with it
;;(build-network-and-simulate-it 1353 50 10)

(defun ten-to-two (n)
    (cond ((= n 0) (list 0))
	  ((= n 1) (list 1))
	          (t (nconc (ten-to-two (truncate n 2)) (list (mod n 2)))))
  )
