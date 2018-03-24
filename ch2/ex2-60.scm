(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (cons x set))

(define (union-set set1 set2)
  (append set1 set2))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1)
               (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

; 上面的 intersection-set 函数存在一个问题，只会生成包含 set1 重复元素的交集，而忽略 set2 中重复的元素
; (intersection-set '(1 1 2) '(1 2 2)) -> (1 1 2)
; 即，交集应该包含 set1 和 set2 中都重复出现的元素
; (intersection-set '(1 1 2) '(1 2 2)) -> (1 1 2 1 2 2)

(define (intersection-set-dup set1 set2)
  (let ((inter (intersection-set set1 set2))
        (union (union-set set1 set2)))
    (filter (lambda (x) (element-of-set? x inter))
            union)))
