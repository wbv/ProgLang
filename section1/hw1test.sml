(* Homework1 Test Cases
   provided by Instructor, expanded on by Walter B. Vaughan *)

(* added to make testing a one-liner on the terminal *)
use "hw1.sml";

val test1a = is_older((1,2,3),(2,3,4)) = true;
val test1b = is_older((1,2,3),(1,1,1)) = false;
val test1c = is_older((1,2,3),(1,2,3)) = false;
val test1d = is_older((1,2,3),(1,3,2)) = true;
val test1e = is_older((1,2,3),(1,3,4)) = true;
val test1f = is_older((1,2,3),(1,2,4)) = true;
val test1g = is_older((1,2,3),(1,2,2)) = false;
val test1h = is_older((1,2,3),(0,2,3)) = false;

val test2a = number_in_month([(2012,2,28),(2013,12,1)],2) = 1;
val test2b = number_in_month([(2012,2,28),(2013,12,1)],12) = 1;
val test2c = number_in_month([(2012,2,28),(2013,12,1)],3) = 0;
val test2d = number_in_month([(2012,2,28),(2013,2,1)],2) = 2;
val test2e = number_in_month([(2012,2,28)],2) = 1;
val test2f = number_in_month([(2012,2,28)],3) = 0;
val test2g = number_in_month([(2012,2,28),(2013,12,1),(2012,2,8),(2013,2,4)],2) = 3;
val test2h = number_in_month([(2012,2,28),(2013,12,1),(2012,2,8),(2013,2,4)],3) = 0;
val test2i = number_in_month([(2012,2,28),(2013,12,1),(2012,2,8),(2013,2,4)],12) = 1;
val test2j = number_in_month([(2012,12,28),(2013,12,1)],2) = 0;
val test2k = number_in_month([],12) = 0;

(* perhaps need more tests *)
val test3a = number_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3;
val test3b = number_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[]) = 0;
val test3c = number_in_months([],[2,3,4]) = 0;
val test3d = number_in_months([],[]) = 0;


(* I made these based off the test2 series *)
val test4a = dates_in_month([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)];
val test4b = dates_in_month([(2012,2,28),(2013,12,1)],12) = [(2013,12,1)];
val test4c = dates_in_month([(2012,2,28),(2013,12,1)],3) = [];
val test4d = dates_in_month([(2012,2,28),(2013,2,1)],2) = [(2012,2,28),(2013,2,1)];
val test4e = dates_in_month([(2012,2,28)],2) = [(2012,2,28)];
val test4f = dates_in_month([(2012,2,28)],1) = [];
val test4g = dates_in_month([(2012,2,28),(2013,12,1),(2012,2,8),(2013,2,4)],2) = [(2012,2,28),(2012,2,8),(2013,2,4)];
val test4h = dates_in_month([(2012,2,28),(2013,12,1),(2012,2,8),(2013,2,4)],3) = [];
val test4i = dates_in_month([(2012,2,28),(2013,12,1),(2012,2,8),(2013,2,4)],12) = [(2013,12,1)];
val test4j = dates_in_month([(2012,12,28),(2013,12,1)],2) = [];
val test4k = dates_in_month([],12) = [];

(* just like test3 suite, I'm not sure what to add here *)
val test5a = dates_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)];
val test5b = dates_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[]) = [];
val test5c = dates_in_months([],[2,3,4]) = [];
val test5d = dates_in_months([],[]) = [];

val test6a = get_nth(["hi", "there", "how", "are", "you"], 2) = "there";
val test6b = get_nth(["hi", "there", "how", "are", "you"], 1) = "hi";
val test6c = get_nth(["hi", "there", "how", "are", "you"], 5) = "you";
val test6d = get_nth(["hi", "there", "how", "are", "you"], 0) = "hi";

val test7a = date_to_string((2013, 6, 1)) = "June 1, 2013";
val test7b = date_to_string((2012, 1, 31)) = "January 31, 2012";
val test7c = date_to_string((2009, 2, 15)) = "February 15, 2009";
val test7d = date_to_string((1996, 3, 10)) = "March 10, 1996";
val test7e = date_to_string((2002, 4, 6)) = "April 6, 2002";
val test7f = date_to_string((2013, 5, 5)) = "May 5, 2013";
val test7g = date_to_string((1993, 6, 2)) = "June 2, 1993";
val test7h = date_to_string((1776, 7, 4)) = "July 4, 1776";
val test7i = date_to_string((2013, 8, 13)) = "August 13, 2013";
val test7j = date_to_string((2001, 9, 11)) = "September 11, 2001";
val test7k = date_to_string((2000, 10, 31)) = "October 31, 2000";
val test7l = date_to_string((1969, 11, 5)) = "November 5, 1969";
val test7m = date_to_string((1941, 12, 7)) = "December 7, 1941";

val test8a = number_before_reaching_sum(10, [1,2,3,4,5]) = 3;
val test8b = number_before_reaching_sum(7, [1,2,3,4,5]) = 3;
val test8c = number_before_reaching_sum(6, [1,2,3,4,5]) = 2;
val test8d = number_before_reaching_sum(5, [1,2,3,4,5]) = 2;
val test8e = number_before_reaching_sum(2, [1,2,3,4,5]) = 1;
val test8f = number_before_reaching_sum(0, [1,2,3,4,5]) = 0;

val test9a = what_month(70) = 3;
val test9b = what_month(1) = 1;
val test9c = what_month(31) = 1;
val test9d = what_month(32) = 2;
val test9e = what_month(58) = 2;
val test9f = what_month(59) = 2;
val test9g = what_month(60) = 3;
val test9h = what_month(365) = 12;
val test9i = what_month(350) = 12;

(* I shortened the name so that every test has the same width *)
val tst10a = month_range(31, 34) = [1,2,2,2];
val tst10b = month_range(29, 34) = [1,1,1,2,2,2];
val tst10c = month_range(33, 34) = [2,2];
val tst10d = month_range(34, 34) = [2];
val tst10e = month_range(365, 34) = [];

val tst11a = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31);
val tst11b = oldest([]) = NONE;
val tst11c = oldest([(2012,2,28),(2011,3,31),(2011,3,30)]) = SOME (2011,3,30);
val tst11d = oldest([(2010,2,28),(2011,3,31),(2011,4,28)]) = SOME (2010,2,28);
val tst11e = oldest([(2012,3,27),(2012,2,28),(2012,4,26)]) = SOME (2012,2,28);

(* test cases for challenge problem 12 *)
val tst12a = number_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3;
val tst12b = number_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[]) = 0;
val tst12c = number_in_months_challenge([],[2,3,4]) = 0;
val tst12d = number_in_months_challenge([],[]) = 0;
val tst12e = number_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,2,2,3,4]) = 3;
val tst12f = number_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,3,4,3,3,3,4,2]) = 3;

(* part 2 of challenge problem 12 *)
val tst12A = dates_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)];
val tst12B = dates_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[]) = [];
val tst12C = dates_in_months_challenge([],[2,3,4]) = [];
val tst12D = dates_in_months_challenge([],[]) = [];
val tst12E = dates_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,2,2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)];
val tst12F = dates_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,3,4,3,3,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)];

