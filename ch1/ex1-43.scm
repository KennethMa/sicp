; recursive
(define (repeated f n)
  (if (= n 1) f
      (lambda (x) (f (repeated f (- n 1)) x))))

; iterative
(define (repeated f n)
  (define (iter i g)
    (if (= i 1) g
        (iter (- i 1) (lambda (x) (f (g x))))))
  (iter n f))

; with compose
(define (compose f g)
  (lambda (x) (f (g x))))

; recursive
(define (repeated f n)
  (if (= n 1) f
    (compose f (repeated f (- n 1)))))

; iterative
(define (repeated f n)
  (define (iter i g)
    (if (= i 1) g
        (iter (- i 1) (compose f g))))
  (iter n f))

((repeated square 2) 5)
