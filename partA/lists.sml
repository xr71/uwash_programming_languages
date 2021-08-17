(* null is a function in sml *)
val x = [1,3,5];

null x;
(* this returns a bool *)

(* we can use head and tail functions to grab first and remaining elems of a list *)
hd x;
tl x;

(* the empty list is an alpha list, meaning it can work with any type *)



(* LIST FUNCTIONS *)
fun sum_list (xs:int list) =
    if null xs
    then 0
    else hd xs + sum_list(tl xs)
;

(sum_list [1,2,3,4,5]);


(* a countdown function *)
fun countdown (n: int) =
    if n = 0
    then []
    else n :: countdown(n-1);
countdown 7;


(* appending two lists together recursively *)
fun append_lists (xs: int list, ys: int list) =
    if null xs
    then ys
    else (hd xs) :: (append_lists (tl xs, ys))
;
append_lists([1,3,5], [2,4,6]);


(* taking the product of all elems in a list *)
fun list_product(xs: int list) =
    if null xs
    then 1
    else (hd xs) * (list_product (tl xs))
;
list_product([1,3,5]);

(* factorial using existing functions *)
fun factorial(n: int) =
    list_product(countdown(n));

