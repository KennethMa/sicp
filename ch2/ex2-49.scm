(define (make-vect x y)
  (cons x y))

(define (make-segment start end)
  (list start end))

(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
        ((frame-coord-map frame) (start-segment segment))
        ((frame-coord-map frame) (end-segment segment))))
     segment-list)))

(define top-left (make-vect 0 1))
(define top-right (make-vect 1 1))
(define bottom-right (make-vect 1 0))
(define bottom-left (make-ve 0 0))
(define top (make-segment top-left top-right))
(define right (make-segment top-right bottom-right))
(define bottom (make-segment bottom-right bottom-left))
(define left (make-segment bottom-left top-left))

; a
(segments->painter (list top right bottom left))

; b
(segments->painter (list
                    (make-segment top-left bottom-right)
                    (make-segment top-right bottom-left)))

; c
(define top-middle (make-vect 0.5 1))
(define right-middle (make-vect 1 0.5))
(define bottom-middle (make-vect 0.5 0))
(define left-middle (make-vect 0 0.5))

(segments->painter (list
                    (make-segment top-middle right-middle)
                    (make-segment right-middle bottom-middle)
                    (make-segment bottom-middle left-middle)
                    (make-segment left-middle top-middle)))

; d
