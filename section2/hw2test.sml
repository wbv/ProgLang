(* Homework2 Tests 
    expanded upon by Walter B. Vaughan*)

use "hw2.sml";

(* Problem 1a Tests *)
val test01a = all_except_option("string", ["string"]) = SOME []
val test01b = all_except_option("string", []) = NONE
val test01c = all_except_option("s", ["string", "bing", "s"]) = SOME ["bing", "string"]
val test01d = all_except_option("", ["string"]) = NONE
val test01e = all_except_option("string", ["words", "come", "string", "after", "this"]) = SOME ["come", "words", "after", "this"]
val test01f = all_except_option("string", ["string", "beans", "lol"]) = SOME ["beans", "lol"]
val test01g = all_except_option("kittens", ["string", "beans", "lol"]) = NONE

(* Problem 1b Tests TODO: ADD MORE!? *)
val test02a = get_substitutions1([["Fred", "Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],"Fred") = ["Fredrick","Freddie","F"]
val test02b = get_substitutions1([["foo"],["there"]], "foo") = []
val test02c = get_substitutions1([["foo", "fighters"],["there"]], "foo") = ["fighters"]

(*
val test3 = get_substitutions2([["foo"],["there"]], "foo") = []

val test4 = similar_names([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], {first="Fred", middle="W", last="Smith"}) =
	    [{first="Fred", last="Smith", middle="W"}, {first="Fredrick", last="Smith", middle="W"},
	     {first="Freddie", last="Smith", middle="W"}, {first="F", last="Smith", middle="W"}]

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
