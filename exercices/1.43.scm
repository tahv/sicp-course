#lang simply-scheme

#| Exercice 1.43 sicp

Write a procedure that takes as inputs a procedure that computes f and a
positive integer n and returns the procedure that computes the n th repeated
application of f.
|#

(define (square x) (* x x))
(define (inc x) (+ x 1))

(define (repeated func n)
  (if (> n 1)
      (repeated (lambda (x) (func (func x))) (- n 1))
      func))

((repeated square 2) 5) ; 625
((repeated inc 2) 10) ; 12
