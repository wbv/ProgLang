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

(* Problem 4a Tests (copy of 2) *)
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

(* Problem 6 Tests *)
val test06_a = rev_string "abc" = "cba"
val test06_b = rev_string "" = ""
val test06_c = rev_string "NANERS" = "SRENAN"
val test06_d = rev_string "Tacocat" = "tacocaT"
val test06_e = rev_string "raceCar" = "raCecar"
val test06_f = rev_string "8675309" = "9035768"

(* Problem 7 Tests *)
val test07_a = first_answer (fn x => if x > 3 then SOME x else NONE) [1,2,3,4,5] = 4
val test07_b = first_answer (fn x => if x = 5 then SOME x else NONE) [1,2,3,4,5] = 5
val test07_c = first_answer (fn x => if x > 3 then SOME ~69 else NONE) [1,2,3,4,5] = ~69
val test07_d = first_answer (fn x => if true then SOME 0 else NONE) [1,2,3,4,5] = 0
val test07_e = ((first_answer (fn x => if x < ~1 then SOME 0 else NONE) [1,2,3,4,5] = 0; false) handle NoAnswer => true)
val test07_f = ((first_answer (fn x => if x = 1 then SOME 24 else NONE) [] = 0; false) handle NoAnswer => true)

(* Problem 8 Tests *)
val test08_a = all_answers (fn x => if x = 1 then SOME [x] else NONE) [2,3,4,5,6,7] = NONE
val test08_b = all_answers (fn x => if true then SOME [x] else NONE) [1,2,3] = SOME [[3],[2],[1]]
val test08_c = all_answers (fn x => if x = 0 then SOME x else NONE) [0,0,0] = SOME [0,0,0]
val test08_d = all_answers (fn x => if x = 0 then SOME x else NONE) [0,0,1] = NONE
val test08_e = all_answers (fn x => if x = 0 then SOME x else NONE) [] = SOME []

(* Problem 9a Tests *)
val test09_a = count_wildcards Wildcard = 1
val test09_b = count_wildcards (TupleP [Wildcard,Wildcard]) = 2
val test09_c = count_wildcards (Variable "nope") = 0
val test09_d = count_wildcards UnitP = 0
val test09_e = count_wildcards (ConstP 12) = 0
val test09_f = count_wildcards (TupleP [(TupleP [Wildcard,Wildcard]), Wildcard]) = 3
(* Problem 9b Tests *)
val test09_g = count_wild_and_variable_lengths (Variable("a")) = 1
val test09_h = count_wild_and_variable_lengths (TupleP [Variable("a"),Wildcard]) = 2
val test09_i = count_wild_and_variable_lengths (Variable("blah")) = 4
val test09_j = count_wild_and_variable_lengths (Variable("")) = 0
val test09_k = count_wild_and_variable_lengths (TupleP [Variable("Mult"),Variable("iple.")]) = 9
val test09_l = count_wild_and_variable_lengths (UnitP) = 0
val test09_m = count_wild_and_variable_lengths (ConstP 69) = 0

(* Problem 9c Tests *)
val test09_n = count_some_var ("x", Variable("x")) = 1;
val test09_o = count_some_var ("y", Variable("x")) = 0;
val test09_p = count_some_var ("z", TupleP [Variable("x"), Variable("y"), Variable("z"), Variable("z")]) = 2;
val test09_q = count_some_var ("x", ConstP 12) = 0;
val test09_r = count_some_var ("x", UnitP) = 0;
val test09_s = count_some_var ("x", Wildcard) = 0;
val test09_t = count_some_var ("x", ConstructorP("x",Variable("y"))) = 0;
val test09_u = count_some_var ("x", ConstructorP("y",Variable("x"))) = 1;

(* Problem 10 Tests *)
val test10_a = check_pat (Variable("x")) = true
val test10_b = check_pat (ConstP 24) = true
val test10_c = check_pat (TupleP [Variable("x"),Variable("x")]) = false
val test10_d = check_pat (TupleP [Variable("x"),Variable("y")]) = true
val test10_e = check_pat (UnitP) = true
val test10_f = check_pat (Wildcard) = true
val test10_g = check_pat (TupleP [TupleP [Variable("x"),Variable("y")], Variable("x")]) = false
val test10_h = check_pat (ConstructorP("x",Variable("x"))) = true
val test10_i = check_pat (TupleP [ConstructorP("x",Variable("x")),ConstructorP("x",Variable("y"))]) = true
val test10_j = check_pat (TupleP [ConstructorP("x",Variable("x")),ConstructorP("y",Variable("x"))]) = false

(* Problem 11 Tests *)
val test11_a = match (Const(1), UnitP) = NONE
val test11_b = match (Const(1), ConstP(1)) = SOME []
val test11_c = match (Const(1), ConstP(2)) = NONE
val test11_d = match (Unit, UnitP) = SOME []
val test11_e = match (Const(25), Wildcard) = SOME []
val test11_f = match (Constructor("two",Const(2)), ConstructorP("two", ConstP(2))) = SOME []
val test11_g = match (Constructor("two",Const(3)), ConstructorP("two", ConstP(2))) = NONE
val test11_h = match (Constructor("two",Const(2)), ConstructorP("tre", ConstP(2))) = NONE

(*
val test12 = first_match Unit [UnitP] = SOME []
*)
