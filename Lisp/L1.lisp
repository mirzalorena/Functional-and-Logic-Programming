
(defun generate (l n pos)
	(cond 
		((null l) nil)
		((= (mod pos n) 0) (cons (car l) (generate (cdr l) n (+ pos 1))))
		(t (generate (cdr l) n (+ pos 1)))
	)
)

(print (generate '(1 2 3 4 5) 2 0))

(defun nivelePare(x lvl)
    (cond
    ((null x) 0)
    ((AND (atom x) (= (mod lvl 2) 0)) 1)
    ((atom x) 0)
    (t (apply '+ (mapcar (lambda (el) (nivelePare el (+ 1 lvl))) x)))
    )
)


(print (nivelePare '(A (B K) (C (D) (E))) 0))  