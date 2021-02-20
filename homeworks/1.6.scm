#lang simply-scheme

#| Week 1, Exercice 6

Your mission is to devise a test that will tell you whether Scheme's and and or
are special forms or ordinary functions.

Why might it be advantageous for an interpreter to treat or as a special form
and evaluate its arguments one at a time?
Can you think of reasons why it might be advantageous to treat or as an ordinary
function?
|#

(define (p) (p))

(or #t (p))
#| The process above return #t because Scheme's is a special form.

If or was not a special form, (p) would have created an infinite cycle.
|#

(and #f (p))
#| Same logic for and, if it was not a special form, (p) would be called
|#

#| It's advantageous to treat and and or as special forms because they stop at
the first failure and don't spend time evaluating the other expressions.
|#
