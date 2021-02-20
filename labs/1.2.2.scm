#lang simply-scheme

#| Week 1, Second Lab, Exercice 2

Modify the procedure so that it correctly handles cases like(plural ’boy)

(define (plural wd)
  (if (equal? (last wd) 'y)
      (word (bl wd) 'ies)
      (word wd 's)))
|#

(define (voyel? letter)
  (member? letter '(a e i o u)) )

(define (plural wd)
  (if (and (equal? (last wd) 'y)
           (not (voyel? (last (butlast wd)))))
      (word (bl wd) 'ies)
      (word wd 's)))

(plural 'boy)
