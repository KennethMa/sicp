(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(define (cc amount coin-values)
  (define (no-more? some-list)
    (null? some-list))
  (define (except-first-denomination some-list)
    (cdr some-list))
  (define (first-denomination some-list)
    (car some-list))
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination coin-values))
            (cc (- amount
                   (first-denomination coin-values))
                coin-values)))))

(cc 100 us-coins)
(cc 100 (reverse us-coins))
