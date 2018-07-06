% http://www.ic.unicamp.br/~meidanis/courses/mc336/2009s2/prolog/problemas/

solve_1(X, [X]).
solve_1(X, [_|Y]) :- solve_1(X, Y).

solve_2(X, [X, _]).
solve_2(X, [_|Y]) :- solve_2(X, Y).

solve_3(X, [X|_], 1).
solve_3(X, [_|Y], K) :-
  G is K - 1,
  solve_3(X, Y, G).

solve_4([], 0).
solve_4([_], 1).
solve_4([_|Y], L) :-
  solve_4(Y, L, 1).

solve_4([_|Y], L, C) :-
  Z is C + 1,
  solve_4(Y, L, Z).
solve_4([_], L, C) :- L is C + 1.

solve_5([], []).
solve_5([X|Y], R) :- solve_5(Y, R, [X]).
solve_5([X|Y], R, D) :- solve_5(Y, R, [X|D]).
solve_5([], R, R).
    
solve_6(X) :- solve_5(X, X).