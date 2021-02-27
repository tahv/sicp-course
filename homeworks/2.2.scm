#lang simply-scheme

#| Week 2, Exercice 2 and 3

Last week you wrote procedures squares, that squared each number in its argument
sentence, and saw pigl-sent, that pigled each word in its argument sentence.
Generalize this pattern to create a higher-order procedure called every that
applies an arbitrary procedure, given as an argument, to each word of an
argument sentence.
|#

(define (square x) (* x x))

(define (every func seq)
  (if (empty? seq)
      '()
      (sentence (func (first seq))
                (every func (butfirst seq)))))

(every square '(1 2 3 4)) ; (1 4 9 16)

(every first '(nowhere man)) ; (n m)

(define (keep pred sent)
  (cond((empty? sent) '())
       ((pred (first sent))(se (first sent)(keep pred (bf sent))))
       (else (keep pred (bf sent)))))

(every (lambda (letter) (word letter letter)) 'purple)
(every (lambda (number) (if (even? number) (word number number) number))
       '(781 5 76 909 24))
(keep even? '(781 5 76 909 24))
(keep (lambda (letter) (member? letter 'aeiou)) 'bookkeeper)
(keep (lambda (letter) (member? letter 'aeiou)) 'syzygy)
; (keep (lambda (letter) (member? letter 'aeiou)) '(purple syzygy))
(keep (lambda (wd) (member? 'e wd)) '(purple syzygy))
