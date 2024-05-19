panstwo(polska).
panstwo(niemcy).
panstwo(francja).
panstwo(wlochy).
panstwo(hiszpania).
panstwo(wielka_brytania).

miasto(warszawa, polska).
miasto(krakow, polska).
miasto(berlin, niemcy).
miasto(paryz, francja).
miasto(rzym, wlochy).
miasto(wenecja, wlochy).
miasto(barcelona, hiszpania).
miasto(madryt, hiszpania).
miasto(londyn, wielka_brytania).

zabytek(palac_w_wilanowie, warszawa).
zabytek(kolumna_zygmunta_iii_wazy, warszawa).
zabytek(wawel, krakow).
zabytek(sukiennice, krakow).
zabytek(kosciol_mariacki, krakow).
zabytek(brama_brandenburska, berlin).
zabytek(reichstag, berlin).
zabytek(wieza_eiffla, paryz).
zabytek(katedra_notre_dame, paryz).
zabytek(palac_elizejski, paryz).
zabytek(bazylika_sw_pawla_za_murami, rzym).
zabytek(koloseum, rzym).
zabytek(zamek_swietego_aniola, rzym).
zabytek(bazylika_sw_marka, wenecja).
zabytek(palac_dozow, wenecja).
zabytek(sagrada_familia, barcelona).
zabytek(palac_krysztalowy, madryt).
zabytek(tower_bridge, londyn).
zabytek(palac_buckingham, londyn).
zabytek(katedra_swietego_pawla, londyn).

sasiaduje(polska, niemcy).
sasiaduje(wielka_brytania, francja).
sasiaduje(wlochy,hiszpania).
sasiaduje(wielka_brytania, francja).
sasiaduje(wielka_brytania, francja).

zabytki_m(M) :-
    zabytek(X, M),
    write(X), nl,
    fail.
zabytki_m(_).

zabytki_mp(M) :-
    zabytek(Z, M),
    miasto(M, P),
    write(Z), write(', '), write(M), write(', '), write(P), nl,
    fail.
zabytki_mp(_).

zabytki_p(P) :-
  miasto(M, P),
  zabytek(Z, M),
  write(Z), nl,
  fail.
zabytki_p(_).

zabytki_ps(P) :-
  ( miasto(M, P), zabytek(Z, M);
    sasiaduje(P, S), miasto(M, S), zabytek(Z, M) ),
  miasto(M, C),
  write(Z), write(', '), write(M), write(', '), write(C), nl,
  fail.
zabytki_ps(_).

