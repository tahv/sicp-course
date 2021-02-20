#lang simply-scheme

#| Week 1, Second Lab, Exercice 3 (exercice 1.3 of sicp)

Define a procedure that takes three numbers as arguments and returns the sum of
the squares of the two larger numbers.
|#

(define (square x) (* x x))

(define (sum-of-squares x y) (+ (square x) (square y)))

(define (sum-of-squares-of-two-larger x y z)
  (cond ((and (>= (+ x y) (+ y z)) (>= (+ x y) (+ x z))) (sum-of-squares x y))
        ((and (>= (+ x z) (+ y z)) (>= (+ x z) (+ x y))) (sum-of-squares x z))
        (else (sum-of-squares y z))))

(sum-of-squares-of-two-larger 1 2 3) ; 13
(sum-of-squares-of-two-larger 2 1 3) ; 13
(sum-of-squares-of-two-larger 3 2 1) ; 13
(sum-of-squares-of-two-larger 2 1 1) ; 5
(sum-of-squares-of-two-larger 1 2 2) ; 8
(sum-of-squares-of-two-larger 1 1 1) ; 2
