; The set of all subsets of a given set is the union of:
; * the set of all subsets excluding the first number;
; * the set of all subsets excluding the first number, with the first number
;   re-inserted into each subset.

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
            (append rest (map  rest)))))
