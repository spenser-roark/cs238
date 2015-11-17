
; Here is a possible implementation of a tree node as a symbol.
; The symbol's value is the node's value.
; The symbol's plist (property list) is used for
; storing "pointers" to left and right children, and parent.

(setf a 1 b 2 c 3)
(put 'a :right 'b)
(get 'a :right)
(put 'a :left 'c)
(get 'a :left)
(symbol-plist 'a)

(put 'c :parent 'a)
(put 'b :parent 'a)

(setq node-counter 0)

(defun make-node ()
  (let ((symbol (intern (concat "n" (number-to-string node-counter)))))
    (set symbol node-counter)
    (setf (symbol-plist symbol) nil)
    (setq node-counter (1+ node-counter))
    symbol))

(defun get-value (node)
  (and (symbolp node) (symbol-value node)))

(defun set-value (node new-value)
  (and (symbolp node) (set node new-value)))

(defun get-parent (node)
  (and (symbolp node) (get node :parent)))

(defun set-parent (node parent)
  (and (symbolp node) (symbolp parent) (put node :parent parent)))

(defun get-left (node)
  (and (symbolp node) (get node :left)))

(defun set-left (node left)
  (and (symbolp node) (symbolp left) (put node :left left)))

(defun get-right (node)
  (and (symbolp node) (get node :right)))

(defun set-right (node right)
  (and (symbolp node) (symbolp right) (put node :right right)))

(defun build-tree (height)
  (let ((root (make-node)))
    (if (> height 0)
	(let ((left (build-tree (1- height)))
	      (right (build-tree (1- height))))
	  (set-left root left)
	  (set-right root right)
	  (set-parent left root)
	  (set-parent right root)))
    root))
