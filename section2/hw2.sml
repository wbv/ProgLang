(* Programming Languages - Homework 1
     written by Walter Vaughan *)

(* Some notes for the reader:

	- I use 'acc' as an accumulator variable in my tail-recursive functions, so that is why you'll see the name re-used. See the lesson on "Tail Recursion" for more information about that.
	
	- I try to keep the formatting consistent and readable yet concise, and in doing so I tend to use the "functional patterns" way of defining functions instead of using extra case statements. If that style confuses you, see the lesson on "Functional Patterns".

*)


(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(******************** Problem 1 Solutions ********************)
(* Problem 1a *)
fun all_except_option( x, xs ) =
	let
		fun iterate( x, front, []      ) = NONE
		  | iterate( x, front, y::back ) = if same_string( x, y )
		                                   then SOME (front @ back)
		                                   else iterate( x, y::front, back )
	in iterate( x, [], xs ) end

(* Problem 1b *)
fun get_substitutions1( [],    s ) = []
  | get_substitutions1( x::xs, s ) = case all_except_option( s, x ) of
                                       NONE    => get_substitutions1( xs, s )
                                     | SOME ys => ys @ get_substitutions1( xs, s )

(* Problem 1c - tail recursive version of 1b *)
fun get_substitutions2( subs, s ) =
	let
		fun get( [],    s, acc ) = acc
		  | get( x::xs, s, acc ) = case all_except_option( s, x ) of
		                             NONE    => get( xs, s, acc )
		                           | SOME ys => get( xs, s, ys @ acc )
	in get( subs, s, [] ) end

(* Problem 1d *)
fun similar_names( subs, {first=f,middle=m,last=l} ) =
	let 
		fun get( [],    acc ) = acc
		  | get( x::xs, acc ) = get( xs, { first  = x,
		                                   middle = m,
		                                   last   = l } :: acc )
	in get( get_substitutions2( subs, f ), [ {first=f,middle=m,last=l} ] ) end
(******************** End of Problem 1 Solutions ********************)


(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(******************** Problem 2 Solutions ********************)
(* Problem 2a *)

