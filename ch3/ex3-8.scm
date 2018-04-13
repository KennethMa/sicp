(define f
  (lambda (first)
    (set! f (lambda (rest) 0))
    first))
