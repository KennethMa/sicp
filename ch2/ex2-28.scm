(define (fringe terms)
  (cond ((null? terms) '())
        ((not (pair? terms)) (list terms))
        (else (append (fringe (car terms)) (fringe (cdr terms))))))
