(define one
  (lambda (f) (lambda (x) (f x))))

(define two
  (lambda (f) (lambda (x) (f (f x)))))

(define +
  (lambda (a)
    (lambda (b)
      (lambda (f)
        (lambda (x)
          (a f (b f x)))))))
