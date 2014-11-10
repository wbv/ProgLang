;; homework 4 by Walter B. Vaughan

#lang racket

(provide (all-defined-out)) ;; so we can put tests in a second file

;; Problem 1
(define (sequence low high stride)
  (if (>= high low)
      (cons low (sequence (+ low stride) high stride))
      (list)))

;; Problem 2
(define (string-append-map xs suffix)
  (map (lambda (x) (string-append x suffix)) xs))

;; Problem 3
(define (list-nth-mod xs n)
  (cond [(< n 0) (error "list-nth-mod: negative number")]
        [(empty? xs) (error "list-nth-mod: empty list")]
        [#t (car (list-tail xs 
                            (remainder n (length xs))))]))
      

;; Problem 4
(define (stream-for-n-steps s n) 
  (if (= n 0)
      (list)
      (cons (car (s)) 
            (stream-for-n-steps (cdr (s)) (- n 1)))))

;; Problem 5
(define funny-number-stream
  (letrec ([f (λ (n)
                (cons (if (= (remainder n 5) 0)
                          (* n -1)
                          n)
                      (λ () (f (+ n 1)))))])
    (λ () (f 1))))

;; Problem 6
(define dan-then-dog 
  (letrec ([f (λ () (cons "dog.jpg" (λ () (g))))]
           [g (λ () (cons "dan.jpg" (λ () (f))))])
    (λ () (g))))

;; Problem 7
(define (stream-add-zero s)
  (letrec ([f (λ (s2) (cons (cons 0 (car (s2)))
                            (λ () (f (cdr (s2))))))])
    (λ () (f s))))

;; Problem 8 ---incomplete
(define (cycle-lists xs ys)
  (letrec ([f (λ (n) (cons (cons (list-nth-mod xs n)
                                 (list-nth-mod ys n))
                           (λ () (f (+ n 1)))))])
    (λ () (f 0))))

;; Problem 9 ---incomplete
(define (vector-assoc v vec) #f)

;; Problem 10 --incomplete
(define (cached-assoc xs n) (λ v (0)))

;; Challenge Problem (11) ---incomplete
(define (while-less) 0)