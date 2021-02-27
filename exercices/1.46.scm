#lang simply-scheme

#| Exercice 1.46 sicp
|#

#|
; Using define
(define (iterative-improve good-enough? improve-guess)
  (define (iter-improve guess)
    (if (good-enough? guess)
        guess
        (iter-improve (improve-guess guess))))
    iter-improve)
|#

; Using lambda
(define (iterative-improve good-enough? improve-guess)
  (lambda (guess)
    (if (good-enough? guess)
        guess
        ((iterative-improve good-enough? improve-guess) (improve-guess guess)))))

(define (average x y)
  (/ (+ x y) 2))

(define (square x) (* x x))

(define tolerance 0.00001)

(define (close-enough? v1 v2)
   (< (abs (- v1 v2)) tolerance))

(define (fixed-point f first-guess)
   ((iterative-improve
     (lambda (x) (close-enough? x (f x)))
     f)
    first-guess))

(define (sqrt x)
   ((iterative-improve
     (lambda (y)
       (< (abs (- (square y) x))
          0.0001))
     (lambda (y)
       (average y (/ x y))))
    1.0))

(sqrt 10)
