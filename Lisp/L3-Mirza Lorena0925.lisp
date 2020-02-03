;Write a function to determine the number of nodes on the level k 
;from a n-tree represented as follows:
;(root list_nodes_subtree1 ... list_nodes_subtreen)
;Eg: tree is (a (b (c)) (d) (e (f))) and k=1 => 3 nodes

;nrOfNodesAtLevel(l1..ln,i,k)=
;-> 1, l1-list && i=k
;-> 0 , l-atom 
;-> nrOfNodesAtLevel(l2..ln,i,k), otherwise

(defun nrOfNodesAtLevel(l i level)
	(cond 
		((AND (listp l) (= i level)) 1)
		((atom l) 0)
		(t (apply '+ (mapcar #'(lambda (elem) (nrOfNodesAtLevel elem (+ i 1) level)) l)))
	)
)

(defun wrapper(l level) 
	(cond 
		(t (nrOfNodesAtLevel l 0 level))
	)
)

(print (wrapper '(a (b (c)) (d) (e (f))) 1))

