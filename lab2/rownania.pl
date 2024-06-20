delta(A, B, C, Delta) :-
  Delta is B * B - 4 * A * C.

trojmian(A, B, C, Wynik) :-
  delta(A, B, C, Delta),
  Delta > 0,
  Wynik is (-B + sqrt(Delta)) / (2 * A).

trojmian(A, B, C, Wynik) :-
  delta(A, B, C, Delta),
  Delta > 0,
  Wynik is (-B - sqrt(Delta)) / (2 * A).

trojmian(A, B, C, Wynik) :-
  delta(A, B, C, Delta),
  Delta =:= 0,
  Wynik is -B / (2 * A).

trojmian(A, B, C, _) :-
  delta(A, B, C, Delta),
  Delta < 0,
  write("Brak rozwiazan").


liczba(X) :-
  between(100, 999, X),
  X mod 3 =:= 0,
  X mod 5 =:= 0,
  X mod 7 =:= 0.

zagadka(X) :-
    between(1,100,X),
    X mod 3 =:= 1,
    X mod 4 =:= 2,
    X mod 5 =:= 3,
    X mod 6 =:= 4.

zamiana_cyfr(L, NowaL) :-
  between(100,999,L),
  S is L // 100,
  D is (L // 10) mod 10,
  J is L mod 10,
  NowaL is S * 100 + J * 10 + D.

znajdz_liczby(L1, L2) :-
  between(100, 999, L1),
  zamiana_cyfr(L1, L2),
  L1 + L2 =:= 1187.


znajdz(L1,L2) :-
member(A, [1,2,3,4,5,6,7,8,9]),
member(B, [0,1,2,3,4,5,6,7,8,9]),
member(C, [0,1,2,3,4,5,6,7,8,9]),
100*A + 10*B + C + 100*A + 10*C + B =:= 1187,
L1 is 100*A + 10*B + C,
L2 is 100*A + 10*C + B.

seq(1,3).
seq(2,4).
seq(N,W) :-
  N > 2,
  N1 is N - 1,
  N2 is N - 2,
  seq(N1, R1),
  seq(N2, R2),
  W is R1 + 3*R2.
