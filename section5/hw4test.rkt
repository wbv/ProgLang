#lang racket
;; Programming Languages Homework4 Tests
;;   supplied by Dan Grossman, added to by Walter B. Vaughan
(require "hw4.rkt") ; actual homework file
(require rackunit)  ; for unit-testing framework

;; Helper functions
(define ones (lambda () (cons 1 ones))) ; basic stream for stream testing
(define a 2)                            ; for challenge problem (11)

(define tests
  (test-suite
   "Tests for Assignment 4 by wbv"
   
   ; Problem 1 - sequence tests
   (check-equal? (sequence 0 5 1) (list 0 1 2 3 4 5) "Sequence test 1")
   (check-equal? (sequence 3 11 2) (list 3 5 7 9 11) "Sequence test 2")
   (check-equal? (sequence 3 8 3) (list 3 6) "Sequence test 3")
   (check-equal? (sequence 3 2 1) (list) "Sequence test 4")

   ; Problem 2 - string-append-map tests
   (check-equal? (string-append-map 
                  (list "dan" "dog" "curry" "dog2") 
                  ".jpg") '("dan.jpg" "dog.jpg" "curry.jpg" "dog2.jpg") "string-append-map test 1")
   (check-equal? (string-append-map 
                  (list) 
                  "this won't show up") '() "string-append-map test 2")
   (check-equal? (string-append-map 
                  (list "dan") 
                  " is the man") '("dan is the man") "string-append-map test 3")
   
   ; Problem 3 - list-nth-mod tests
   (check-equal? (list-nth-mod (list 0 1 2 3 4) 2) 2 "list-nth-mod test 1")
   (check-equal? (list-nth-mod (list 0 1 2 3 4) 6) 1 "list-nth-mod test 2")
   (check-equal? (list-nth-mod (list 0 1 2 3 4) 5) 0 "list-nth-mod test 3")
   ;; these throw the right errors but I don't know how to handle them. uncomment individually to re-test errors
   ;(check-equal? (list-nth-mod (list) 5) 0 "list-nth-mod test 3")
   ;(check-equal? (list-nth-mod (list 0 1 2 3 4) -3) 0 "list-nth-mod test 3")
   
   ; Problem 4 - stream-for-n-steps tests
   (check-equal? (stream-for-n-steps (lambda () (cons 1 ones)) 1) (list 1) "stream-for-n-steps test 1")
   (check-equal? (stream-for-n-steps (lambda () (cons 1 ones)) 5) (list 1 1 1 1 1) "stream-for-n-steps test 2")
   
   ; Problem 5 - funny-number-stream tests
   (check-equal? (stream-for-n-steps funny-number-stream 16) (list 1 2 3 4 -5 6 7 8 9 -10 11 12 13 14 -15 16) "funny-number-stream test 1")
   (check-equal? (stream-for-n-steps funny-number-stream 0) (list) "funny-number-stream test 2")
   
   ; Problem 6 - dan-then-dog tests
   (check-equal? (stream-for-n-steps dan-then-dog 1) (list "dan.jpg") "dan-then-dog test 1")
   (check-equal? (stream-for-n-steps dan-then-dog 2) (list "dan.jpg" "dog.jpg") "dan-then-dog test 2")
   (check-equal? (stream-for-n-steps dan-then-dog 3) (list "dan.jpg" "dog.jpg" "dan.jpg") "dan-then-dog test 3")
   (check-equal? (stream-for-n-steps dan-then-dog 0) (list) "dan-then-dog test 4")
   
   ; Problem 7 - stream-add-zero tests
   (check-equal? (stream-for-n-steps (stream-add-zero ones) 1) (list (cons 0 1)) "stream-add-zero test 1")
   (check-equal? (stream-for-n-steps (stream-add-zero ones) 3) (list (cons 0 1) (cons 0 1) (cons 0 1)) "stream-add-zero test 2")
   (check-equal? (stream-for-n-steps (stream-add-zero dan-then-dog) 2) (list (cons 0 "dan.jpg") (cons 0 "dog.jpg")) "stream-add-zero test 3")
   
   ; Problem 8 - cycle-lists test
   (check-equal? (stream-for-n-steps (cycle-lists (list 1 2 3) (list "a" "b")) 3) (list (cons 1 "a") (cons 2 "b") (cons 3 "a")) 
                 "cycle-lists test 1")
   (check-equal? (stream-for-n-steps (cycle-lists (list 1) (list 1)) 1) (list (cons 1 1)) 
                 "cycle-lists test 2")
   (check-equal? (stream-for-n-steps (cycle-lists (list 1) (list 1)) 0) (list) 
                 "cycle-lists test 3")
   (check-equal? (stream-for-n-steps (cycle-lists (list 1 2 3) (list "a" "b")) 7) (list (cons 1 "a") (cons 2 "b") (cons 3 "a") 
                                                                                        (cons 1 "b") (cons 2 "a") (cons 3 "b")
                                                                                        (cons 1 "a")) 
                 "cycle-lists test 4")
   
   ; Problem 9 - vector-assoc test
   (check-equal? (vector-assoc 4 (vector (cons 2 1) (cons 3 1) (cons 4 1) (cons 5 1))) (cons 4 1) "vector-assoc test 1")
   (check-equal? (vector-assoc 0 (vector (cons 2 1) (cons 3 1) (cons 4 1) (cons 5 1))) #f "vector-assoc test 2")
   (check-equal? (vector-assoc 4 (vector (cons 4 1) (cons 3 1) (cons 4 2) (cons 4 3))) (cons 4 1) "vector-assoc test 3")
   (check-equal? (vector-assoc 4 (vector 21 #f (cons 3 1) (cons 4 2) (cons 4 3))) (cons 4 2) "vector-assoc test 4")
   (check-equal? (vector-assoc 4 (vector)) #f "vector-assoc test 5")
   
   ; Problem 10 - cached-assoc tests
   (check-equal? ((cached-assoc (list (cons 1 2) (cons 3 4)) 3) 3) (cons 3 4) "cached-assoc test 1")
   (check-equal? ((cached-assoc (list (cons 1 2) (cons 3 4)) 3) 1) (cons 1 2) "cached-assoc test 2")
   (check-equal? ((cached-assoc (list (cons 1 2) (cons 3 4)) 3) 6) #f "cached-assoc test 3")
   
   ; Challenge Problem (11) - while-less test
   (check-equal? (while-less 7 do (begin (set! a (+ a 1)) (print "x") a)) #t "while-less test 1") ; prints 5 x's
   (check-equal? (while-less 7 do (begin (set! a (+ a 1)) (print "x") a)) #t "while-less test 2") ; prints 1 x (total of 6 now)
   ))

(require rackunit/text-ui)
;; runs the test
(run-tests tests)
