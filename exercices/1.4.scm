#lang sicp
; 1.4

; Describe the behavior of the following procedure

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

#| If b > 0 use the + sign, else use the - sign

((if (> 1 0) + -) 2 1))
(+ 2 1)
3

((if (> -1 0) + -) 2 -1))
(- 2 -1)
3
|#

(a-plus-abs-b 2 1)  ; 3
(a-plus-abs-b 2 -1) ; 3
