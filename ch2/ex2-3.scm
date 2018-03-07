(define (make-point x y)
  (cons x y))
(define (x-point p)
  (car p))
(define (y-point p)
  (cdr p))

(define (make-segment start-point end-point)
  (cons start-point end-point))
(define (start-segment segment)
  (car segment))
(define (end-segment segment)
  (cdr segment))

(define (perimeter-rectangle r)
  (let ((length (length-of-rectangle r))
        (width (width-of-rectangle r)))
      (* 2 (+ length width))))

(define (area-rectangle r)
  (* (length-of-rectangle r) (width-of-rectangle r)))

(define (make-rectangle length-1 length-2 width-1 width-2)
  (cons (cons length-1 length-2)
        (cons width-1 width-2)))

(define (length-1-rectangle r)
  (car (car r)))

(define (length-2-rectangle r)
  (cdr (car r)))

(define (width-1-rectangle r)
  (car (cdr r)))

(define (width-2-rectangle r)
  (cdr (cdr r)))

(define length-1 (make-segment  (make-point 1 4)
                                (make-point 4 4)))

(define length-2 (make-segment  (make-point 1 2)
                                (make-point 4 2)))

(define width-1 (make-segment (make-point 1 2)
                              (make-point 1 4)))

(define width-2 (make-segment (make-point 4 2)
                              (make-point 4 4)))

(define rectangle (make-rectangle length-1 length-2 width-1 width-2))

(define (length-of-rectangle r)
  (let ((length (length-1-rectangle r)))
      (let ((start (start-segment length))
            (end (end-segment length)))
          (- (x-point end) (x-point start)))))

(define (width-of-rectangle r)
  (let ((width (width-1-rectangle r)))
      (let ((start (start-segment width))
            (end (end-segment width)))
          (- (y-point end)
              (y-point start)))))

(width-of-rectangle rectangle)
(length-of-rectangle rectangle)

(perimeter-rectangle rectangle)
(area-rectangle rectangle)

;; representation 2

(define (make-rectangle length width)
  (cons length width))

(define (length-rectangle r)
  (car r))

(define (width-rectangle r)
  (cdr r))

(define (length-of-rectangle r)
  (let ((length (length-rectangle r)))
      (let ((start (start-segment length))
            (end (end-segment length)))
          (- (x-point end) (x-point start)))))

(define (width-of-rectangle r)
  (let ((width (width-rectangle r)))
      (let ((start (start-segment width))
            (end (end-segment width)))
          (- (y-point end)
              (y-point start)))))

(define l (make-segment (make-point 1 2)
                        (make-point 4 2)))

(define w (make-segment (make-point 1 2)
                        (make-point 1 4)))

(define r (make-rectangle l w))
(length-of-rectangle r)
(width-of-rectangle r)
(perimeter-rectangle r)
(area-rectangle r)
