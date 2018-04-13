(define random-init 1008611)

(define rand
  (let ((x random-init))
    (lambda ()
      (set! x (rand-update x))
      x)))

(define new-rand
  (let ((x random-init))
    (define (dispatch m)
      (cond ((eq? m 'generate) (lambda ()
                                  (set! x (rand-update x))
                                  x))
            ((eq? m 'reset) (lambda (value) (set! x value) x))
            (else (error "bad parameter -- NEW-rand"))))
  dispatch))
