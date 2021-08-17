
fun old_max (xs: int list) =
    if null xs
    then 0
    else if null (tl xs)
    then (hd xs)
    else
        let val tl_ans = old_max(tl xs)
        in
            if (hd xs) > tl_ans
            then (hd xs)
            else tl_ans
        end
  ;

    (* options - t option ==> NONE or SOME e *)
    (* accessing - isSome or valOf  *)

(* for example: returning a int option *)
fun max1 (xs: int list) =
    if null xs
    then NONE
    else
        let val tl_ans = max1(tl xs)
        in if isSome tl_ans andalso valOf tl_ans > (hd xs)
            then tl_ans
            else
                SOME (hd xs)
        end
;

max1([]);
max1([1,2,3,4,5]);
max1([5,3,1,2,4]);

