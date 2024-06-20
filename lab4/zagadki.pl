% Definicja predykatu szyfr/1
szyfr(Kod) :-
    Kod = [A, B, C, D, E, F, G, H, I],
    member(A, [1, 2, 3, 4, 5, 6, 7, 8]),
    member(B, [1, 2, 3, 4, 5, 6, 7, 8]),
    member(C, [1, 2, 3, 4, 5, 6, 7, 8]),
    member(D, [1, 2, 3, 4, 5, 6, 7, 8]),
    member(E, [1, 2, 3, 4, 5, 6, 7, 8]),
    member(F, [1, 2, 3, 4, 5, 6, 7, 8]),
    member(G, [1, 2, 3, 4, 5, 6, 7, 8]),
    member(H, [1, 2, 3, 4, 5, 6, 7, 8]),
    member(I, [1, 2, 3, 4, 5, 6, 7, 8]),
    A is D + E,
    B is 2 * F,
    C mod 5 =\= 0,
    D is 1,
    F is H - 2,
    G mod 3 =:= 0,
    H is 2 * A,
    I is H - 1.

assign_digits([], _).
assign_digits([D|Ds], List):-
    select(D, List, NewList),
    assign_digits(Ds, NewList).



