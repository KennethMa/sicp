(define (p x y z)
  (cond ((and (> x z) (> y z)) (+ (* x x) (* y y)))
        ((and (> x y) (> z y)) (+ (* x x) (* z z)))
        (else (+ (* y y) (* z z)))))
