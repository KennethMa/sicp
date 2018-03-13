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

(define empty-board nil)

(define (safe? k position)
    (iter-check (car position)
                (cdr position)
                 1))

(define (iter-check row-of-new-queen rest-of-queens i)
    (if (null? rest-of-queens)
        #t
        (let ((row-of-current-queen (car rest-of-queens)))
            (if (or (= row-of-new-queen row-of-current-queen)
                    (= (+ row-of-new-queen i) row-of-current-queen)
                    (= (- row-of-new-queen i) row-of-current-queen))
                #f
                (iter-check row-of-new-queen
                            (cdr rest-of-queens)
                            (+ i 1))))))

(define (adjoin-position new-row n rest-of-queens)
  (cons new-row rest-of-queens))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
          (lambda (positions) (safe? k positions))
          (flatmap
            (lambda (rest-of-queens)
              (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
            (queen-cols (- k 1))))))
  (queen-cols board-size))
