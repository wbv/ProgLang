(* test cases for list_product *)
val x = list_product [];
val y = list_product [5];
val z = list_product [2,4,2];

val test1 = x = 1;
val test2 = y = 5;
val test3 = z = 16;
