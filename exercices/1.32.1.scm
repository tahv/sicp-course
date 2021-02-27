#lang simply-scheme

#| Exercice 1.32.1 sicp

Show that sum and product (Exercise 1.31) are both special cases of a still more
general notion called accumulate that combines a collection of terms, using some
general accumulation function.
|#

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

(define (product term a next b)
  (accumulate * 1 term a next b))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (identity n) n)

(define (increment n) (+ n 1))

(define (factorial n)
  (product identity 1 increment n))

(define (sum-integers a b)
  (sum identity a increment b))

(factorial 6)       ; 720
(sum-integers 1 10) ; 55
