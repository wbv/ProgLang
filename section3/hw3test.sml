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

(* Problem 2 Tests *)
val test02_a = longest_string1 ["A","bc","C"] = "bc"
val test02_b = longest_string1 ["Abcd","bc","C"] = "Abcd"
val test02_c = longest_string1 [] = ""
val test02_d = longest_string1 ["A","b","C"] = "A"
val test02_e = longest_string1 ["","q","YEAH"] = "YEAH"
val test02_f = longest_string1 ["!!!","bc","C","???"] = "!!!"
val test02_g = longest_string1 ["A"] = "A"

(* Problem 3 Tests (like 2 but with slight differences) *)
val test03_a = longest_string2 ["A","bc","C"] = "bc"
val test03_b = longest_string2 ["Abcd","bc","C"] = "Abcd"
val test03_c = longest_string2 [] = ""
val test03_d = longest_string2 ["A","b","C"] = "C"
val test03_e = longest_string2 ["","q","YEAH"] = "YEAH"
val test03_f = longest_string2 ["!!!","bc","C","???"] = "???"
val test03_g = longest_string2 ["A"] = "A"

(* Problem 4a Tests ( copy of 2 ) *)
val test04_a = longest_string3 ["A","bc","C"] = "bc"
val test04_b = longest_string3 ["Abcd","bc","C"] = "Abcd"
val test04_c = longest_string3 [] = ""
val test04_d = longest_string3 ["A","b","C"] = "A"
val test04_e = longest_string3 ["","q","YEAH"] = "YEAH"
val test04_f = longest_string3 ["!!!","bc","C","???"] = "!!!"
val test04_g = longest_string3 ["A"] = "A"
(* Problem 4b Tests (copy of 3 ) *)
val test04_h = longest_string4 ["A","bc","C"] = "bc"
val test04_i = longest_string4 ["Abcd","bc","C"] = "Abcd"
val test04_j = longest_string4 [] = ""
val test04_k = longest_string4 ["A","b","C"] = "C"
val test04_l = longest_string4 ["","q","YEAH"] = "YEAH"
val test04_m = longest_string4 ["!!!","bc","C","???"] = "???"
val test04_n = longest_string4 ["A"] = "A"

(* Problem 5 Tests *)
val test05_a = longest_capitalized ["A","bc","C"] = "A"
val test05_b = longest_capitalized ["A","Bc","C"] = "Bc"
val test05_c = longest_capitalized ["Ab","Bc","C"] = "Ab"
val test05_d = longest_capitalized ["A"] = "A"
val test05_e = longest_capitalized ["Cocaine","Adderall","C"] = "Adderall"
val test05_f = longest_capitalized ["!!!!!!!!!!!","Shorty","said what?"] = "Shorty"
val test05_g = longest_capitalized [] = ""

(* Problem 6 Tests*)
val test06_a = rev_string "abc" = "cba"
val test06_b = rev_string "" = ""
val test06_c = rev_string "NANERS" = "SRENAN"
val test06_d = rev_string "Tacocat" = "tacocaT"
val test06_e = rev_string "raceCar" = "raCecar"
val test06_f = rev_string "8675309" = "9035768"

(*
val test7 = first_answer (fn x => if x > 3 then SOME x else NONE) [1,2,3,4,5] = 4

val test8 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [2,3,4,5,6,7] = NONE

val test9a = count_wildcards Wildcard = 1

val test9b = count_wild_and_variable_lengths (Variable("a")) = 1

val test9c = count_some_var ("x", Variable("x")) = 1;

val test10 = check_pat (Variable("x")) = true

val test11 = match (Const(1), UnitP) = NONE

val test12 = first_match Unit [UnitP] = SOME []
*)
