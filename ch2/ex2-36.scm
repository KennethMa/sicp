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
