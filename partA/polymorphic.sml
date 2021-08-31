datatype 'a option = NONE
                   | SOME of 'a;

datatype 'a mylist = Empty
                   | Cons of 'a * 'a mylist;

datatype ('a, 'b) tree =
         Node of 'a * ('a, 'b) tree * ('a, 'b) tree
         | Leaf of 'b;


(* difference is in type checking - functions will be polymorphic or not based on how data is used *)
(* every val-binding in SML is just pattern matching *)
(* every function in ML actually takes exactly one argument *)


(* pattern works with eachof types as well *)
(* we can bind the elements of a seq using pattern (x1,...,xn) *)
fun sum_triple triple =
    case triple of
        (x, y, z) => x+y+z;

(* val p = e, where p is a pattern, p matches the entire expression or part of the expression *)
fun sum_triple_let triple =
    let val (x,y,z) = triple
    in
        x + y +z
    end;

fun sum_trple_pattern (x,y,z) =
    x + y + z;

fun full_name {first=x, middle=y, last=z} =
    x ^ " " ^ y ^ " " ^ z;

(* this might look like a function that takes in 3 arguments, how does SML tell the difference? *)
(* the input args is really like a single arg, all functions in ML just takes in one arg *)

