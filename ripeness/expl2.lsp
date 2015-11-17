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

(setq tree abcdefghijklmnop)

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
abcdefghijklmnop ; => (0 (0 (0 (0 (3 nil nil) (4 nil nil)) (0 (16 nil nil) (12 nil nil))) (0 (0 (1 nil nil) (9 nil nil)) (0 (11 nil nil) (2 nil nil)))) (0 (0 (0 (8 nil nil) (10 nil nil)) (0 (7 nil nil) (15 nil nil))) (0 (0 (5 nil nil) (12 nil nil)) (0 (14 nil nil) (6 nil nil)))))

(defun get-value (node)
  (and (listp node) (= (length node) 3) (first node)))

(defun set-value (node new-value)
  (and (listp node) (= (length node) 3)
       (numberp (first node)) (setf (first node) new-value)))

(defun get-left-child (node)
  (and (listp node) (= (length node) 3) (second node)))

(defun get-right-child (node)
  (and (listp node) (= (length node) 3) (third node)))

(get-left-child ab) ; => (3 nil nil)
(get-right-child ab) ; => (4 nil nil)
(get-left-child abcd) ; => (0 (3 nil nil) (4 nil nil))
(get-right-child abcd) ; => (0 (16 nil nil) (12 nil nil))
(get-left-child abcdefgh) ; => (0 (0 (3 nil nil) (4 nil nil)) (0 (16 nil nil) (12 nil nil)))
(get-right-child abcdefgh) ; => (0 (0 (1 nil nil) (9 nil nil)) (0 (11 nil nil) (2 nil nil)))
