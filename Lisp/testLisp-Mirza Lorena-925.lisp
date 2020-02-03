
(defun remove(l e)
	(cond 
		((null l) nil)
		((listp (car l)) (cons (remove (car l) e) (remove (cdr l) e)))
		((= (car l) e) (remove (cdr l) e))
		(t (cons (car l) (remove (cdr l) e)))
	)
)
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
