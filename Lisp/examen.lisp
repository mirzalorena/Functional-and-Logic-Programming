;-------------------------------------------------------
;R1.5
(defun flattenList(l)
	(cond	
		((null l) nil)
		((numberp l) (list l))
		((atom l) nil)
		(t (apply 'append (mapcar 'flattenList l)))
	)
)

(defun check (l)
	(cond 
		((= (mod (car l) 2) 0) 1)
		(t 0)
	)
)

(defun solveR1(l)
	(cond 
		((atom l) 0)
		(t (+ (check (flattenList l)) (apply '+ (mapcar 'solveR1 l))))
	)
)

(print (solveR1 '(a 3 (b 2) (1 c 4) (d 2 (6 f)) ((g 4 ) 6))))

;----------------------------------------------------------
;R10.5

(defun transform(l)
	(cond 
		((null l) nil)
		((numberp l) (list l))
		((atom l) nil)
		(t (apply 'append(mapcar 'transform l)))
	)
)

(defun verifica(l)
	(setq l (transform l))
	(cond 
		((null l) 0)
		((and (null (cdr l)) (= (mod (car l) 2) 1)) 1)
		(t (verifica (cdr l)))
	)
)

(defun solveR10(l)
	(cond 
		((atom l) 0)
		(t (+ (verifica l) (apply '+(mapcar 'solveR10 l))))
	)
)

(print (solveR10 '(A (B 2) (1 C 4) (D 1 (9 F)) ((G 7) 6))))



;----------------------------------------------------
;1.1

(defun F(l k)
	(append (F (car l) k)
		(cond 
			((null l) (cdr k))
			(t (list (F (car l) k) (car k)))
		)
	)
)
;(print (F '(1 2 3 4) '(2 3 6 7)))

;-------------------------------------------
;model 

(defun removeMod3(lst)
  (mapcan (lambda(el)
				(cond 
					((null el) (list nil))
					((consp el) (list (removeMod3 el)))
					((and (numberp el)(eql (mod el 3) 0 )) nil)
					(t (list el))
				)
			)
	lst)	
)
	
(print(removeMod3 '(1 (2 A (3 A)) 6)))	
(print(removeMod3 '(1 (2 (C)))))	


;------------------------------------------------
;R2 

(defun maxim(l)
    (cond
    ((null l) 1)
		((atom l) 1)
    ((and (numberp (car l)) (> (car l) (maxim (cdr l)))) (car l))
    (t (maxim (cdr l)))
    )
)

(defun Vasi(lst lvl)
    (cond
		((null lst) 0)	
		((atom lst) 0)
		((and (= (mod lvl 2) 0) (= ( mod (maxim lst) 2) 0)) (if (listp (car lst)) (+ 1 (Vasi lst (+ 1 lvl))) 1))
		;((and (= (mod lvl 2) 0) (and (= ( mod (maxim lst) 2) 0) (listp (car lst)))) (+ 1 (Vasi lst (+ 1 lvl)))) 
		;((and (= (mod lvl 2) 0) (= ( mod (maxim lst) 2) 0))  1)
		(t (apply '+ (mapcar (lambda (el) (Vasi el (+ 1 lvl))) lst)))
    )
)	

(print(Vasi '(A (B 2) (1 C 4) (1 (6 F)) (((G) 4) 6)) 1))
(print(Vasi '(A (B 2)) 1))

(defun inc(x)
	(+ 1 x)
)
(setq a 1)
(setq a (inc a))
(print (inc a))



(defun f3 (l)
(print l)
	(cond 
		((atom l) 1)
		((> (f3 (cdr l)) 0) (+ (car l) (f3 (car l)) (f3 (cdr l))))
		(t (f3 (cdr l)))
	)
)

(print (f3 '(2 3 4)))

;-------------------------------------------------
;R12.5

(print '(r12))
(defun r12_solve (l)
	(cond 
		((null l) 0)
		((atom l) 0)
		((numberp (car l)) (+ 1 (r12_solve (cdr l))))
		((listp (car l)) (r12_solve (cdr l)))
		(t (apply '+ (mapcar (lambda(el) (r12_solve el)) l)))
	)
)

(print (r12_solve '(1 A (B 2) (1 C 4) (D 1 (6 F)) ((G 4) 6))))

;------------------------------------------------------
;R10
(print '(r10))
(defun my_append ( l k)
	(if (null l)
		k 
		(cons (car l) (my_append (cdr l) k))
	)
)

(defun my_reverse (l) 
	(cond 
		((null l) nil)
		((listp (car l)) (my_append (my_reverse (cdr l)) (list (my_reverse (car l)))))
		(t (my_append (my_reverse (cdr l)) (list (car l))))
	)
)

(defun r10_solve(lst)
	(cond
		((null lst) 0)
		((atom lst) 0)
		((numberp (car lst)) (if (= (mod (car lst) 2) 1)( + 1 (r10_solve (cdr lst))) (r10_solve (cdr lst))))
		((atom (car lst)) (r10_solve (cdr lst)))
		(t (apply '+ (mapcar(lambda(el) (r10_solve el))  lst)))
	)
)

(print (r10_solve (my_reverse '(A (B 2) (1 C 4) (D 1 (9 F))((G 7)6)))))

;----------------------------------------------
;R15


(defun nivelPare(lst level)
	(cond
		((null lst) 0)
		;((atom lst) 0)
		((and (atom lst) (= (mod level 2) 0)) 1)
		((atom lst) 0)
		(t (apply '+ (mapcar (lambda (el) (nivelPare el (+ 1 level))) lst)))
	)
)

(print (nivelPare '(A (B 2) (1 C 4) (D 1 (9 F))((G 7)6)) 1))
(print (nivelPare '(A (B 2)) 1))

;------------------------------------------------------
;A.I.1

(defun Fct(f l)
	(cond 
		((null l) nil)
		;((funcall f (car l)) (cons (funcall f (car l)) (Fct f (cdr l))))
		((funcall f (car l)) (mapcar f l))
		(t nil)
	)
)

(print (Fct 'inc '(1 3 4)))


;-----------------------------------------------
;A1.5

(defun replacea1 (l lvl e)
	(cond
    ((null l) 0)
    ((and (atom l) (equal (mod lvl 2) 0)) e)
    ((and (atom l) (equal (mod lvl 2) 1)) l)
    ((listp l) (mapcar #'(lambda (a) (replacea1 a (+ 1 lvl) e)) l))
    )
)

(print (replacea1 '(a (b (g)) (c (d (e)) (f))) 0 'h))
			
			
;---------------------------------------------------


;-------------------------------------------------------
;A6.3

(defun removea6(lst)
	(mapcan #' (lambda(el)
		(cond 
			((null el) (list nil))
			((consp el) (list (removea6 el)))
			((and (numberp el) (equal (mod el 3) 0)) nil)
			(t (list el))
		)
	)
	lst)
)

(print (removea6 '(1 (2 A (3 A)) 6)))
(print (removea6 '(1 (2 (C)))))

;---------------------------------------------
;A6.1

(defun fa6(l1 l2)
	(append (fa6 (car l1) l2)
		(cond 
			((null l1) (cdr l2))
			(t (list (fa6 (car l1) l2) (car l2)))
		)
	)
)

(print (fa6 '(1 2 3) '(2 3 4)))
















































































