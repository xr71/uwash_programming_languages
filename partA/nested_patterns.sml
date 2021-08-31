
fun nondecreasing xs =
    case xs of
        [] => true
      | x:xs' => case xs' of
                     [] => true
                   | y::ys' => y and also nondecreasing xs';

(* better to use nested matching *)
fun nondec_pattern xs =
    [] => true
  | x::[] => true
  | head::(neck::rest) => head <= neck and also nondec_pattern (neck::rest);
