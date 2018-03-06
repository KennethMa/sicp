(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (iter i g)
    (if (= i 1) g
        (iter (- i 1) (compose f g))))
  (iter n f))

(define dx 0.00001)

(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx))
                    (f x)
                    (f (+ x dx)))
                  3)))

(define (n-fold-smooth f n)
  ((repeated smooth n) f))
