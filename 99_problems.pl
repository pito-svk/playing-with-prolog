% http://www.ic.unicamp.br/~meidanis/courses/mc336/2009s2/prolog/problemas/

solve_1(X, [X]).
solve_1(X, [_|Xs]) :- solve_1(X, Xs).

solve_2(X, [X, _]).
solve_2(X, [_|Xs]) :- solve_2(X, Xs).

solve_3(X, [X|_], 1).
solve_3(X, [_|Xs], K) :-
  K_dec is K - 1,
  solve_3(X, Xs, K_dec).