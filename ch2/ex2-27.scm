(define (deep-reverse iterms)
  (if (not (pair? iterms))
      iterms
      (append (deep-reverse (cdr iterms)) (list (deep-reverse (car iterms))))))
