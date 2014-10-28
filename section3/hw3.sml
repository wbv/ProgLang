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
			             | SOME v => all_ans' xs' (v@acc))
	in
		all_ans' xs []
	end

(* Problem 9a *)
val count_wildcards = g (fn () => 1) (fn s => 0)

(* Problem 9b *)
val count_wild_and_variable_lengths = g (fn () => 1) (fn s => String.size s)

(* Problem 9c *)
fun count_some_var (x,p) = g (fn () => 0) (fn s => if s = x then 1 else 0) p

(* Problem 10 *)
fun check_pat p =
	let
		fun get_strings pat =
			case pat of
			  Variable x         => [x]
			| TupleP ps          => List.foldl (fn (p,i) => i @ (get_strings p))
			                                   []
			                                   ps
			| ConstructorP(_,p') => get_strings p'
			| _                  => []
		fun not_duped xs cnt (n, acc) =
			if not acc orelse cnt > 1
			then false
			else case xs of
			       [] => true
			     | x::xs' => not_duped xs' ((if x = n then 1 else 0)+cnt) (n, acc)
		val strs = get_strings p
	in
		List.foldl (not_duped strs 0) true strs
	end

(* Problem 11 *)
fun match (v,p) =
	case (v,p) of
	  (_,Wildcard)          => SOME []
	| (v',Variable s)       => SOME [(s,v')]
	| (Unit,UnitP)          => SOME []
	| (Const n,ConstP m)    => if n = m then SOME [] else NONE
	| (Constructor(s1,v1),ConstructorP(s2,p1)) => if s1 = s2 then match(v1,p1)
	                                              else NONE
	| (Tuple vs, TupleP ps) => if List.length(ps) = List.length(vs)
	                           then all_answers
	                                (fn (vn,pn) =>
	                                 if isSome (match(vn,pn))
	                                 then match(vn,pn)
	                                 else NONE)
	                                (ListPair.zip(vs,ps))
	                           else NONE
	| _ => NONE

(* Problem 12 *)
fun first_match v ps =
	SOME (first_answer match (List.map (fn x => (v,x)) ps))
	handle NoAnswer => NONE
