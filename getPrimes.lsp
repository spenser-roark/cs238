;; This buffer is for notes you don't want to save, and for Lisp evaluation.
;; If you want to create a file, visit that file with C-x C-f,
;; then enter the text in that file's own buffer.
(require 'cl)
(defun getPrimes (len)
  (let ((v (make-bool-vector len t)))
   (progn
    (loop for i from 2 to (- (length v) 1)
	do(loop for j from i to (- (length v) 1)
	   do(let ((notPrime (* i j)))
	       (if (< notPrime (length v)) 
		   (aset v notPrime nil)))))
    v)))

;(let ((v (getPrimes 100)))
;  (print (loop for i from 1 to (- (length v) 1)
;	       collect (list i (elt v i)))))

;(let ((v (make-bool-vector 100 t)))
;  (print (loop for i from 1 to (length v)
;	       collect (list i (elt v (1- i))))))











