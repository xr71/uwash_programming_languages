(* sometimes the type checker is smarter, and decides that 'a is a more reusable type *)
fun partial_sum (x,y,z) =
    x + z;
(* this will not have a type int*int*int, instead, it will be int*'a*int *)

(* this is like an unexpected form of polymorphism *)


(* 'a ==> note that 'a is a general type but it must agree in the overall use of the entire 'a type in the function *)
(* for example:  'a list * 'a list -> must return 'a list *)


(* EQUALITY TYPES *)
(* ''a list * ''a --> bool *)
(* must be compatible with the = operator *)
