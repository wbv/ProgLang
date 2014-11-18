#lang racket
;; Programming Languages Homework5 Tests
;;   provided by Dan Grossman (Coursera Programming Languages)
;;   expanded upon by Walter B. Vaughan

(require "hw5.rkt")

(require rackunit)

(define tests
  (test-suite
   "Sample tests for Assignment 5"
   
   ;; check racketlist to mupllist
   (check-equal? (racketlist->mupllist (list (int 3) (int 4))) 
                 (apair (int 3) (apair (int 4) (aunit))) 
                 "racketlist->mupllist test 1")
   (check-equal? (racketlist->mupllist (list)) 
                 (aunit) 
                 "racketlist->mupllist test 2")
   (check-equal? (racketlist->mupllist (list (var "x") (int 12)))
                 (apair (var "x") (apair (int 12) (aunit))) 
                 "racketlist->mupllist test 3")
   
   ;; check mupllist to racketlist
   (check-equal? (mupllist->racketlist (apair (int 3) (apair (int 4) (aunit))))
                 (list (int 3) (int 4)) 
                 "racketlist->mupllist test 1")
   (check-equal? (mupllist->racketlist (aunit)) 
                 (list) 
                 "racketlist->mupllist test 2")
   (check-equal? (mupllist->racketlist (apair (int 3) (apair (add (int 4) (int 4)) (aunit))))
                 (list (int 3) (add (int 4) (int 4))) 
                 "racketlist->mupllist test 3")

   ;; tests ifgreater
   (check-equal? (eval-exp (ifgreater (int 3) (int 4) (int 5) (int 6))) (int 6) "ifgreater test 1")
   (check-equal? (eval-exp (ifgreater (int 1) (int -1) (int 5) (int 6))) (int 5) "ifgreater test 2")
   ;(check-equal? (eval-exp (ifgreater (int 1) (var "x") (int 5) (int 6))) (int 5) "ifgreater test error")
   
   ;; mlet test
   (check-equal? (eval-exp (mlet "x" (int 1) (add (int 5) (var "x")))) (int 6) "mlet test")
   
   ;; call tests
   (check-equal? (eval-exp (call (closure '() (fun #f "x" (add (var "x") (int 7)))) (int 1))) (int 8) "call test 1")
   (check-equal? (eval-exp (call (closure '() (fun "f" "x" (add (var "x") (int 7)))) (int 1))) (int 8) "call test 2")
   (check-equal? (eval-exp (call (closure '() (fun "f" "x" (ifgreater (var "x") (int 0)
                                                                      (call (var "f") (add (var "x") (int -1)))
                                                                      (int 8))))
                                 (int 1))) (int 8) "call test 3")
   
   ;; fst tests
   (check-equal? (eval-exp (fst (apair (int 1) (int 2)))) (int 1) "fst test 1")
   ;(check-equal? (eval-exp (fst (fun "f" "x" (var "x")))) (int 1) "fst test error")
   
   ;; snd tests
   (check-equal? (eval-exp (snd (apair (int 1) (int 2)))) (int 2) "snd test")
   ;(check-equal? (eval-exp (snd (fun "f" "x" (var "x")))) (int 1) "snd test error")
   
   ;; isaunit tests
   (check-equal? (eval-exp (isaunit (closure '() (fun #f "x" (aunit))))) (int 0) "isaunit test 1")
   (check-equal? (eval-exp (isaunit (aunit))) (int 1) "isaunit test 2")
   
   ;; ifaunit tests
   (check-equal? (eval-exp (ifaunit (int 1) (int 2) (int 3))) (int 3) "ifaunit test 1")
   (check-equal? (eval-exp (ifaunit (aunit) (int 2) (int 3))) (int 2) "ifaunit test 2")
   
   ;; mlet* tests
   (check-equal? (eval-exp (mlet* (list (cons "x" (int 10))) (var "x"))) 
                 (int 10) "mlet* test 1")
   (check-equal? (eval-exp (mlet* (list (cons "x" (int 10)) (cons "y" (int 5))) (add (var "x") (var "y")))) 
                 (int 15) "mlet* test 2")
   (check-equal? (eval-exp (mlet* (list (cons "x" (int 10)) (cons "x" (int 5))) (var "x"))) 
                 (int 5) "mlet* test shadowing")
   
   ;; ifeq test
   (check-equal? (eval-exp (ifeq (int 1) (int 2) (int 3) (int 4))) (int 4) "ifeq test 1")
   (check-equal? (eval-exp (ifeq (int 2) (int 2) (int 3) (int 4))) (int 3) "ifeq test 2")
   (check-equal? (eval-exp (ifeq (int 2) (int 0) (int 3) (int 4))) (int 4) "ifeq test 3")
   
   ;; mupl-map tests
   (check-equal? (eval-exp (call (call mupl-map (fun #f "x" (add (var "x") (int 7)))) 
                                 (apair (int 1) (aunit)))) 
                 (apair (int 8) (aunit)) "mupl-map test 1")
   (check-equal? (eval-exp (call (call mupl-map (fun #f "x" (add (var "x") (int 10))))
                                 (apair (int 1) (apair (int 2) (aunit))))) 
                 (apair (int 11) (apair (int 12) (aunit))) "mupl-map test 2")
   
   ;; problems 1, 2, and 4 combined test
   (check-equal? (mupllist->racketlist
   (eval-exp (call (call mupl-mapAddN (int 7))
                   (racketlist->mupllist 
                    (list (int 3) (int 4) (int 9)))))) (list (int 10) (int 11) (int 16)) "combined test")
   
   ))

(require rackunit/text-ui)
;; runs the test
(run-tests tests)
