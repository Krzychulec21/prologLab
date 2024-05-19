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

seq(1,3).
seq(2,4).
seq(N,W) :-
    N > 2,
    N1 is N - 1,
    N2 is N - 2,
    seq(N1, W1),
    seq(N2, W2),
    W is W1 + 3 * W2.

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

