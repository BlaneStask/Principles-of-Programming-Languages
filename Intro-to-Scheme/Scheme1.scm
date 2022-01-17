; 1
(define (gcd u v)
  (if (= v 0) u
      (gcd v (mod u v))))

; 2
(define (power a b)
  (if (zero? b) 1
  (* a (power a (- b 1)))))

; 3
(define (binoc n k)
  (if (>= n k 0)
      (if (or (zero? k) (= k n)) 1
          (+ (binoc (sub1 n) (sub1 k))
             (binoc (sub1 n) k))) 0))

; 4
(define (nth n l)
  (if (or (> n (length l)) (< n 0))
    (if (eq? n 0)
      (car l)
      (nth (- n 1) (cdr l)))))

; 5
(define (minl l)
  (cond 
    ((null? (cdr l)) (car l)) 
    ((< (car l) (minl (cdr l))) (car l)) 
    (else (minl (cdr l)))))

; 6
(define (inters lx ly)
  (if (null? lx) '()
      (if (member (car lx) ly) 
          (cons (car lx) (inters (cdr lx) ly))
          (inters (cdr lx) ly))))

; 7
(define (diff lx ly)
  (cond ((null? lx) '())
        ((not (member (car lx) ly))
         (cons (car lx) (diff (cdr lx) ly)))
        (else (diff (cdr lx) ly))))

; 8
(define (double l)
  (map (lambda (l) (* l 2)) l))