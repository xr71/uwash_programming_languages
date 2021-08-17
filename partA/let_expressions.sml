(* introducing local variables *)

(* has format let ... in ... end *)
fun silly1(z: int) =
    let
        val x = if z>0 then z else 34
        val y = x + z + 9
    in
        if x>y then x*2 else y*y
    end
  ;

(* this has type int -> int*)
silly1(5);


fun silly2() =
    let
        val x=1
    in
        (let val x=2 in x+1 end) + (let val y=x+2 in y+1 end)
    end
;
  silly2();


(* nested functions *)
fun count(from: int, to: int) =
    if from=to
    then to::[]
    else from::count(from+1, to)

fun countup_from1(x: int) =
    count(1, x)

(* what if the function should be private only? *)
fun countup_from1_nest (x: int) =
    let
        fun count (from: int, to: int) =
            if from=to
            then to::[]
            else from::count(from+1, to)
    in
        count(1,x)
    end
;


(* even simpler *)
fun countup_from1_nest2 (x: int) =
    let
        fun count (from: int) =
            if from=x
            then x::[]
            else from::count(from+1)
    in
        count(1)
    end
;
countup_from1_nest2(5);



