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

(* Problem 1d Test TODO: ADD MORE! *)
val test1d_a = similar_names( [["Fred","Fredrick"],
                               ["Elizabeth","Betty"],
                               ["Freddie","Fred","F"]],
                              {first="Fred", middle="W", last="Smith"} ) =
	[ {first="Fredrick", last="Smith", middle="W"},
	  {first="F",        last="Smith", middle="W"},
	  {first="Freddie",  last="Smith", middle="W"},
	  {first="Fred",     last="Smith", middle="W"} ]

(* Problem 2a Tests *)
val test2a_a = card_color((Clubs, Num 2))   = Black
val test2a_b = card_color((Diamonds, King)) = Red
val test2a_c = card_color((Spades, Queen))  = Black
val test2a_d = card_color((Hearts, Ace))    = Red

(* Problem 2b Tests *)
val test2b_a = card_value((Clubs, Num 2))   = 2
val test2b_b = card_value((Diamonds, King)) = 10
val test2b_c = card_value((Spades, Queen))  = 10
val test2b_d = card_value((Hearts, Ace))    = 11

(* Problem 2c Tests *)
val test2c_a = remove_card([(Hearts, Ace)], (Hearts, Ace), IllegalMove) = []
val test2c_b = remove_card([(Hearts, Ace), (Hearts, King)], (Hearts, Ace), IllegalMove) = [(Hearts, King)]
val test2c_c = remove_card([(Spades, Ace), (Hearts, Ace)], (Hearts, Ace), IllegalMove) = [(Spades, Ace)]
(* For this test, if handle works then true, otherwise remove_card will
 * return an answer that definitely isn't (Clubs, Num 2) and give a false *)
val test2c_d = remove_card([(Spades, Ace)], (Hearts, Ace), IllegalMove) = [(Clubs, Num 2)] handle IllegalMove => true

(* Problem 2d Tests *)
val test2d_a = all_same_color([(Hearts, Ace), (Hearts, Ace)]) = true
val test2d_b = all_same_color([(Hearts, Ace), (Diamonds, Num 5)]) = true
val test2d_c = all_same_color([(Hearts, Ace), (Clubs, Ace)]) = false
val test2d_d = all_same_color([(Clubs, Jack), (Spades, Ace)]) = true

(* Problem 2e Tests *)
val test2e_a = sum_cards([(Clubs, Num 2),(Clubs, Num 2)]) = 4
val test2e_b = sum_cards([(Hearts, Num 2),(Spades, Num 2)]) = 4
val test2e_c = sum_cards([(Clubs, Num 9),(Clubs, Num 5)]) = 14
val test2e_d = sum_cards([(Clubs, Num 2),(Spades, Ace)]) = 13
val test2e_e = sum_cards([(Clubs, Num 2),(Clubs, Num 2), (Clubs, Num 3), (Clubs, Num 3)]) = 10
val test2e_f = sum_cards([(Clubs, King),(Spades, Queen)]) = 20
val test2e_g = sum_cards([(Hearts, Jack),(Diamonds, Ace)]) = 21

(* Problem 2f Tests *)
val test2f_a = score([(Hearts, Num 2),(Clubs, Num 4)],10) = 4
val test2f_b = score([(Spades, Num 2),(Clubs, Num 4)],10) = 2
val test2f_c = score([(Hearts, Ace),(Clubs, Num 4)],10) = 15
val test2f_d = score([(Hearts, Ace),(Diamonds, Num 4)],10) = 7
val test2f_e = score([(Hearts, Num 2),(Clubs, Num 4)],0) = 18

(* Problem 2g Tests *)
val test2g_a = officiate([(Hearts, Num 2),(Clubs, Num 4)],[Draw], 15) = 6
val test2g_b = officiate([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],
                         [Draw,Draw,Draw,Draw,Draw],
                         42)
             = 3
val test2g_c = ((officiate([(Clubs,Jack),(Spades,Num(8))],
                           [Draw,Discard(Hearts,Jack)],
                           42);
               false) 
               handle IllegalMove => true)
val test2g_d = officiate([(Hearts, Num 2),(Clubs, Num 4)],[], 15) = 7

(* Problem 3a Tests *)
val test3a_a = score_challenge([(Hearts, Ace)], 5) = 2
val test3a_b = score_challenge([(Hearts, Ace)], 11) = 0
val test3a_c = score_challenge([(Hearts, Ace)], 13) = 1
val test3a_d = score_challenge([(Hearts, Ace), (Clubs, Num 4)], 10) = 5
val test3a_e = score_challenge([(Hearts, Ace), (Clubs, Num 4)], 13) = 6
(* Gonna skip Problem 3b Tests because there is no added logic to be tested *)
(* ... yes, I know that's a bad reason. The real reason is I'm lazy. *)


