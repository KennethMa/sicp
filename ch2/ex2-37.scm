(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op initial sequence)
  (if (null? (car sequence))
      nil
      (cons (accumulate op initial (map car sequence))
            (accumulate-n op initial (map cdr sequence)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(dot-product (list 1 2 3) (list 4 5 6)) ; 32

(define (matrix-*-vector m v)
  (map (lambda (m-row)
        (dot-product m-row v))
        m))

(define matrix (list (list 1 2 3 4) (list 5 6 7 8) (list 9 10 11 12)))
(matrix-*-vector matrix (list 2 3 4 5)) ; (40 96 152)

(define (transpose m)
  (accumulate-n cons nil m))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
        (map (lambda (m-row)
              (matrix-*-vector cols m-row)) m)))

(matrix-*-matrix matrix (list (list 1 2) (list 1 2) (list 1 2) (list 1 2)))
; ((10 20) (26 52) (42 84))
