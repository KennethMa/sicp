(define (filter-list some-list filter)
  (define (iter l r)
    (if (null? l)
        r
        (if (filter (car l))
            (iter (cdr l) (cons (car l) r))
            (iter (cdr l) r))))
  (iter some-list '()))

(define (odd? n)
  (not (even? n)))
(define (same-parity x . y)
  (if (even? x)
      (cons x (filter-list y even?))
      (cons x (filter-list y odd?))))
