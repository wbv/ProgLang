(* Programming Lanuages - Homework 1
     written by Walter Vaughan *)

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
fun number_before_reaching_sum( sum : int, numbers : int list ) =
	if sum - (hd numbers) > 0
	then 1 + number_before_reaching_sum( sum - (hd numbers), tl numbers )
	else 0

(* This one left me stuck for a while, and my initial solution was to
   solve it was by more-or-less using a "while" loop. It felt like cheating
   so I eventually found a better solution. I'm leaving it here as a reminder
   to always keep trying. 
   
fun number_before_reaching_sum( sum : int, numbers : int list ) =
	let
		fun shitty_approach( nums : int list, total : int, count : int ) =
			if total + (hd nums) >= sum
			then count
			else shitty_approach( tl nums, total + (hd nums), count + 1)
	in
		shitty_approach( numbers, 0, 0 )
	end
*) 

(* Problem 9 *)
fun what_month( day : int ) = 
	let
		val days_in_month = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ]
	in
		number_before_reaching_sum( day, days_in_month ) + 1
	end

(* Problem 10 *)
fun month_range( day1 : int, day2 : int ) = 
	if day1 > day2
	then []
	else what_month( day1 ) :: month_range( day1 + 1, day2 )

(* Problem 11 *)
fun oldest( dates : (int*int*int) list ) = 
	if null dates
	then NONE
	else 
		let 
			val tl_old = oldest( tl dates )
		in
			if isSome tl_old andalso is_older( valOf tl_old, hd dates )
			then tl_old
			else SOME (hd dates)
		end



(* helper functions for challenge problem 12 *)
fun not_already_in( haystack : int list, key : int ) =
	if null haystack
	then true
	else if hd haystack = key
		then false
		else not_already_in( tl haystack, key )
		
fun remove_duplicates( oldlist : int list ) = 
	if null oldlist
	then []
	else 
		let
			val tl_newmonths = remove_duplicates( tl oldlist )
		in
			if not_already_in( tl_newmonths, hd oldlist )
			then hd oldlist :: tl_newmonths
			else tl_newmonths
		end

(* Challenge Problem 12, part 1 *)
fun number_in_months_challenge( dates : (int*int*int) list, months : int list ) =
	number_in_months( dates, remove_duplicates( months ) )

(* Challenge Problem 12, part 2 *)
fun dates_in_months_challenge( dates : (int*int*int) list, months : int list ) =
	dates_in_months( dates, remove_duplicates( months ) )

(* Challenge Problem 13 *)
fun reasonable_date ( date : int*int*int ) =
	(* check year *)
	if #1 date < 1
	then false
	else
		(* check month *)
		if #2 date < 1 orelse #2 date > 12
		then false
		else
			let 
				val days_in_month = 
				(* if date is a leap year, feb has different length *)
				if ((#1 date) mod 4 = 0 andalso (#1 date) mod 100 <> 0)
					orelse (#1 date) mod 400 = 0
				then 
					[ 31, 29, 31, 30, 31, 30, 
					  31, 31, 30, 31, 30, 31 ]
				else
					[ 31, 28, 31, 30, 31, 30, 
					  31, 31, 30, 31, 30, 31 ]
				(* helper function for grabbing out of days_in_month *)
				fun get_days ( m : int , ms : int list ) =
					if m = 1
					then hd ms
					else get_days ( m-1 , tl ms )
			in
				if (#3 date) <= get_days( (#2 date), days_in_month ) andalso
				   (#3 date) >= 1
				then true
				else false
			end
