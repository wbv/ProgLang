(* Homework3 Tests, expanded up on by Walter B. Vaughan *)

use "hw3.sml";

(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

(* Problem 1 Tests *)
val test01_a = only_capitals ["A","B","C"] = ["A","B","C"]
val test01_b = only_capitals ["A","b","c"] = ["A"]
val test01_c = only_capitals [] = []
val test01_d = only_capitals ["All","But","Carl"] = ["All","But","Carl"]
val test01_e = only_capitals ["all","But","Cats"] = ["But","Cats"]
val test01_f = only_capitals ["huehue"] = []
val test01_g = only_capitals ["69!"] = []

(*
val test2 = longest_string1 ["A","bc","C"] = "bc"

val test3 = longest_string2 ["A","bc","C"] = "bc"

val test4a= longest_string3 ["A","bc","C"] = "bc"

val test4b= longest_string4 ["A","B","C"] = "C"

val test5 = longest_capitalized ["A","bc","C"] = "A";

val test6 = rev_string "abc" = "cba";

val test7 = first_answer (fn x => if x > 3 then SOME x else NONE) [1,2,3,4,5] = 4

val test8 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [2,3,4,5,6,7] = NONE

val test9a = count_wildcards Wildcard = 1

val test9b = count_wild_and_variable_lengths (Variable("a")) = 1

val test9c = count_some_var ("x", Variable("x")) = 1;

val test10 = check_pat (Variable("x")) = true

val test11 = match (Const(1), UnitP) = NONE

val test12 = first_match Unit [UnitP] = SOME []
*)
