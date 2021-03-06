(define (prime? n)
  (define (divides? a b)
    (= (remainder b a) 0))
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))
  (define (smallest-divisor n)
    (find-divisor n 2))
  (= n (smallest-divisor n)))

(define (filtered-accumulate filter combiner null-value term a next b)
  (define (iter a result)
    (cond ((> a b) result)
          ((filter a) (iter (next a) (combiner (term a) result)))
          (else (iter (next a) result))))
  (iter a null-value))

(define (primes-sum a b)
  (if (< a 2) (filtered-accumulate prime? + 0 (lambda (x) x) 2 (lambda (i) (+ i 1)) b)
    (filtered-accumulate prime? + 0 (lambda (x) x) a (lambda (i) (+ i 1)) b)))

(define (coprimes-product n)
  (define (coprime? i)
    (and  (< i n)
          (= 1 (gcd i n))))
  (filtered-accumulate coprime? * 1 (lambda (x) x) 2 (lambda (i) (+ i 1)) n))
