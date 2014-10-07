(* Programming Lanuages - Homework 1
     written by Walter Vaughan on 2014-10-06 *)

(* Problem 1 *)
fun is_older( d1 : int*int*int, d2 : int*int*int ) =
	if #1 d1 = #1 d2
	then if #2 d1 = #2 d2
		then #3 d1 < #3 d2
		else #2 d1 < #2 d2
	else #1 d1 < #1 d2
	
(* Old, shitty version. Please ignore.
fun is_older( d1 : int*int*int, d2 : int*int*int ) =
	if #1 d1 < #1 d2
	then true
	else if #1 d1 = #1 d2
		then if #2 d1 < #2 d2
			then true
			else if #2 d1 = #2 d2
				then if #3 d1 < #3 d2
					then true
					else false
				else false
		else false
*)	

(* Problem 2 *)
fun number_in_month( dates : (int*int*int) list, month : int ) =
	if null dates
	then 0
	else if #2 (hd dates) = month
		then number_in_month( tl(dates), month ) + 1
		else number_in_month( tl(dates), month ) + 0

(* Problem 3 *)
fun number_in_months( dates : (int*int*int) list, months : int list ) =
	if null months
	then 0
	else number_in_month( dates, hd months )
	     + number_in_months( dates, tl months )

(* Problem 4 *)
fun dates_in_month( dates : (int*int*int) list, month : int ) = 
	if not (null dates) 
	then if #2 (hd dates) = month
		then hd dates :: dates_in_month( tl dates, month )
		else dates_in_month( tl dates, month )
	else []
(* first test case = [(2012,2,28)] *)

(* Problem 5 *)
fun dates_in_months( dates : (int*int*int) list, months : int list ) =
	let
		fun join_lists ( xs : (int*int*int) list, ys : (int*int*int) list ) =
			if null xs
			then ys
			else hd xs :: join_lists (tl xs, ys)
	in
		if null months
		then []
		else join_lists( dates_in_month( dates, hd months ),
		             dates_in_months( dates, tl months ) )
	end


(* Problem 6 *)
fun get_nth( items : string list, n : int ) = 
	if n <= 1
	then hd items
	else get_nth( tl items, n-1 )

(* Problem 7 *)
fun date_to_string( date : int*int*int ) =
	let
		val monthlist = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ]
	in
		get_nth( monthlist, #2 date ) ^ " " ^ Int.toString( #3 date ) 
	^ ", " ^ Int.toString( #1 date )
	end

(* Problem 8 *)
(* This one kindof left me stuck. The only way I could figure out
   how to solve it was by more-or-less using a "while" loop. 
   I don't know how to do it any better. *)
fun number_before_reaching_sum( sum : int, numbers : int list ) =
	let
		fun shitty_approach( nums : int list, total : int, count : int ) =
			if total + (hd nums) >= sum
			then count
			else shitty_approach( tl nums, total + (hd nums), count + 1)
	in
		shitty_approach( numbers, 0, 0 )
	end

(* Problem 9 *)
fun what_month( day : int ) = 
	3

(* Problem 10 *)
fun month_range( d1 : int, d2 : int ) = 
	[1,2,2,2]

(* Problem 11 *)
fun oldest( dates : (int*int*int) list ) = 
	SOME (2011,3,31)

(* Challenge Problem 12, part 1 *)
fun number_in_months_challenge( dates : (int*int*int) list, months : int list ) =
	false

(* Challenge Problem 12, part 2 *)
fun dates_in_months_challenge( dates : (int*int*int) list, months : int list ) =
	false
