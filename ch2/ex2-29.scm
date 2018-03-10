(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

; a
(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))

(define mobile (make-mobile (make-branch 10 25)
                            (make-branch 5 20)))

; b
(define (total-weight mobile)
  (cond ((null? mobile) 0)
        ((not (pair? mobile)) mobile)
        (else (+ (total-weight (branch-structure (left-branch mobile)))
                  (total-weight (branch-structure (right-branch mobile)))))))

(total-weight mobile)

; c
(define (branch-weight branch)
  (total-weight (branch-structure branch)))

(define (branch-torque branch)
  (* (branch-length branch) (branch-weight branch)))

(define (same-torque? left right)
  (= (branch-torque left)
    (branch-torque right)))

(define (mobile-balance? mobile)
  (let ((left (left-branch mobile))
        (right (right-branch mobile)))
        (and (same-torque? left right)
              (branch-balance? left)
              (branch-balance? right))))

(define (branch-balance? branch)
  (let ((sub-mobile (branch-structure branch)))
    (if (pair? sub-mobile)
        (mobile-balance? sub-mobile)
        #t)))

; d
(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cdr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cdr branch))
