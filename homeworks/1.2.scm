#lang simply-scheme

#| Week 1, Exercice 2

Write a procedure squares that takes a sentence of numbers as its argument and
returns a sentence of the squares of the numbers.
|#

(define (square x) (* x x))

(define (squares numbers)
  (square-iter numbers 1))

(define (square-iter numbers index)
  (if (> index (count numbers))
      (sentence numbers)
      (square-iter (sentence (bf numbers)
                             (square (first numbers)))
                   (+ index 1))))

(squares '(2 3 4 5)) ; '(4 9 16 25)
(squares '())        ; '()

#| Solution from teacher:

(define (squares nums)
  (if (empty? nums)
      '()
      (se (square (first nums))
	        (squares (bf nums)) )))
|#
