(define nil '())
(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))

(define (flatmap proc seq)
  (fold-right append nil (map proc seq)))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define (unique-pairs n)
  (flatmap (lambda (i)
            (map (lambda (j) (list i j))
                  (enumerate-interval 1 (- i 1))))
            (enumerate-interval 1 n)))

(define (unique-triples n)
  (flatmap (lambda (i)
            (map (lambda (j) (cons i j))
                  (unique-pairs (- i 1))))
            (enumerate-interval 1 n)))

(define (equal-sum? triple n)
  (= n (+ (car triple) (cadr triple) (caddr triple))))

(define (equal-sum? triple n)
  (= n (fold-right + 0 triple)))

(define (make-triple-sum triple)
  (append (fold-right cons nil triple) (list (fold-right + 0 triple))))

(define (equal-sum-triples n s)
  (map make-triple-sum
        (filter
            (lambda (triple) (equal-sum? triple s))
            (unique-triples n))))
