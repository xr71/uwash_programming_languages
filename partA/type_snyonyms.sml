(* use just type aname = t *)

datatype suit = Club
       |  Diamond
       |  Heart
       | Spade

datatype rank = Jack
       |  Queen
       | King
       | Ace
       | Num of int

type card = suit * rank;
