--- DAY 1 ---

Transition Systems: (S, S_i, S_f, -->)
Partially Ordered Sets: (S, <=)
    - Reflexive
    - Antisymmetric
    - Transitive

    - Least upper bound, Greatest lower bound of a subset of S

Complete Partial Orders: All increasing chains have a least upper bound
    - (N, <=) -> not CPO
    - (bitvector, \subset) -> CPO

Complete lattice: (C, <=, bottom, top, \cup (join), \cap (meet))
    - bottom = meet C
    - top    = join C

    - Example: Integer Lattice: (Z U {-inf, +inf}, <=, -inf, +inf, max, min)

Set of lattice functions:
    - Set of total functions D -> C, codomain is a complete lattice, then 
      set of functions is also a complete lattice:
        - f <=' f' <=> \forall x, f(x) <=' f'(x)

Galois connections: A pair of functions \alpha, \gamma between two posets
    - (C, [=), (A, <=), \alpha: C -> A, \gamma: A -> C

    - \forall a \in A, c \in C : \alpha(c) <= a <=> c [= \gamma(a)

    - Generalization of isomorphisms (:O)

Fixpoints: f(x) = x, x -> fixpoint of f

    - L -> complete lattice
      f : L -> L, f -> monotone function
      then f's fixed points -> complete lattice

Collecting Semantics: Collection of all the states, defined by structural
operational semantics, of the program in a given point

Abstractions are represented as Galois connections which connect complete
lattices through \alpha and \gamma.
    - Compose transition function by \alpha . F . \gamma

Fixed point transfer theorem: Using this we compute a sound approximation of
                              collecting semantics.

    - If F and F' are monotone and \alpha . F . \gamma <= F' (I think the <=
      here is the set of lattice functions thingy, i.e. it's <= for all inputs)
      
      => \alpha(lfp F) <= lfp F' (lfp -> least fixed point)

      This tells us that if this theorem applies, our approximation will be
      sound.
