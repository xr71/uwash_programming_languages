fun n_times (f, n: int, x) =
    if n = 0
    then x
    else f (n_times(f, n-1, x));


fun add_one (x) =
    x + 1;
