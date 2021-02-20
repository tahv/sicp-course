#lang simply-scheme

#| Week 1, Exercice 4

Write a predicate ordered? that takes a sentence of numbers as its argument and
returns a true value if the numbers are in ascending order, or a false value
otherwise.|#

(define (ordered? sequence)
  (cond ((< (count sequence) 2) #t)
        ((> (first sequence) (first (butfirst sequence))) #f)
        (else (ordered? (butfirst sequence))) ))

(ordered? '(0 1 5)) ; #t
(ordered? '(0 1 0)) ; #f
(ordered? '(3 2 1)) ; #f
(ordered? '(0 0 0)) ; #t
(ordered? '(0 1))   ; #t
(ordered? '(1 0))   ; #f
(ordered? '(1))     ; #t
(ordered? '())      ; #t
