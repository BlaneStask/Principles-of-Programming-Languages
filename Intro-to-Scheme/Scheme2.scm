; 1

(define (matrixMultiply m1 m2)
    (define matrix2Transpose (matrixTranspose m2))
        (map (lambda (row) (map (lambda (column) 
        (apply + (map * row column))) matrix2Transpose)) m1))

(define (matrixTranspose m)
    (apply map (lambda _ _) m))

; 2

; use 'q' as the queue
(define (equeue) (list 'q))
(define q (equeue))

; get the highest priority 
(define (gethq q)
    (if (null? q) (error "Empty") 
    (car (cadr q))))

; extract the highest priority element without removing it from the queue 
(define (getq q)
    (if (null? q) (error "Empty") 
    (cadr q)))

; remove the highest priority element 
(define (remq q) 
    (if (null? q) (error "Empty")
    (set-cdr! q (cddr q))))

; insert an element to the priority queue 
(define (addq q x)
    (if (null? q) (list x)
    (set-cdr! q (cons x (cdr q)))
    (addq (cdr q) x)))
    
; get the size of the queue
(define (lenq q)
    (cond ((null? q) 0)
        (else (- (+ 1 (length (cdr q))) 1))))
