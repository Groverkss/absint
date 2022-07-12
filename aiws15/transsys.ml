module type Transsys =
sig
  type state
  val initstates : state list
  val next : state -> state list
  val printstate : state -> unit
end

module Whileprog : Transsys =
struct
  type state = int
  let initstates = [0]
  let next x = if x < 100 then [x+1] else []
  let printstate x = print_int x; print_string " ";;
end

module Reachstates (T : Transsys) =
struct
  module Mystateset =
    Set.Make(struct
               type t = T.state
	       let compare = Stdlib.compare
	     end)
  
  (* f : T.state set -> T.state set *)
  let f s =
    Mystateset.union
      (Mystateset.of_list T.initstates)
      (Mystateset.fold
	 (fun e acc ->
	   Mystateset.union
	     (Mystateset.of_list (T.next e))
	     acc)
	 s
	 Mystateset.empty)

  let print slst =
    Mystateset.iter T.printstate slst;
    print_string "\n";;

  let lfp () =
    let rec kleene currstate =
      let newstate = f currstate in
      if (newstate = currstate) then currstate else kleene newstate in
    kleene Mystateset.empty
end

module Whileprogreachable = Reachstates(Whileprog);;

Whileprogreachable.print (Whileprogreachable.lfp ())