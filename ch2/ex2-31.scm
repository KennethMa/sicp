(define (tree-map cb tree)
  (map (lambda (sub-tree)
        (if (pair? sub-tree)
            (tree-map cb sub-tree)
            (cb sub-tree)))
        tree))

(define (square-tree tree) (tree-map square tree))
