#lang simply-scheme

#| Week 1, Exercice 5

Write a procedure ends-e that takes a sentence as its argument and returns a
sentence containing only those words of the argument whose last letter is E:

> (ends-e '(please put the salami above the blue elephant))
(please the above the blue)
|#

(define (ends-e phrase)
  (cond ((empty? phrase) phrase)
        ((equal? (last (first phrase)) 'e)
         (sentence (first phrase) (ends-e (butfirst phrase))))
        (else (ends-e (butfirst phrase))) ))

(ends-e '(please put the salami above the blue elephant))
; '(please the above the blue)
