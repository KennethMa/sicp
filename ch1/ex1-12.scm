(define (pascalEle row col)
  (if (or (= col 0) (= row col))
    1
    (+ (pascalEle (- row 1) (- col 1)) (pascalEle (- row 1) col))))
