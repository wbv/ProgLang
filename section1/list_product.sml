(* from List Functions lecture in Section 1 *)
fun list_product (xs : int list) =
	if null xs
	then 1
	else hd xs * list_product(tl xs)
