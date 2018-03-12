(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))


(define (enumerate-tree t)
  (cond ((null? t) nil)
        ((not (pair? t)) (list t))
        (else (append (enumerate-tree (car t))
                      (enumerate-tree (cdr t))))))

(define (count-leaves t)
  (length (enumerate-tree t)))

(define (count-leaves t)
  (accumulate +
              0
              (map (lambda (s)
                    (if (pair? s)
                        (count-leaves s)
                        1))
                    t)))
