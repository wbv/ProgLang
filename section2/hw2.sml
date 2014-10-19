(* Programming Languages - Homework 1
 *   written by Walter Vaughan
 *)

(* Some notes for the reader:
 *
 * - I use 'acc' as an accumulator variable in my tail-recursive functions,
 * so that is why you'll see the name re-used. See the lesson on 
 * "Tail Recursion" for more information about that. 
 *
 * - I try to keep the formatting consistent and readable yet concise, and in
 * doing so I tend to use the "functional patterns" way of defining functions
 * instead of using extra case statements. If that style confuses you, see the
 * lesson on "Functional Patterns".
 *
 *)


(* if you use this function to compare two strings (returns true if the same
 * string), then you avoid several of the functions in problem 1 having
 * polymorphic types that may be confusing 
 *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(******************** Problem 1 Solutions ********************)
(* Problem 1a *)
fun all_except_option( x, xs ) =
	let
		fun iterate( front, []      ) = NONE
		  | iterate( front, y::back ) = if same_string( x, y )
		                                then SOME (front @ back)
		                                else iterate( y::front, back )
	in
		iterate( [], xs )
	end

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
	in
		get( subs, s, [] )
	end

(* Problem 1d *)
fun similar_names( subs, {first=f,middle=m,last=l} ) =
	let 
		fun get( [],    acc ) = acc
		  | get( x::xs, acc ) = get( xs, { first  = x,
		                                   middle = m,
		                                   last   = l } :: acc )
	in
		get( get_substitutions2( subs, f ), [ {first=f,middle=m,last=l} ] )
	end
(***************** End of Problem 1 Solutions ****************)


(* you may assume that Num is always used with values 2, 3, ..., 10
 * though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(******************** Problem 2 Solutions ********************)
(* Problem 2a *)
fun card_color( s, _ ) = case s of
	  Clubs    => Black
	| Diamonds => Red
	| Hearts   => Red
	| Spades   => Black

(* Problem 2b *)
fun card_value( _, r ) = case r of
	  Num i => i
	| Jack  => 10
	| Queen => 10
	| King  => 10
	| Ace   => 11

(* Problem 2c *)
fun remove_card( cs, c, e ) = 
	let
		fun find_c( back, front ) = case front of
			     [] => raise e
			| x::xs => if x = c
			           then back @ xs
			           else find_c( x::back, xs )
	in 
		find_c( [], cs )
	end

(* Problem 2d *)
fun all_same_color( [] )        = true
  | all_same_color( _::[] )     = true
  | all_same_color( x::(y::z) ) = card_color( x ) = card_color ( y ) andalso
                                  all_same_color( y::z )
(* Problem 2e *)
fun sum_cards( cs ) =
	let
		fun tail_sum( [],    acc ) = acc
		  | tail_sum( x::xs, acc ) = tail_sum( xs, acc + card_value( x ) )
	in
		tail_sum( cs, 0 )
	end

(* Problem 2f *)
fun score( cs, goal ) =
	let
		val sum = sum_cards( cs )
		val prelim = if sum > goal
			then (sum - goal) * 3
			else (goal - sum)
	in
		case all_same_color( cs ) of
			  true => prelim div 2
			| false => prelim
	end

(* Problem 2g *)
fun officiate( cardlist', movelist', goal' ) = 
	let
		fun loop( heldcards, cardlist, movelist, goal, pts ) = 
			if pts > goal
			then pts
			else case movelist of 
				[] => pts
				| move::mlist => case move of
					Discard c => let
					               val hcards = remove_card( heldcards, c, IllegalMove )
					               in
					               loop( hcards,
					                     cardlist, mlist, goal, 
					                     score( hcards, goal ) )
					               end
					| Draw => case cardlist of 
						[] => pts
						| c::cs => loop( c::heldcards, cs, mlist, goal, 
						                 score( c::heldcards, goal ) )

 	in
		loop( [], cardlist', movelist', goal', score([], goal') )
	end

(******************** Problem 3 Solutions ********************)
(* Problem 3a *)
fun score_challenge( cs', goal' ) = 
	let
		fun count_aces( [], count )        = count
		  | count_aces( (s,r)::cs, count ) = 
			case r of
				Ace => count_aces( cs, count + 1 )
				| _ => count_aces( cs, count )
		fun possible_goals( base_goal, 0 ) = [base_goal]
		  | possible_goals( base_goal, n ) = (base_goal + (n * 10)) :: 
		                                     possible_goals( base_goal, n-1 )
		(* call this function with min as just some baseline min value *)
		fun min_score( [], min ) = min
		  | min_score( g::gs, min ) =
				let
					val current = score( cs', g )
				in
					if current < min
					then min_score( gs, current ) 
					else min_score( gs, min )
				end
	in (* this line is so awful but I really don't feel like fixing it *)
		min_score( possible_goals( goal', count_aces( cs', 0 ) ), 
		           score( cs', goal' ) )
	end

(* This is literally just Problem 2g, but with
 * score_challenge() copy-pasted in place of score() *)
fun officiate_challenge( cardlist', movelist', goal' ) = 
	let
		fun loop( heldcards, cardlist, movelist, goal, pts ) = 
			if pts > goal
			then pts
			else case movelist of 
				[] => pts
				| move::mlist => case move of
					Discard c => let
					               val hcards = remove_card( heldcards, c, IllegalMove )
					               in
					               loop( hcards,
					                     cardlist, mlist, goal, 
					                     score_challenge( hcards, goal ) )
					               end
					| Draw => case cardlist of 
						[] => pts
						| c::cs => loop( c::heldcards, cs, mlist, goal, 
						                 score_challenge( c::heldcards, goal ) )

 	in
		loop( [], cardlist', movelist', goal', score_challenge( [], goal' ) )
	end

(* Problem 3b *)
(* I don't want to finish this one... It's just 2 pts extra credit.
fun careful_player( cs, goal ) =
	let
		fun make_move( cardlist, goal, held, moves ) =
			if score( held ) = goal
			then moves
			else
				if score( held ) + 10 < goal
				then case cardlist of
					c::cs => make_move( cs, goal, c::held, moves @ [Draw] )
					[] => raise IllegalMove
				else moves
*)
