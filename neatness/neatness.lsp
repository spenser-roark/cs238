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

(defun print-wire (w)
  (let ((val (get-wire-value w)))
    (princ (if *use-1-and-0*
	       (if val "1" "0")
	     (if val "*" " ")))))

; Represent a Boolean function of degree 3 with an 8-bit integer

(defun evaluate-Boolean-function (bfn i1 i2 i3)
  ;; we did this in class, remember?
  )

; Represent a cell as a function evaluating a Boolean function
; of degree 3. It gets its input wire values and sets the new
; value of its "output" (wire y).

(defun cell (bfn x y z)
  ;; also for you to flesh out
  )

(defun build-network-and-simulate-it (Boolean-function-number
				      number-of-cells
				      number-of-steps)
  ;; TODO: create number-of-cells wires

    ;; TODO: set to true the new value of the middle-most wire
    ;; (the middle of the whole array, *NOT* the middle wire of each cell)


    ;; TODO: update values to new values and show (output) all wires


    ;; TODO: iterate the next two TODOs for number-of-steps steps.

	  ;; TODO "create a network" of cells with wires evaluating the
	  ;; Boolean-function-number

	  ;; TODO update and show wires

)

(defun ten-to-two (n)
    (cond ((= n 0) (list 0))
	  ((= n 1) (list 1))
	          (t (nconc (ten-to-two (truncate n 2)) (list (mod n 2)))))
  )

(ten-to-two 8)

(setq foo (list 1 2 3 4))
(setq bar (cons t (cons 1 nil)))
bar
(cons t (cons 'f (cons 'g nil)))

(setq foo (cons t (cons 'b nil)))

(list t 'f)

(buffer-file-name foobar)


buffer-file-name
