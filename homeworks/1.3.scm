#lang simply-scheme

#| Week 1, Exercice 3
Write a procedure switch that takes a sentence as its argument and returns a
sentence in which every instance of the words I or me is replaced by you, while
every instance of you is replaced by me except at the beginning of the sentence,
where it’s replaced by I. (Don’t worry about capitalization of letters.)

Example:
> (switch ’(You told me that I should wake you up))
(i told you that you should wake me up)
|#

#| Old code, based on the first element being a Capital letter.
(define (switch-word wd)
  (cond ((member? wd '(I i Me me)) 'you)
        ((equal? wd 'You) 'I)
        ((equal? wd 'you) 'me)
        (else wd)))

(switch-word 'I)    ; 'you
(switch-word 'You)  ; 'I
(switch-word 'you)  ; 'me
(switch-word 'test) ; 'test
(switch-word 'test) ; 'test
|#

(define (switch phrase)
  (sentence (switch-word (first phrase) #t)
            (switch-rest (butfirst phrase)) ))

(define (switch-rest phrase)
  (if (empty? phrase)
      '()
      (sentence (switch-word (first phrase) #f)
                (switch-rest (butfirst phrase)) )))

(define (switch-word wd isfirstword)
  (cond ((member? wd '(I i Me me)) 'you)
        ((member? wd '(you You)) (if isfirstword 'I 'me))
        (else wd)))

(switch-word 'I #t)    ; 'you
(switch-word 'you #t)  ; 'I
(switch-word 'you #f)  ; 'me
(switch-word 'test #t) ; 'test
(switch-word 'test #f) ; 'test

(switch '(You told me that I should wake you up))
; (I told you that you should wake me up)
