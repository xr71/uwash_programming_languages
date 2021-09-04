(* dont give the function a name at all *)
fun n_times (f, n, x) =
    if n = 0
    then x
    else f (n_times(f, n-1, x));


(* we could also use a let *)
fun triple_n_times_let (n,x) =
    let
        fun triple x = 3*x
    in
        n_times (triple, n, x)
    end;


(* or we can use fn for anonymous *)
fun triple_n_times (n,x) =
    n_times (fn x => 3*x, n, x);

