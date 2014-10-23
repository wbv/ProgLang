(* Coursera Programming Languages, Homework 3,
 *   by Walter B. Vaughan *)

(**** provided code ****)
exception NoAnswer

datatype pattern = Wildcard
		 | Variable of string
		 | UnitP
		 | ConstP of int
		 | TupleP of pattern list
		 | ConstructorP of string * pattern

datatype valu = Const of int
	      | Unit
	      | Tuple of valu list
	      | Constructor of string * valu

fun g f1 f2 p =
    let
	val r = g f1 f2
    in
	case p of
	    Wildcard          => f1 ()
	  | Variable x        => f2 x
	  | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
	  | ConstructorP(_,p) => r p
	  | _                 => 0
    end

(**** for the challenge problem only ****)

datatype typ = Anything
	     | UnitT
	     | IntT
	     | TupleT of typ list
	     | Datatype of string

(**** you can put all your code here ****)

(* Problem 1 *)
fun only_capitals xs = let fun test x = Char.isUpper( String.sub(x,0) )
	in List.filter test xs end

(* Problem 2 *)
fun longest_string1 xs =
	List.foldl (fn (x,y) => if String.size x > String.size y
	                        then x
	                        else y) "" xs

(* Problem 3 *)
fun longest_string2 xs =
	List.foldl (fn (x,y) => if String.size x >= String.size y
							then x
							else y) "" xs

(* Problem 4 *)
fun longest_string_helper f =
	List.foldl (fn (x,y) => if f( String.size x, String.size y )
	                        then x
	                        else y) ""
val longest_string3 = longest_string_helper (fn (x,y) => x > y)
val longest_string4 = longest_string_helper (fn (x,y) => x >= y)

(* Problem 5 *)
fun longest_capitalized xs =
	let
		val f = longest_string3 o only_capitals
	in
		f xs
	end

(* Problem 6 *)
fun rev_string x = (String.implode o List.rev o String.explode) x

(* Problem 7 *)
fun first_answer f xs =
	case xs of
	  [] => raise NoAnswer
	| x::xs' => (case f(x) of
	               NONE => first_answer f xs'
	             | SOME v => v)

(* Problem 8 *)
fun all_answers f xs =
	let
		fun all_ans' xs acc =
			case xs of
			  [] => SOME acc
			| x::xs' => (case f(x) of
			               NONE => NONE
			             | SOME v => all_ans' xs' (acc @ [v]))
	in
		all_ans' xs []
	end
