#lang simply-scheme

#| Exercice 1.42 sicp

Let f and g be two one-argument functions.
The composition f after g is defined to be the function x -> f(g(x)).
Define a procedure compose that implements composition.
|#

(define (square x) (* x x))

(define (inc x) (+ x 1))

(define (compose f g)
  (lambda (x) (f (g x))) )

((compose square inc) 6) ; 49
