(define (raise x)
  (apply-generic 'raise x))

(put 'raise 'integer
  (lambda (x) (make-rational x 1)))

(put 'raise 'rational
  (lambda (x) (makre-real (/ (numer x) (denom x)))))

(put 'raise 'real
  (lambda (x) (make-from-real-imag x 0)))
