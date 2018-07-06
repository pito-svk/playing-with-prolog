% http://www.ic.unicamp.br/~meidanis/courses/mc336/2009s2/prolog/problemas/

solve_1(X, [X]).
solve_1(X, [_|Xs]) :- solve_1(X, Xs).

solve_2(X, [X, _]).
solve_2(X, [_|Xs]) :- solve_2(X, Xs).

solve_3(X, [X|_], 1).
solve_3(X, [_|Xs], K) :-
  K_dec is K - 1,
  solve_3(X, Xs, K_dec).

solve_4([], 0).
solve_4([_], 1).
solve_4([_|Xs], L) :-
  solve_4(Xs, L, 1).

solve_4([_|Xs], L, C) :-
  C_int is C + 1,
  solve_4(Xs, L, C_int).
solve_4([_], L, C) :- L is C + 1.

solve_5([], []).
solve_5([X], [X]).
solve_5([X|Xs], R) :- solve_5(Xs, R, [X]).
solve_5([X|Xs], R, Acc) :- solve_5(Xs, R, [X|Acc]).
solve_5([], R, R).
     