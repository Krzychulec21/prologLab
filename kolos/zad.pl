ssak(zebra).
ssak(zyrafa).
ssak(tygrys).
ssak(kon).
ssak(gepard).
ssak(zebra).

ptak(orzel).
ptak(jastrzab).
ptak(sakol).
ptak(kaczka).
ptak(pelikan).
ptak(mewa).

ryba(rekin).
ryba(delfin).
ryba(karp).
ryba(plotka).

roslinozerca(zebra).
roslinozerca(zyrafa).
roslinozerca(kon).
roslinozerca(kaczka).
roslinozerca(karp).
roslinozerca(plotka).

drapieznik(tygrys).
drapieznik(gepard).
drapieznik(jaguar).
drapieznik(rekin).
drapieznik(delfin).
drapieznik(orzel).
drapieznik(jastrzab).
drapieznik(sokol).
drapieznik(pelikan).
drapieznik(mewa).

zjada(zebra,trawa).
zjada(zyrafa,liscie).
zjada(zyrafa,galazki).
zjada(kon,trawa).
zjada(kon, liscie).
zjada(karp, mech).
zjada(gepard, zyrafa).
zjada(jaguar, zyrafa).

ma(zebra, paski).
ma(tygrys, paski).
ma(zyrafa, cetki).
ma(gepard, cetki).
ma(jaguar, cetki).

drapiezna_ryba(X) :-
    ryba(X),
    drapieznik(X).

jedza_roslinozercy(X) :-
    roslinozerca(R), zjada(R,X).

zjada_ssak_ssaka(X,Y) :-
    ssak(X),
    drapieznik(X),
    ssak(Y),
    not(drapieznik(Y)),
    zjada(X,Y).    

zjada_w_cetki(X,Y) :-
    drapieznik(X),
    ma(X,cetki),
    ma(Y,cetki),
    zjada(X,Y).

iloczyn(N,W) :-
    numlist(0,N,L1),
    maplist(f,L1,L2),
    listProd(L2,W).

f(X,Y) :-
    Y is X*X + 7*X + 3.

listProd([X],X) :- !.
listProd([X,Y|T],R) :-
    Z is X * Y,
    listProd([Z|T], R).

suma(N,W) :-
    numlist(0,N,L1),
    maplist(f2,L1,L2),
    sumlist(L2,W).

f2(X,Y) :-
    Y is X*X + 7*X + 3.

take(0,_,[]) :- !.
take(_,[],[]) :- !.
take(N,[H|T],[H|R]) :-
    N > 0,
    N1 is N -1,
    take(N1,T,R).
    
drop(0,L,L) :- !.
drop(_,[],[]):- !.
drop(N, [_|T], R) :-
    N > 0,
    N1 is N - 1,
    drop(N1, T,R).


middle(N,L,R) :-
    length(L,Length),
    Length =< 2*N,
    R = [], !.

middle(N,L,R) :-
    length(L,Length),
    Length > 2*N,
    drop(N,L,L1),
    reverse(L1,L2),
    drop(N,L2,L3),
    reverse(L3,R).

without_middle(N,L,R) :-
    length(L, Length),
    Length > 2*N,
    take(N,L,L1),
    reverse(L,L2),
    take(N,L2,L3),
    reverse(L3,L4),
    append(L1,L4,R).

assign_digits([], _).
assign_digits([D|Ds], List):-
    select(D, List, NewList),
    assign_digits(Ds, NewList).

kw :-
    X = [X1,X2,5,X4,15,X6,X7,3,X9,X10,11,2,1,12,X15,X16]
    Var = [X1,X2,X4,X6,X7,X9,X10,X15,X16],
    Digits = [4,6,7,8,9,10,13,14,16],
    assign_digits(Var,Digits),
    %Warunki
    

permutation([], []).
 
permutation(P, [H|T]) :-
    permutation(P1, T),        
    append(A, B, P1),      % P1 dzielimy na dwie części 
    append(A, [H|B], P).   % P powstaje poprzez wstawienie 
                           % elementu H w pewne miejsce listy P1

split([],[],[]).
split([X], [X], []).
split([X, Y | Rest], [X|L1], [Y | L2]) :-
    split(Rest, L1, L2).

move([H|T], R) :-
    append(T, [H], R).

listSum([X], X).
listSum([X,Y|T], Sum) :-
    Z is X + Y,
    listSum([Z|T], Sum).

sum(X) :-
    numlist(1,100,L1),
    maplist(f,L1,L2),
    listSum(L2,X).

listProd([X], X).
listProd([X,Y|T], Prod) :-
    Z is X * Y,
    listSum([Z|T], Prod).




