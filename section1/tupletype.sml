(* from the lecture Pairs and Other Tuples. 
   for a problem about getting the type of ans *)

val x = (3, (4, (5,6)));
val y = (#2 x, (#1 x, #2 (#2 x)));
(* one has to ask WHY at this point *)
val ans = (#2 y, 4);

