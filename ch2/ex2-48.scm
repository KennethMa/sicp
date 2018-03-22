(define (make-vect x y)
  (cons x y))

(define (xcor-vect v)
  (car v))

(define (ycor-vect v)
  (cadr v))

(define (make-segment start end)
  (list start end))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cadr segment))

(define start-vector (make-vect 1 2))
(define end-vector (make-vect 3 4))
(define seg (make-segment start-vector end-vector))
