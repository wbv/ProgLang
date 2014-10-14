(* Programming Languages - Homework 1
     written by Walter Vaughan *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(******************** Problem 1 Solutions ********************)
(* Problem 1a) *)
fun all_except_option( x, xs ) =
	let
	fun iterate( x, front, [] )    = NONE
	  | iterate( x, front, y::ys ) = if same_string( x, y )
	                               then SOME (front @ ys)
	                               else iterate( x, y::front, ys )
	in iterate( x, [], xs ) end

(* Problem 1b) *)
fun get_substitutions1( [], s )    = []
  | get_substitutions1( x::xs, s ) = case all_except_option( s, x ) of
                                       NONE    => get_substitutions1( xs, s )
                                     | SOME ys => ys @ get_substitutions1( xs, s )

(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)
