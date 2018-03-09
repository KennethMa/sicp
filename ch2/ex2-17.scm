(define (last-pair somelist)
  (if (null? somelist)
      somelist
      (let ((rest (cdr somelist)))
        (if (null? rest)
            (list (car somelist))
            (last-pair rest)))))
