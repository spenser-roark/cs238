(require 'cl)
(require 'calc)

(setq eval-expression-print-level 5 eval-expression-print-length 100)

(setq a 3 b 4 c 16 d 13 e 1 f 9 g 11 h 2 i 8 j 10 k 7 l 15 m 5 n 12 o 14 p 6)

; a list of a number followed by two lists represents a node with a
; value and two children, which are also nodes represented as a list
; of a number value followed by two lists.

(setq ab (list 0 (list a nil nil) (list b nil nil))
      cd (list 0 (list c nil nil) (list d nil nil))
      ef (list 0 (list e nil nil) (list f nil nil))
      gh (list 0 (list g nil nil) (list h nil nil))
      ij (list 0 (list i nil nil) (list j nil nil))
      kl (list 0 (list k nil nil) (list l nil nil))
      mn (list 0 (list m nil nil) (list n nil nil))
      op (list 0 (list o nil nil) (list p nil nil))
      abcd (list 0 ab cd)
      efgh (list 0 ef gh)
      ijkl (list 0 ij kl)
      mnop (list 0 mn op)
      abcdefgh (list 0 abcd efgh)
      ijklmnop (list 0 ijkl  mnop)
      abcdefghijklmnop (list 0 abcdefgh ijklmnop))

;(setcar (get-left-child abcd) (list 4))

;(nbutlast (get-left-child abcd) 0)

;(butlast (get-left-child abcd) 2)

(setq tree abcdefghijklmnop)
(setq anus tree)
(setcar (get-left-child (get-left-child (get-left-child (nthcdr 0 anus)))) (list 4))
(get-left-child (get-left-child (get-left-child (nthcdr 0 anus))))

(setq sample-list tree)

;(setcdr (get-left-child (get-left-child (get-left-child (nth 1 sample-list)))) (list nil nil))

;(setcdr (get-left-child abcd) (list 4))
;(setcdr (get-left-child abcd) 4)

ab ; => (0 (3 nil nil) (4 nil nil))
cd ; => (0 (16 nil nil) (12 nil nil))
ef ; => (0 (1 nil nil) (9 nil nil))
gh ; => (0 (11 nil nil) (2 nil nil))
ij ; => (0 (8 nil nil) (10 nil nil))
kl ; => (0 (7 nil nil) (15 nil nil))
mn ; => (0 (5 nil nil) (12 nil nil))
op ; => (0 (14 nil nil) (6 nil nil))
abcd ; => (0 (0 (3 nil nil) (4 nil nil)) (0 (16 nil nil) (12 nil nil)))
efgh ; => (0 (0 (1 nil nil) (9 nil nil)) (0 (11 nil nil) (2 nil nil)))
ijkl ; => (0 (0 (8 nil nil) (10 nil nil)) (0 (7 nil nil) (15 nil nil)))
mnop ; => (0 (0 (5 nil nil) (12 nil nil)) (0 (14 nil nil) (6 nil nil)))
abcdefgh ; => (0 (0 (0 (3 nil nil) (4 nil nil)) (0 (16 nil nil) (12 nil nil))) (0 (0 (1 nil nil) (9 nil nil)) (0 (11 nil nil) (2 nil nil))))
ijklmnop ; => (0 (0 (0 (8 nil nil) (10 nil nil)) (0 (7 nil nil) (15 nil nil))) (0 (0 (5 nil nil) (12 nil nil)) (0 (14 nil nil) (6 nil nil))))
abcdefghijklmnop ; => (0 (0 (0 (0 (3 nil nil) (4 nil nil)) (0 (16 nil nil) (13 nil nil))) (0 (0 (1 nil nil) (9 nil nil)) (0 (11 nil nil) (2 nil nil)))) (0 (0 (0 (8 nil nil) (10 nil nil)) (0 (7 nil nil) (15 nil nil))) (0 (0 (5 nil nil) (12 nil nil)) (0 (14 nil nil) (6 nil nil)))))

(defun get-value (node)
  (and (listp node)  (first node)))

(defun set-value (node new-value)
  (and (listp node) 
       (numberp (first node)) (setf (first node) new-value)))

(defun get-left-child (node)
  (and (listp node)  (second node)))

(defun get-right-child (node)
  (and (listp node)  (third node)))

(defun get-biggest-leaf (node)
  (setq left (nth 0 (get-left-child node)))
  (setq right (nth 0 (get-right-child node)))
  (if (not (get-left-child node)) nil
    (if (< left right) (get-right-child node) (get-left-child node))
    )
  )

(defun get-smallest-leaf (node)
  (setq left (nth 0 (get-left-child node)))
  (setq right (nth 0 (get-right-child node)))
  
  (if (not (get-left-child node)) nil
    (if (> left right) (get-right-child node) (get-left-child node))
    )
  )

(defun get-node-from-tree (tree order)
  (if (string= order "big")
      (while (get-biggest-leaf tree)
	(setq tree (get-biggest-leaf tree))
	)
    
    (while (get-smallest-leaf tree)
      (setq tree (get-smallest-leaf tree))
      )
    )
  tree
  )

;(defun tournament-sort (tree order)
 ;   (get-node-from-tree tree order)
;
 ;   )

;(defun determine-winner (tree order)
 ; (while 
  ;)

; terminate when root has value
; add to list, set value to smallest num, reset and go again
  ; terminate completely when root > 0
  (defun test (tree order)
					;   (while (> (get-value tree) 0)
    ; This works, but there has to be a better way
; (setcar (nthcdr 1 abcd) (list 4))

      (setq foo tree)
      (setq bar (get-left-child foo))
      (setq one 1)
	(while (get-left-child bar)
	  (setq foo (get-left-child foo))
	  (setq bar (get-left-child foo))
	  ;left children are 1s
	  )

	;keep the one above, if left has 3

	; right children are 2s
	(setq bar (get-right-child foo))
	;(setq bar (get-left-child bar))

	(if (get-left-child bar) (setq foo (get-right-child foo)))
	(setq bar (get-left-child bar))
	(while (get-left-child bar)
	  (setq foo (get-left-child foo))
	  (setq bar (get-right-child foo))
	    )
	
     
    (if (string= order "big")
	  (set-value foo (if (> (get-value (get-left-child foo)) (get-value (get-right-child foo))) (get-value (get-left-child foo)) (get-value (get-right-child foo))))
	
	(set-value foo (if (< (get-value (get-left-child foo)) (get-value (get-right-child foo))) (get-value (get-left-child foo)) (get-value (get-right-child foo))))
	)
					;      )
      
    foo
    )

(test tree "small")

;(setcdr (first foo) (list 4))
;(setcar (nthcdr 0 foo) 4)

;(get-value (test tree))
  
;  (tournament-sort tree "big")

(get-node-from-tree tree "big")

(get-left-child ab) ; => (3 nil nil)
(get-right-child ab) ; => (4 nil nil)
(get-left-child abcd) ; => (0 (3 nil nil) (4 nil nil))
(get-right-child abcd) ; => (0 (16 nil nil) (12 nil nil))
(get-left-child abcdefgh) ; => (0 (0 (3 nil nil) (4 nil nil)) (0 (16 nil nil) (12 nil nil)))
(get-right-child abcdefgh) ; => (0 (0 (1 nil nil) (9 nil nil)) (0 (11 nil nil) (2 nil nil)))

(setq lefttest (list 0 (list 9) (list 11) ))

;(setq middletest (list 0 (list 16) lefttest))
(setq middletest (list (list 16) ijklmnop))
(test middletest "big")

middletest





