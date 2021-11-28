#lang racket
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;     CS 381 - Programming Lab #4		;
;										;
;  < Matthew Mazon>					 	;
;  < mazonm@oregonstate.edu>	                	;
;										;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;This function works!
(define (member? e lst)
  (match lst
    ;If it is an empty list return #f
    [(list) #f]
    ;Else see if e is equal to h
    ;If it is return #t
    ;Else call member? e t(t is the rest of the list besides heads)
    [(list h t ...) (if (equal? e h) #t (member? e t))]))

;This function works!
(define (set? lst)
  (match lst
    ;If the list is empty then return true (Nothing more to recurse)
    [(list) #t]
    ;At each recursion take the head of the list h and call the member function
    ;If the member function returns true, that means it is a bad set
    ;If it returns #f  then continue to call set? until the list is empty.
    [(list h t ...) (if (equal? (member? h t) #t) #f (set? t))]))
    ;Return true if it is a set?

;This works!
(define (union lst1 lst2)
  (match lst1
    ;When the lst1 is empty, return the list that was create (list) and append it to (lst2)
    [(list) (append (list) lst2)]
    ;This function checks if the head is a member of lst2
    ;If it isn't then create a new list (list)
    ;If it is, the just continue
    [(list h t ...) (if (equal? (member? h lst2) #f) (cons h (union t lst2)) (union t lst2))]))

;This works!
(define (intersect lst1 lst2)
  (match lst1
    ;Return the list when lst1 is empty
    [(list) (list)]
    ;This checks if lst1 h is a part of lst2
    ;If it is, then add it to (list) and recurse to the rest of lst1 (i.e. t)
    ;If it is not, then continue through the function.
    [(list h t ...) (if (equal? (member? h lst2) #t) (cons h (intersect t lst2)) (intersect t lst2))]))

;This does work!
(define (difference lst1 lst2)
  (match lst1
    ;Return the list when lst1 is empty
    [(list) (list)]
    ;Similar to the union function excepet, when instead of appending the result to lst2
    ;Simply return the list.
    [(list h t ...) (if (equal? (member? h lst2) #f) (cons h (difference t lst2)) (difference t lst2))]))

;;;;;;;;;;;;;;;;;
;  DO NOT EDIT  ;
;;;;;;;;;;;;;;;;;
; enables testing via piping in stdin
(define-namespace-anchor anc)
(define ns (namespace-anchor->namespace anc))
(let loop ()
  (define line (read-line (current-input-port) 'any))
  (if (eof-object? line)
    (display "")
    (begin (print (eval (read (open-input-string line)) ns)) (newline) (loop))))