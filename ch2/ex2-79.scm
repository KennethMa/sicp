(put 'equ? 'scheme-number
  (lambda (x y)
      (= x y)))

(put 'equ? 'rational
  (lambda (x y)
      (and (= (numer x) (numer y))
            (= (denom x) (denom y)))))

(put 'equ? 'complex
  (lambda (x y)
      (and (= (real-part x) (real-part y))
            (= (imag-part x) (imag-part y)))))
