(define nil '())
(define (square-list terms)
  (if (null? terms)
      nil
      (cons (square (car terms))
            (square-list (cdr terms)))))
(define (square-list terms)
  (map square terms))
