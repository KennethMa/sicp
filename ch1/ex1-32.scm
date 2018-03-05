(define (accumulate combiner null-value term a next b)
  (define (accumulate-iter a result)
    (if (> a b) result
      (accumulate-iter (next a) (combiner (term a) result))))
  (accumulate-iter a null-value))

(define (accumulate-recursive combiner null-value term a next b)
  (if (> a b) null-value
      (combiner (term a) (accumulate-recursive combiner null-value term (next a) next b))))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))

(sum (lambda (i) i) 1 (lambda (i) (+ i 1)) 10)
(product (lambda (i) i) 1 (lambda (i) (+ i 1)) 10)

(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
      (sum term (next a) next b))))
