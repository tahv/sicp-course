#lang simply-scheme

#| Exercice 1.33.1 sicp

Show how to express the following using filtered-accumulate:

The product of all the positive integers less than n that are relatively prime
to n (i.e., all positive integers i < n such that GCD(i, n) = 1).
|#

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b)) ))

(define (filtered-accumulate filter combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (if (filter a) (term a) null-value)
                (filtered-accumulate filter combiner null-value term (next a) next b)) ))

(define (increment n) (+ n 1))

(define (square x) (* x x))

(define (smallest-divisor n)
  (define (divides? a b) (= 0 (remainder b a)))
  (define (find-divisor n divisor)
      (cond ((> (square divisor) n) n)
            ((divides? divisor n) divisor)
            (else (find-divisor n (+ divisor 1)))))
  (find-divisor n 2) )

(define (prime? n)
  (if (= n 1) #f (= n (smallest-divisor n))))

(define (relative-prime? a b) (= (gcd a b) 1))

(define (identity n) n)

(define (product-of-positive-relatives-prime n)
  (define (filter x) (relative-prime? x n))
  (filtered-accumulate filter * 1 identity 1 increment (- n 1)))

(product-of-positive-relatives-prime 10) ; 189
