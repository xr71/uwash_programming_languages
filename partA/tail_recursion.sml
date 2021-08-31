fun fact n =
    let fun aux (n, acc) =
        if n=0 then acc
        else aux (n-1, acc*n)
    in
        aux (n, 1)
    end;

val x = fact 3;

(* it is simply unnecessary to keep around a call stack frame *)
(* so pop the caller before the call -- callee then reuses the same stack space that the caller was using *)

(* so what is happening with our fact function *)
(* replace fact 3 with aux(3,1) *)
(* the call space then becomes aux(2,3) *)
(* then aux(1,6) *)
(* aux (0,6)  then immediately returns the answer 6 *)


(* ACCUMULATORS *)
(* we hold the intermediary answers so far in the recursion *)
(* the final result is just the final accumulator *)

(* example *)
fun sum xs =
    let fun aux (xs, acc) =
        case xs of
            [] => acc
          | x::xs' => aux(xs', x+acc)
    in 
        aux(xs, 0)
    end;

val xsum = sum([1,2,3,4,5]);


(* reversing a list *)
fun rev xs =
    let fun aux (xs, acc) =
        case xs of
            [] => acc
          | x :: xs' => aux(xs', x::acc)
    in
        aux (xs, [])
    end;

