take(0,_,[]) :- !.
take(_,[],[]) :- !.
take(N,[H|T],[H|R]) :-
    N > 0,
    N1 is N - 1,
    take(N1, T, R).

drop(0, List, List) :-!.
drop(_, [],[]) :- !.
drop(N,[_|T], R) :-
    N > 0,
    N1 is N - 1,
    drop(N1,T,R).

init([_], []) :- !.
init(L, R) :-
    reverse(L, [_|Reversed]),
    reverse(Reversed, R).

init2([], []) :- !.
init2([_], []) :- !.
init2(List, Result) :-
    length(List,Length),
    N is Length -1,
    take(N,List, Result).

middle([], []).
middle([_], []).
middle([_,_], []).
middle([_|T], Result) :-
    reverse(T, [_|Reversed]),
    reverse(Reversed, Result).

split([],[],[]) :- !.
split([X], [X], []) :-!.
split([X, Y | Rest], [X|L1], [Y | L2]) :-
    split(Rest, L1, L2).

split1([],[],[]) :- !.
split1(List, L1, L2) :-
    length(List, Len),
    Middle is Len // 2,  
    take(Middle, List, L1),  
    drop(Middle, List, L2).  

% permutation(P, L) -  P jest permutacją listy L
 
permutation([], []).
 
permutation(P, [H|T]) :-
    permutation(P1, T),        
    append(A, B, P1),      % P1 dzielimy na dwie części 
    append(A, [H|B], P).   % P powstaje poprzez wstawienie 
                           % elementu H w pewne miejsce listy P1
middle(N, L, R) :-
    length(L,Length),
    Length =< 2*N,
    R = [],
    !.
middle(N, L, R) :-
    length(L,Length),
    Length > 2 * N,
    drop(N,L,R1),
    N1 is Length - 2*N,
    take(N1, R1, R).


move([H|T], R) :-
    append(T, [H], R).



listSum([X],X) :- !.
listSum([X,Y|T], Sum) :-
    Z is X + Y,
    listSum([Z|T], Sum).

sum(X) :-
    numlist(1,100,L1),
    maplist(f1,L1,L2),
    listSum(L2,X).

f1(X,Y) :-
    Y is 1/X.


listProd([X], X).
listProd([X,Y|T], Prod) :-
    Z is X * Y,
    listSum([Z|T], Prod).

f2(X, Y) :- Y is (1+X)/(2+X).

prod(X) :-
    numlist(1,50,L1),
    maplist(f2, L1, L2),
    listProd(L2, X).

f3(X, Y) :- Y is 1/(X*X).

sum1(X) :-
    numlist(1,1000,L1),
    maplist(f3, L1, L2),
    listSum(L2, X).
