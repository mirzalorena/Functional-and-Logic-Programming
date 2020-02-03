; 1.For a given tree of type (1) return the path from the root 
;node to a certain given node X.

;tree-sequence(l1..ln):
; -> tree-sequence(l3..ln),l1=0
; ->  put in the left subtree ,l1=1
;->   put in the subtrees ,otherwise

(defun tree-sequence(l)
	(case (cadr l) 
		(0 (values (list (car l)) (cddr l)))
		(1 (multiple-value-bind (left-subtree rest-of-list) (tree-sequence (cddr l))
			(values (list (car l) left-subtree) rest-of-list)))
		(t (multiple-value-bind (left-subtree rest-of-list) (tree-sequence (cddr l))
			(multiple-value-bind (right-subtree rest-of-rest) (tree-sequence rest-of-list)
			(values (list (car l) left-subtree right-subtree) rest-of-rest))))
	)
)

; wrapper for tree-sequence
(defun transform(l) 
	(if (null l)
		nil
		(tree-sequence l))
)

(print (transform '(A 2 B 0 C 2 D 0 E 0)))

;path(t1..tn,leaf):
; -> [] , n=0
; -> [list] , t1=leaf 
; -> path(t2..ln, leaf) , otherwise

(defun path(tree leaf)
	(cond 
		((null tree) nil)
		((eq (car tree) leaf) (list leaf))
		(t (mapcan (lambda (s ubtree) 
					(let ((p (path subtree leaf)))
						(when p (cons (car tree) p))))
					(cdr tree)))
	)
)

(print (path '(A (B) (C (D) (E))) 'D))


;wrapper for path
(defun wrapper(tree leaf) 
	(setq tree (transform tree))
	(cond 
		((path tree leaf))
	)
)

(print (wrapper '(A 2 B 0 C 2 D 0 E 0) 'D))

	















