#lang simply-scheme

#| Exercice 1.31.1 sicp

Write an procedure called product that returns the product of the values of a
function at points over a given range.
Show how to define factorial in terms of product.
|#

#| Example sum from the book
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (cube a) (* a a a))

(define (sum-cubes a b)
  (define (inc n) (+ n 1))
  (sum cube a inc b))

(sum-cubes 1 10) ; 3025
|#

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (increment n) (+ n 1))

(define (identity n) n)

(define (factorial n)
  (product identity 1 increment n))

(factorial 6) ; 720

(define (wallis-product n)
  (define (term n)
    (if (even? n)
        (/ (+ n 2) (+ n 1))
        (/ (+ n 1) (+ n 2)) ))
  (product term 1 increment n) )

(* (wallis-product 1) 4) ; 8/3 or 2.666...
(* (wallis-product 2) 4) ; 32/9 or 3.555...
