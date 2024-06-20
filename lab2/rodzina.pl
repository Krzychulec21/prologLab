
rodzic(ola,max).
rodzic(tomek,max).
rodzic(tomek,lila).
rodzic(max,ania).
rodzic(max,kasia).
rodzic(kasia,radek).
rodzic(ola,lila).

rodzic(ala, basia).
rodzic(basia, celina).
rodzic(celina, dorota).
 
kobieta(ola).
kobieta(lila). 
kobieta(kasia).
kobieta(ania).
 
mezczyzna(tomek).
mezczyzna(max).
mezczyzna(radek).
 
matka(X,Y) :-
  rodzic(X,Y),
  kobieta(X).
 
ojciec(X,Y) :-
  rodzic(X,Y),
  mezczyzna(X).

siostra(X,Y) :-
  rodzic(Z,Y),
  rodzic(Z,X),
  kobieta(X),
  X \= Y.

para(X, Y) :-
  kobieta(X),
  mezczyzna(Y),
  rodzic(X,D),
  rodzic(Y,D).

brat(X,Y) :-
  rodzic(Z,Y),
  rodzic(Z,X),
  mezczyzna(X),
  X \= Y.
  
rodzina(X, Y, Z1, Z2) :-
    kobieta(X),
    mezczyzna(Y),
    rodzic(X, Z1),
    rodzic(Y, Z1),
    rodzic(X, Z2),
    rodzic(Y, Z2),
    Z1 \= Z2.


rodzice(X) :-
  ojciec(O,X),
  matka(M,X),
  write("ojciec: "),
  writeln(O),
  write("matka: "),
  writeln(M),
  !.

rodzice(X) :-
  ojciec(O,X),
  write("ojciec: "),
  writeln(O),
  !.

rodzice(X) :-
  matka(M,X),
  write("matka: "),
  writeln(M),
  !.

rodzice(_) :-
  write("brak danych").

potomek(X,Y) :-
  rodzic(Y,X).

potomek(X,Y) :-
  rodzic(Z,X),
  potomek(Z,Y).

potomkowie(X) :-
  potomek(Y, X),
  write(Y), nl,
  fail.

potomkowie(_).

  