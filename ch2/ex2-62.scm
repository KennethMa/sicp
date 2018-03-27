(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (else
          (let ((a (car set1))
                (b (car set2)))
              (cond ((= a b) (cons a (union-set (cdr set1) (cdr set2))))
                    ((< a b) (cons a (union-set (cdr set1) set2)))
                    ((> a b) (cons b (union-set set1 (cdr set2)))))))))

