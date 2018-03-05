(define (product-iterative term a next b)
  (define (product-iter a result)
    (if (> a b) result
        (product-iter (next a) (* (term a) result))))
  (product-iter a 1))

(define (product-recursive term a next b)
  (if (> a b) 1
      (* (term a) (product-recursive term (next a) next b))))

(define (factorial n)
  (product-iterative (lambda (x) x)
            1
            (lambda (i) (+ i 1))
            n))

(define (molecular i)
  (cond ((= i 1) 2)
        ((even? i) (+ i 2))
        (else (+ i 1))))
(define (denominator i)
  (if (odd? i) (+ i 2)
      (+ i 1)))
(define (pi n)
  (* 4 (exact->inexact (/ (product-iterative molecular 1 (lambda (i) (+ i 1)) n)
                          (product-iterative denominator 1 (lambda (i) (+ i 1)) n)))))
