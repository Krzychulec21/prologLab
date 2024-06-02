take(0,_,[]).
take(_,[],[]).
take(N,[H|T], [H|R]) :- 
    N > 0,
    N1 is N - 1,
    take(N1, T, R).

drop(0,List,List).
drop(_,[],[]).
drop(N,[_|T], Result) :-
    N > 0,
    N1 is N - 1,
    drop(N1, T, Result).

init([_], []).
init(List, Result) :-
    List \= [],
    reverse(List, [_|Reversed]),
    reverse(Reversed, Result).

init2([_], []).
init2([], []).
init2(List, Result) :-
    List \= [],
    length(List, N),
    N1 is N - 1,
    take(N1, List, Result).

middle([], []).
middle([_], []).
middle([_,_], []).
middle([_|T], Result) :-
    reverse(T, [_|Reversed]),
    reverse(Reversed, Result).

split([],[],[]).
split([X], [X], []).
split([X, Y | Rest], [X|L1], [Y | L2]) :-
    split(Rest, L1, L2).

% permutation(P, L) -  P jest permutacją listy L
 
permutation([], []).
 
permutation(P, [H|T]) :-
    permutation(P1, T),        
    append(A, B, P1),      % P1 dzielimy na dwie części 
    append(A, [H|B], P).   % P powstaje poprzez wstawienie 
                           % elementu H w pewne miejsce listy P1

middle(N, L, R) :-
    length(L, Len),
    Len > 2 * N,
    drop(N, L, Dropped),
    reverse(Dropped, RevDropped),
    drop(N, RevDropped, RevMiddle),
    reverse(RevMiddle, R).

move([H|T], R) :-
    append(T, [H], R).