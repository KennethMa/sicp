(define right-split (split beside below))
(define up-split (split below beside))

(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (- n 1))))
        (beside painter (below smaller smaller)))))

(define (split op1 op2)
  (define (fn painter n)
    (if (= n 0)
        (let ((smaller (fn painter (- n 1))))
              (op1 painter (op2 smaller smaller)))))
  fn)
