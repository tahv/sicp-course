#lang simply-scheme

#| Week 1, Exercice 1 (exercice 1.6 of sicp)
|#

(define (square x) (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 2) ; 1.414215...

#|

We define a new-if as a non-special form using cond.
What happens when we attempt to use this to compute square roots? Explain.

----------

(define (new-if predicate
                then-clause
                else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))

----------

Anwser

(sqrt 2) Create an infinite loop because new-if is not a special form and is
resolved in applicative-order.
The if statment is a special form that evaluate the predicate before and only
evaluate the selected clause.
(if (predicate) then-clause else-clause)

The new-if use a cond, which is not a special form and evaluate both sub
expressions no matter the result of the predicate.
(cond (predicate then-clause) (else else-clause))

In the example, the case of sqrt-iter, the then-clause of the new-if is
sqrt-iter, creating a infinite recursion.
|#
