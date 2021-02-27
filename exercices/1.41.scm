#lang simply-scheme

#| Exercice 1.41 sicp

Define a procedure double that takes a procedure of one argument as argument and
returns a procedure that applies the original procedure twice.
|#

(define (inc x)
  (+ x 1))

(define (double func)
  (lambda (x) (func (func x))))

((double inc) 1) ; 3

(((double (double double)) inc) 5) ; 21
