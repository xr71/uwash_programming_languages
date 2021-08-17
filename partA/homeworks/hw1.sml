(* function is_older should take two dates and evalutes to bool *)
(* it's true if first argument is a date that comes before second argument *)
(* type is int*int*int via YYYYMMDD *)
fun is_older(prDate1: int*int*int, prDate2: int*int*int) =
    (* if (#1 prDate1) < (#1 prDate2) *)
    (* then true *)
    (* else *)
    (*     if (#2 prDate1) <> (#2 prDate2) *)
    (*     then (#2 prDate1) < (#2 prDate2) *)
    (*     else (#3 prDate1) < (#3 prDate2) *)
    ((#1 prDate1) * 10000 + (#2 prDate1) * 100 + (#3 prDate1)) < ((#1 prDate2) * 10000 + (#2 prDate2) * 100 + (#3 prDate2))


fun number_in_month(dates: (int*int*int) list, month: int) =
    if (null dates)
    then 0
    else
        let val tl_ans = number_in_month((tl dates), month)
        in if (#2 (hd dates)) = month
           then 1 + tl_ans
           else tl_ans
        end



fun number_in_months(dates: (int*int*int) list, months: int list) =
    if (null months)
    then 0
    else
        number_in_month(dates, (hd months)) + number_in_months(dates, (tl months))


(* 4 *)
(* now we need to take in a list of dates and a month --> but returns a new list holding the dates*)
(* the list should return the dates in the same order as it was passed in *)
fun dates_in_month(dates: (int*int*int) list, month: int) =
    if (null dates)
    then []
    else
        let val tl_ans = dates_in_month((tl dates), month)
        in if (#2 (hd dates)) = month
           then (hd dates) :: tl_ans
           else tl_ans
        end

fun dates_in_months(dates: (int*int*int) list, months: int list) =
    if (null months)
    then []
    else
        dates_in_month(dates, (hd months)) @ dates_in_months(dates, (tl months))


(* 6 *)
(* get_nth takes list of strings and an int n, returns nth elem *)
fun get_nth(xs: string list, n: int) =
    if n = 1
    then (hd xs)
    else get_nth((tl xs), n-1)


(* 7 *)
(* convert a date to a string representation, do not use conditionals for months *)
(* use ^ for string concat and Int.toString *)
fun date_to_string(date: (int*int*int)) =
    let val months = [
        "January", "February", "March", "April", "May", "June", "June",
        "July", "August", "September", "October", "November", "December"
    ]
    in
        get_nth(months, (#2 date)) ^ " " ^ Int.toString((#3 date)) ^ ", " ^ Int.toString((#1 date))
    end



(* 8 *)
(* takes an int, sum, and an int list, that returns an int n, such that the first n elems
   of the int list is less than the sum
*)
fun number_before_reaching_sum(sum: int, xs: int list) =
    if sum <= (hd xs)
    then 0
    else
        1 + number_before_reaching_sum(sum - (hd xs), (tl xs))


(* 9 *)
(* takes a day of year, int between 1 and 365, returns what month the day is in *)
fun what_month(day: int) =
    let val numdays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    in
        1 + number_before_reaching_sum(day, numdays)
    end



(* 10 *)
(* takes in two args, day1 and day2, both are ints, and returns an int list *)
fun month_range(day1: int, day2: int) =
    if day1 > day2
    then []
    else what_month(day1) :: month_range(day1+1, day2)


(* 11 *)
(* we need to return a (int*int*int) option *)
(* oldest takes a list of dates, evals to NONE if no dates, but SOME d if d is oldest *)
(* consider max function from class video *)
(* val test11 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31) *)
fun oldest(dates: (int*int*int) list) =
    if (null dates)
    then NONE
    else let
        fun oldest_nonempty(dates: (int*int*int) list) =
            if (null (tl dates))
            then (hd dates)
            else
                let val tl_ans = oldest_nonempty(tl dates)
                in
                    if is_older(hd dates, tl_ans)
                    then (hd dates)
                    else tl_ans
                end
    in SOME (oldest_nonempty dates)
    end


