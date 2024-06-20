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
    member(D, [2, 3, 5, 7]),
    F is H - 2,
    G mod 3 =:= 0,
    H is 2 * A,
    I is H - 1.



assign_digits([], _).
assign_digits([D|Ds], List):-
    select(D, List, NewList),
    assign_digits(Ds, NewList).
 
mag_kw :-
    X = [X01, X02, 5, X04, 15, X06, X07, 3, X09, X10, 11, 2, 1,  12, X15, X16],
    Digits = [X01, X02, X04, X06, X07, X09, X10, X15, X16],
    Available = [4, 6, 7, 8, 9, 10, 13, 14, 16],
    assign_digits(Digits, Available),
    % Rrzedy
    X01 + X02 + 5  + X04 =:= 34,
    15 + X06 + X07 + 3   =:= 34,
    X09 + X10 + 11 + 2   =:= 34,
    1  + 12 + X15 + X16  =:= 34,
    % Kolumny
    X01 + 15 + X09 + 1   =:= 34,
    X02 + X06 + X10 + 12 =:= 34,
    5  + X07 + 11 + X15  =:= 34,
    X04 + 3  + 2  + X16  =:= 34,
    write(X).

mag_kw2 :-
    X = [X01, X02, X03, X04, 15, X06, X07, 3, X09, X10, 11, 2, 1,  X14, X15, X16],
    Digits = [X01, X02, X03, X04, X06, X07, X09, X10,X14, X15, X16],
    Available = [4,5, 6, 7, 8, 9, 10, 12,13, 14, 16],
    assign_digits(Digits, Available),
    % Rrzedy
    X01 + X02 + X03  + X04 =:= 34,
    15 + X06 + X07 + 3   =:= 34,
    X09 + X10 + 11 + 2   =:= 34,
    1  + X14 + X15 + X16  =:= 34,
    % Kolumny
    X01 + 15 + X09 + 1   =:= 34,
    X02 + X06 + X10 + X14 =:= 34,
    X03  + X07 + 11 + X15  =:= 34,
    X04 + 3  + 2  + X16  =:= 34,
    write(X). 

dane :-
    Vars = [A, B, C, D, E, F, G],
    Digits = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
    assign_digits(Vars, Digits),
    A > 0, 
    D > 0,
    F > 0,
    %rzedy
    10 * A + B + C =:= 10*D+D,
    10*D+E + C =:=10 * D + C,
    10*F+B + 10*A+E =:= 10*G+B,
    %kolumny
    10*A+B + 10*D + E =:= 10 *F+B,
    C + C =:= 10*A + E,
    10*D+D + 10*D+C =:= 10*G+B,
    write(A), write(B), write(' + '), write(C), write(' = '), write(D), write(D), nl,
    write('+ '),  write('   +'), write(' = '),  write('+ '), nl, 
    write(D), write(E), write(' + '), write(C), write(' = '), write(D), write(C), nl,
    write('-----------------'),nl,
    write(F), write(B), write(' + '), write(A), write(E), write(' = '), write(G), write(B), nl.

kwadrat :-
    Vars = [A, B, C, D, E, F, G, H],
    Digits = [1, 2, 3, 4, 5, 6, 7, 8],
    assign_digits(Vars, Digits),
    % Sumy na każdej ścianie sześcianu:
    A + B + C + D =:= 18,
    E + F + G + H =:= 18,
    A + C + F + H =:= 18,
    B + D + E + G =:= 18,
    A + B + F + G =:= 18,
    C + D + E + H =:= 18,
    writeln(Vars), fail.

przeko :-
    Vars = [X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12],
    Digits = [1,2,3,4,5,6,7,8,9,10,11,12],
    assign_digits(Vars,Digits),
    X1 + X3 + X6 + X8 =:= 26,
    X1 + X4 + X7 + X11 =:= 26,
    X2 + X3 + X4 + X5 =:= 26,
    X2 + X6 + X9+ X12 =:= 26,
    X8 + X9 + X10+ X11 =:= 26,
    X5 + X7 + X10 + X12 =:= 26,
    writeln(Vars), fail.

gwiazdaBetlejemska :-
    X = [X11, X21, X22, X23, X24, X31, X32, X41, X42, X43, X44, X51],
    Avalible = [1,2,3,4,5,6,7,8,9,10,11,12],
    assign_digits(X, Avalible),
    X21 + X22 + X23 + X24 =:= 26,
    X41 + X42 + X43 + X44 =:= 26,
    X11 + X22 + X31 + X41 =:= 26,
    X11 + X23 + X32 + X44 =:= 26,
    X21 + X31 + X42 + X51 =:= 26,
    X24 + X32 + X43 + X51 =:= 26,
    writeln(X), fail.


drop(_,[],[]) :- !.
drop(0, List, List) :-!.
drop(N,[_|T],R) :-
    N1 is N - 1,
    drop(N1,T, R).

kobieta(ola).
kobieta(kasia).
kobieta(ania).
mezczyzna(tomek).
mezczyzna(maks).
mezczyzna(adam).
pizza(capriciosa,24.90).
pizza(roma,27.00).
pizza(califfo,30.40).
skladnik(ser,capriciosa).
skladnik(szynka,capriciosa).
skladnik(pieczarki,capriciosa).
skladnik(ser,roma).
skladnik(salami,roma).
skladnik(kabanosy,roma).
skladnik(papryka,roma).
skladnik(ser,califfo).
skladnik(szynka,califfo).
skladnik(kabanosy,califfo).
skladnik(papryka,califfo).
skladnik(oliwki,califfo).
lubi(ola,szynka).
lubi(ola,oliwki).
lubi(kasia,szynka).
lubi(kasia,salami).
lubi(ania,oliwki).
lubi(ania,papryka).
lubi(ania,pieczarki).
lubi(tomek,szynka).
lubi(tomek,oliwki).
lubi(maks,salami).
lubi(maks,szynka).
lubi(maks,kabanosy).
lubi(maks,pieczarki).
lubi(adam,szynka).