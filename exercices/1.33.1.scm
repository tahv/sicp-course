#lang simply-scheme

#| Exercice 1.33.1 sicp

Show how to express the following using filtered-accumulate:

the sum of the squares of the prime numbers in the interval a to b (assuming
that you have a prime? predicate already written)

accumulate from previous exercice:

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))
|#

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
  (find-divisor n 2))

(define (prime? n)
  (if (= n 1) #f (= n (smallest-divisor n))))

(define (sum-of-primes-squared a b)
  (filtered-accumulate prime? + 0 square a increment b))


(sum-of-primes-squared 4 12) ; 5**2 + 7**2 + 11**2 = 195
