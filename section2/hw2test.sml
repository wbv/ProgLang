(* Homework2 Tests 
    expanded upon by Walter B. Vaughan*)

use "hw2.sml";

(* Problem 1a Tests *)
val test1a_a = all_except_option("string", ["string"]) = SOME []
val test1a_b = all_except_option("string", []) = NONE
val test1a_c = all_except_option("s", ["string", "bing", "s"]) = SOME ["bing", "string"]
val test1a_d = all_except_option("", ["string"]) = NONE
val test1a_e = all_except_option("string", ["words", "come", "string", "after", "this"]) = SOME ["come", "words", "after", "this"]
val test1a_f = all_except_option("string", ["string", "beans", "lol"]) = SOME ["beans", "lol"]
val test1a_g = all_except_option("kittens", ["string", "beans", "lol"]) = NONE

(* Problem 1b Tests TODO: ADD MORE!? *)
val test1b_a = get_substitutions1([["Fred", "Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],"Fred") = ["Fredrick","Freddie","F"]
val test1b_b = get_substitutions1([["foo"],["there"]], "foo") = []
val test1b_c = get_substitutions1([["foo", "fighters"],["there"]], "foo") = ["fighters"]

(* Problem 1c Tests TODO: ADD MORE!? *)
val test1c_a = get_substitutions2([["Fred", "Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],"Fred") = ["Freddie","F","Fredrick"]
val test1c_b = get_substitutions2([["foo"],["there"]], "foo") = []
val test1c_c = get_substitutions2([["foo", "fighters"],["there"]], "foo") = ["fighters"]

(* Problem 1d Tests TODO: ADD MORE! *)
val test1d_a = similar_names( [["Fred","Fredrick"],
                               ["Elizabeth","Betty"],
                               ["Freddie","Fred","F"]],
                              {first="Fred", middle="W", last="Smith"} ) =
	[ {first="Fredrick", last="Smith", middle="W"},
	  {first="F",        last="Smith", middle="W"},
	  {first="Freddie",  last="Smith", middle="W"},
	  {first="Fred",     last="Smith", middle="W"} ]

(*
val test5 = card_color((Clubs, Num 2)) = Black

val test6 = card_value((Clubs, Num 2)) = 2

val test7 = remove_card([(Hearts, Ace)], (Hearts, Ace), IllegalMove) = []

val test8 = all_same_color([(Hearts, Ace), (Hearts, Ace)]) = true

val test9 = sum_cards([(Clubs, Num 2),(Clubs, Num 2)]) = 4

val test10 = score([(Hearts, Num 2),(Clubs, Num 4)],10) = 4

val test11 = officiate([(Hearts, Num 2),(Clubs, Num 4)],[Draw], 15) = 6

val test12 = officiate([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],
                       [Draw,Draw,Draw,Draw,Draw],
                       42)
             = 3

val test13 = ((officiate([(Clubs,Jack),(Spades,Num(8))],
                         [Draw,Discard(Hearts,Jack)],
                         42);
               false) 
              handle IllegalMove => true)

*)
