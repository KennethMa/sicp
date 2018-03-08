(define (make-interval a b)
  (cons a b))

(define (upper-bound z)
  (max (car z) (cdr z)))

(define (lower-bound z)
  (min (car z) (cdr z)))

(define (sub-interval x y)
  (let ((lower (- (lower-bound x) (upper-bound y)))
        (upper (- (upper-bound x) (lower-bound y))))
    (make-interval lower upper)))

(define m (make-interval 1 5))
(define n (make-interval 3 7))

(sub-interval n m)
