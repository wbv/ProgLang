;; Coursera - Programming Languages (UofW)
;;   homework 4 by Walter B. Vaughan

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

;; Problem 8
(define (cycle-lists xs ys)
  (letrec ([f (λ (n) (cons (cons (list-nth-mod xs n)
                                 (list-nth-mod ys n))
                           (λ () (f (+ n 1)))))])
    (λ () (f 0))))

;; Problem 9
(define (vector-assoc v vec)
  (letrec ([f (λ (n)
              (if (= n (vector-length vec)) ; check to see if we hit the end of the vector
                  #f
                  (let ([c (vector-ref vec n)]) ; c -> current element in vec
                    (if (and (pair? c) (equal? (car c) v))
                        c
                        (f (+ n 1))))))])
    (f 0)))
                       

;; Problem 10
(define (cached-assoc xs n)
  (letrec ([cache (make-vector n #f)]
           [cache-pos 0]
           [f (λ (v)
                (let ([ans (vector-assoc v cache)])
                  (if ans
                      ans
                      (let ([new-ans (assoc v xs)])
                        (when new-ans
                            (begin
                              (vector-set! cache cache-pos new-ans)
                              (set! cache-pos (+ cache-pos 1))          ; increment cache "pointer"
                              (when (= cache-pos n) (set! cache-pos 0)) ; loop around to start of cache
                              new-ans))
                        new-ans))))])
    f))

;; Challenge Problem (11) 
(define-syntax while-less
  (syntax-rules (do)
    [(while-less e1 do e2)
     (let ([n e1])
       (letrec ([f (λ ()
                     (if (>= e2 n)
                         #t
                         (f)))])
         (f)))]))