(* theres just 3 building blocks for type building in any language:
 each of
 one of
 self reference *)

(* examples:  tuples, options, lists, nest compound types *)
(* also records, pattern matching, a way to build and use one-of types *)

(* records *)
val x = { bar=(1+2, true andalso true), foo=(3,4), baz=(false,9) };
(* we can access a field in the record using the #key *)


(* tuples and syntactic sugar *)
(* we can turn a record into a tuple, by using position int as pair positions *)
val another_tuple = {2=6, 1=5, 4=3, 3=7};
(* in other words, tuples are just another way of writing certain records *)

