kobieta(ola).
kobieta(lila).
kobieta(kasia).
kobieta(ania).
kobieta(ewa).
kobieta(marysia).

mezczyzna(tomek).
mezczyzna(adam).
mezczyzna(radek).
mezczyzna(karol).
mezczyzna(wojtek).
mezczyzna(artur).

% najpierw matka, potem dziecko
matka(ola, lila).
matka(ola, kasia).
matka(ola, marysia).
matka(lila, ania).
matka(lila, karol).
matka(kasia, wojtek).

% najpierw ojciec, potem dziecko
ojciec(tomek, lila).
ojciec(tomek, kasia).
ojciec(adam, ania).
ojciec(adam, karol).
ojciec(radek, wojtek).

adres(ola, krakow, kwiatowa).
adres(tomek, krakow, kwiatowa).
adres(lila, krakow, wiosenna).
adres(karol, krakow, wiosenna).
adres(artur, krakow, wiosenna).
adres(kasia, wieliczka, kwiatowa).
adres(radek, wieliczka, kwiatowa).
adres(wojtek, wieliczka, kwiatowa).
adres(ania, krakow, wiosenna).

dziadek(X,Y) :-
    (matka(M,Y), ojciec(X,M), mezczyzna(X));
    (ojciec(O,Y), ojciec(X,O), mezczyzna(X)).

siostra(X,Y) :-
    ojciec(O, X),
    ojciec(O, Y),
    matka(M, X),
    matka(M, Y),
    kobieta(X),
    X \= Y.



seq(1,2) :- !.
seq(2,3) :- !.
seq(N,X) :-
    N > 2,
    N1 is N-1,
    N2 is N-2,
    seq(N1, Res1),
    seq(N2, Res2),
    X is Res1 + Res2 -1.


maxList([X], X) :- !.
maxList([X,Y|T],R) :-
    X >= Y,
    maxList([X|T], R),
    !.

maxList([X,Y|T],R) :-
    X < Y,
    maxList([Y|T], R),
    !.

wylicz(X) :-
    numlist(2,1500,L1),
    maplist(f1, L1, L2),
    listSum(L2,X).

listSum([X],X) :- !.
listSum([X,Y|T], R) :-
    Z is X + Y,
    listSum([Z|T], R).

f1(X,Y) :-
    Y is (X + 1) / (X*X + 2).