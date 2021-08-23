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
