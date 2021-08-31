(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)

(* 1a - takes a string and a string list --> returns NONE or SOME lst *)
fun all_except_option (x: string, xs: string list) =
    case xs of
        [] => NONE
      | head::tail => if same_string(x, head) then SOME(tail)
                      else case all_except_option (x, tail) of
                               NONE => NONE
                             | SOME list' => SOME (head::list');

(* 1b - takes string list list and a string s --> returns a string list *)
(* use SML list-append operator @ *)
fun get_substitutions1 (xs: string list list, s: string) =
    case xs of
        [] => []
      | head::tail => case all_except_option (s, head) of
                          NONE => [] @ get_substitutions1 (tail, s)
                        | SOME list' => list' @ get_substitutions1 (tail, s);


(* 1c - same thing but using helper func in recursion *)
(* fun rev2 xs = *)
(*     let fun aux(xs,acc) = *)
(*             case xs of *)
(*                 [] => acc *)
(*               | x::xs' => aux(xs', x::acc) *)
(*     in *)
(*         aux(xs,[]) *)
(*     end *)
fun get_substitutions2 (xs: string list list, s: string) =
    let fun aux (xs, acc) =
            case xs of
                [] => acc
              | head::tail => case all_except_option (s, head) of
                                  NONE => aux (tail, acc)
                                | SOME list' => aux (tail, acc @ list')
    in
        aux (xs, [])
    end;


(* 1d - takes string list list and a full name of type records --> returns a list of full names list *)
fun similar_names (xs: string list list, fullname: {first:string, middle:string, last:string}) =
    let val {first=fname, middle=mname, last=lname} = fullname;
        val names = get_substitutions2 (xs, fname);
        fun aux (names) =
            case names of
                [] => []
              | head::tail => {first=head, middle=mname, last=lname} :: aux(tail)
    in
        {first=fname, middle=mname, last=lname}::aux(names)
    end;



(**********************************************************************************)
(* you may assume that Num is always used with values 2, 3, ..., 10
though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw

exception IllegalMove

(* put your solutions for problem 2 here *)

(* 2a - takes a card, which is suit * rank, and returns a color *)
fun card_color (c: suit, _) =
    case c of
        Clubs => Black
      | Spades => Black
      | Diamonds => Red
      | Hearts => Red;

(* 2b - takes a card, which is suit * rank, and returns its value *)
fun card_value (c: suit, n: rank) =
    case n of
        Num (i) => i
      | Ace => 11
      | _ => 10;

(* 2c - remove_card takes a list of cards cs, and a card c, and an exception e -->
 returns a list that has all elements of cs except c *)
fun remove_card (cs: card list, c: card, e) =
    case cs of
        [] => raise e
      | x::xs' => if x = c then xs' else x::remove_card(xs', c, e);


(* 2d - returns true if all cards in list is of same color - hint: use nested pattern matching from lecture *)
fun all_same_color (cs: card list) =
    case cs of
        [] => true
      | head::[] => true
      | head::neck::rest => (card_color (head) = card_color (neck) andalso all_same_color (neck::rest));


(* 2e - takes list of cards and returns sum, use aux that is tail recursive *)
fun sum_cards (cs: card list) =
    let fun aux (cs, acc) =
            case cs of
                [] => acc
              | (s, r)::xs' => card_value (s, r) + aux(xs', acc)
    in
        aux (cs, 0)
    end;



(* 2f - takes a card list and an int, the goal, and computes the score *)
(* RULES: sum of cards held,
   1 - if sum is greater than goal, the prelim score is 3 times sum-goal
   2 - else it is goal-sum
   3 - the final score then is the prelim score UNLESS all cards are same color,
       then it is prelim score divided by 2*)
fun score (cs: card list, goal: int) =
    let val heldvalue = sum_cards (cs);
        val samecolor = all_same_color (cs);
        val prelim = if heldvalue > goal then 3 * (heldvalue-goal) else goal-heldvalue;
    in
        if samecolor then prelim div 2 else prelim
    end;



(* 2g - officiate runs the game, takes a card list, a move list, and a goal *)
(* use locally defined recursive aux *)
(* game starts with empty list of held cards *)
(* game ends if there are no more moves *)
(* player discards some card c, play continues, if c is not in held cards then raise IllegalMove exception *)
(* if player draws and card list is already empty, game is over. If drawing causes sum of held cards to exceed goal, the game is over. Else play continues with a larger held-cards and smaller card-list *)

(* val test11 = officiate ([(Hearts, Num 2),(Clubs, Num 4)],[Draw], 15) = 6 *)

fun officiate (cs: card list, moves: move list, goal: int) =
    let
        val heldcards = [];
        fun aux (cs, moves, heldcards) =
            case moves of
                [] => score (heldcards, goal)
              | (Discard (card))::moves' => aux(cs, moves', remove_card (heldcards, card, IllegalMove))
              | (Draw)::moves' => case cs of
                                  [] => score (heldcards, goal)
                                 | head::cs' => if sum_cards (head::heldcards) > goal
                                                 then score(head::heldcards, goal)
                                                 else aux (cs', moves', head::heldcards)
    in
        aux (cs, moves, heldcards)
    end;

