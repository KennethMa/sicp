(define (equal? l1 l2)
  (cond ((and (null? l1) (null? l2)) #t)
    ((or (null? l1) (null? l2)) #f)
    ((eq? (car l1) (car l2)) (equal? (cdr l1) (cdr l2)))
    (else #f)))

(define (equal? l1 l2)
  (if (and (null? l1) (null? l2))
      #t
      (and
        (eq? (car l1) (car l2))
        (equal? (cdr l1) (cdr l2)))))
