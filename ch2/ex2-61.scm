(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (car set)) true)
        ((< x (car set)) false)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (cond ((element-of-set? x set) set)
        ((< x (car set)) (cons x set))
        (else (cons (car set) (adjoin-set x (cdr set))))))
