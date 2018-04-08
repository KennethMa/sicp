(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair)    ; symbol
                               (cadr pair))  ; frequency
                    (make-leaf-set (cdr pairs))))))

(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))

(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define (successive-merge ls)
  (cond ((null? ls) '())
        ((= 1 (length ls)) (car ls))
        (else (successive-merge (adjoin-set (make-code-tree (car ls)
                                                            (cadr ls))
                                            (cddr ls))))))

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (encode-symbol s tree)
  (let ((lb (left-branch tree))
        (rb (right-branch tree)))
      (cond ((element-of-set? s (symbols lb))
              (if (leaf? lb)
                  '(0)
                  (cons 0 (encode-symbol s lb))))
            ((element-of-set? s (symbols rb)
              (if (leaf? rb)
                  '(1)
                  (cons 1 (encode-symbol s rb))))
            (else (error "the symbol is not in the tree -- ENCODE-SYMBOL")))))

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define p '((A 2) (NA 16) (BOOM  1) (SHA 3) (GET 2) (YIP 9) (JOB 2) (WAH 1)))

(define rocktree (generate-huffman-tree p))

(define rock-song '(Get a job Sha na na na na na na na na Get a job Sha na na na na na na na na Wah yip yip yip yip yip yip yip yip yip Sha boom))

(define encoded-rock-song (encode rock-song rocktree))

(length encoded-rock-song)
; 84

(* 3 (length rock-song))
; 108
