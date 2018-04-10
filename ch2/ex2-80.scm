(put '=zero? 'scheme-number
  (lambda (x) (= x 0)))

(put '=zero? 'rational
  (lambda (r) (= 0 (numer r))))

(put '=zero? 'complex
  (lambda (z) (and (= 0 (real-part z))
                    (= 0 (imag-part z)))))
