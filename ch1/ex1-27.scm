(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
          (remainder (square (expmod base (/ exp 2) m))
                      m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                      m))))

(define (carmichael-test n)
  (define (congruent? a n)
    (= (expmod a n n) a))
  (define (carmichael-iter a n)
    (cond ((= a n) #t)
          ((congruent? a n) (carmichael-iter (+ a 1) n))
          (else #f)))
  (carmichael-iter 1 n))
