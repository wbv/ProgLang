; First racket file! wooo
; semicolons are comments, in case you haven't figured that out
#lang racket ; I guess we could use a different language?

(provide (all-defined-out))

(define x 4) ; val x = 4 in SML
(define y (+ x 2))

(define cube1
  (lambda (x)
    (* x (* x x))))

; better version
(define cube2
  (lambda (x)
    (* x x x)))

; even more concise
(define (cube3 x)
  (* x x x))

;takes x to the yth power, only works for y >= 0
(define (pow1 x y)
  (if (= y 0)
      1
      (* x (pow1 x (- y 1)))))

(define pow2
  (lambda (x)
    (lambda (y)
      (pow1 x y))))

(define four-to-the (pow2 x))