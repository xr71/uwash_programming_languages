datatype my_int_list =
         Empty
         | Cons of int * my_int_list;

val x = Cons(4, Cons(3, Empty));

fun append_my_list(xs, ys) =
    case xs of
        Empty => ys
      | Cons (x, xs') => Cons(x, append_my_list(xs', ys));
