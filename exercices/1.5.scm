#lang sicp
; 1.5

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

; How will the following expression evaluate in applicative and normal order ?
(test 0 (p))

#|
In applicative-order, (p) call itself recursively, the program is stuck in a loop.
(test 0 (p)) ; (p) try to solve itself before calling test

In normal-order, we return 0
(if (= x 0) 0 y))
(if (= 0 0) 0 (p)))
(if #t 0 (p)))
0
|#
