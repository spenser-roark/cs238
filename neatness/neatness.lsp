(require 'cl)
(require 'calc)

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

;;make a vector of length 10 with all empty wires
;;(setf foowire (make-vector 10 (make-wire)))
;;(loop for i from 0 below 10
;;      do (aset foowire i (make-wire)))

;;(print-wire (aref foowire 0))

;; Represent a Boolean function of degree 3 with an 8-bit integer

(defun evaluate-Boolean-function (bfn i1 i2 i3)
  ;; we did this in class, remember?
  ;compute index from i1 i2 and i3 and go from there
  (let ((index 7))
    (not (zerop (logand 1 (lsh bfn (- index)))))))

(evaluate-Boolean-function 90 t t nil)

;(abr 90 2)


; Represent a cell as a function evaluating a Boolean function
; of degree 3. It gets its input wire values and sets the new
; value of its "output" (wire y).

(defun cell (bfn x y z)
  ;; also for you to flesh out
  (setf decimal 2)
  ;(setf decimal (two-to-ten x y z))
  

  (setcar y (nth decimal bfn))
  )

(cell (list 1 1 0 1 0 1 1 0) (list 1 nil) (list 0 nil) (list 1 nil))

(defun build-network-and-simulate-it (Boolean-function-number
				      number-of-cells
				      number-of-steps)
  ;; TODO: create number-of-cells wires
  (setf lotsofwires (make-vector 10 (make-wire)))
  (loop for i from 0 below 10
	do (aset lotsofwires i (make-wire)))

  ;; TODO: set to true the new value of the middle-most wire
    ;; (the middle of the whole array, *NOT* the middle wire of each cell)
  (aset lotsofwires 4 t)

    ;; TODO: update values to new values and show (output) all wires


    ;; TODO: iterate the next two TODOs for number-of-steps steps.

 
  (loop for i from 0 below 10
	do (setq foo i)
	)

  ;;run it through the boolean function
  ;; print the result
  
  
  ;; TODO "create a network" of cells with wires evaluating the
  ;; Boolean-function-number
  
  ;; TODO update and show wires
  
  
  ;; returns nil
  nil
  )

(build-network-and-simulate-it 1 2 5)


(defun ten-to-two (n)
    (cond ((= n 0) (list 0))
	  ((= n 1) (list 1))
	          (t (nconc (ten-to-two (truncate n 2)) (list (mod n 2)))))
  )

;(setq foo (list 1 2 3 4))

;(setcar foo 6)

;(setq bar (cons t (cons 1 nil)))
;bar
;(cons t (cons 'f (cons 'g nil)))

;(setq foo (cons t (cons 'b nil)))

;(list t 'f)


;(buffer-file-name foobar)


;buffer-file-name
