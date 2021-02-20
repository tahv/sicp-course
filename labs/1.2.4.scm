#lang simply-scheme

#| Week 1, Second Lab, Exercice 4

Write a proceduredupls-removedthat, given a sentence as input, returns the
result of removing duplicatewords from the sentence.
|#

(define (dupls-removed sequence)
  (cond ((empty? sequence) '())
        ((member? (first sequence)
                  (butfirst sequence))
         (dupls-removed (butfirst sequence)))
        (else (sentence (first sequence)
                        (dupls-removed (butfirst sequence)))) ))

(dupls-removed '(a b c a e d e b))
; (c a d e b)

(dupls-removed '(a b c))
; (a b c)

(dupls-removed '(a a a a b a a))
; (b a)
