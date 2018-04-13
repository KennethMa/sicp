(define (make-accumulator init)
  (lambda (addend)
    (begin (set! init (+ init addend)) init)))
