(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average a b)
  (/ (+ a b) 2.0))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (repeated f n)
  (define (compose f g)
    (lambda (x) (f (g x))))
  (define (iter i g)
    (if (= i 1) g
        (iter (- i 1) (compose f g))))
  (iter n f))

(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
               1.0))

(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (/ x (square y))))
                1.0))

(define (cube x)
  (* x x x))

; it works
(define (fourth-root x)
  (fixed-point ((repeated average-damp 2) (lambda (y) (/ x (cube y))))
                1.0))

 ; it works
(define (fifth-root x)
  (fixed-point ((repeated average-damp 2) (lambda (y) (/ x (* (cube y) y))))
                1.0))

; it works
(define (sixth-root x)
  (fixed-point ((repeated average-damp 2) (lambda (y) (/ x (* (cube y) (square y)))))
                1.0))

; it works
(define (seventh-root x)
  (fixed-point ((repeated average-damp 2) (lambda (y) (/ x (* (cube y) (cube y)))))
                1.0))


(define (expt base n)
  (if (= n 0) 1
      ((repeated (lambda (x) (* base x)) n) 1)))

(define (average-damp-n-times f n)
  ((repeated average-damp n) f))

(define (damped-nth-root n damp-times)
  (lambda (x) (fixed-point (average-damp-n-times  (lambda (y) (/ x (expt y (- n 1))))
                                                  damp-times)
                            1.0)))

(define sqrt (damped-nth-root 2 1))
(define cube-root (damped-nth-root 3 1))
(define fourth-root (damped-nth-root 4 2))

(define (lg n)
  (/ (log n) (log 2)))

(define (nth-root n)
  (damped-nth-root n (lg n)))
