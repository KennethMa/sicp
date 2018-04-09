; a
; number? and same-variable? are built-in predicates.And it's difficult to 'tag' number and symbolic.

; b
(define (install-sum)
  (define (make-sum ad ag) (cons ad ag))
  (define (addend s) (car s))
  (define (augend s) (cadr s))
  (define (deriv-sum s var)
    (make-sum (deriv (addend s) var) (deriv (augend s) var)))

  (define (tag x) (attach-tag '+ x))
  (put 'deriv '+ deriv-sum)
  (put 'make-sum '+
    (lambda (x y) (tag (make-sum x y))))
  'done)

(define (make-sum x y)
  ((get 'make-sum '+) x y))

(define (install-product)
  (define (make-product m1 m2) (cons m1 m2))
  (define (multiplier p) (car p))
  (define (multiplicand p) (cadr p))
  (define (deriv-product p var)
    (make-sum (make-product (multiplier exp)
                            (deriv (multiplicand exp) var))
              (make-product (deriv (multiplier exp) var)
                            (multiplicand exp))))

  (define (tag x) (attach-tag '* x))
  (put 'deriv '* deriv-product)
  (put 'make-product '*
    (lambda (x y) (tag (make-product x y))))
  'done                          )

