(define (cont-frac-iter n d k)
  (define (iter i result)
    (if (= i 0) result
        (iter (- i 1) (/ (n i) (+ (d i) result)))))
  (iter k 0))

(define (base-of-natural-log k)
  (+ 2
      (cont-frac-iter (lambda (i) 1.0)
                      (lambda (i) (if (= 2 (remainder i 3)) (* (/ 2 3) (+ i 1)) 1))
                      k)))

(base-of-natural-log 10)
