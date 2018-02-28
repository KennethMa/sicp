(define (good-enough? cur prev)
  (< (/ (abs (- cur prev)) prev) 0.001))
(define (sqrt-iter guess x)
  (if (good-enough? (improve guess x) guess)
      guess
      (sqrt-iter (improve guess x)
                  x)))
