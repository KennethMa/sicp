(define (inc x)
  (+ x 1))

(define (double fn)
  (lambda (x) (fn (fn x))))

((double inc) 1) ; 3
(((double (double double)) inc) 5) ; 21
