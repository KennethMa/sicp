(define (cont-frac n d k)
  (define (cf i)
    (if (= i k)
        (/ (n k) (d k))
        (/ (n i) (+ (d i) (cf (+ i 1))))))
  (cf 1))

(define (golden-ratio k)
  (/ 1 (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) k)))

(golden-ratio 12)
; 1.6180257510729614

(define (cont-frac-iter n d k)
  (define (iter i result)
    (if (= i 0) result
        (iter (- i 1) (/ (n i) (+ (d i) result)))))
  (iter k 0))

(define (golden-ratio-iter k)
  (/ 1 (cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) k)))

(golden-ratio-iter 10)
; 1.6181818181818184
