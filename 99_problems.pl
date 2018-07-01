% http://www.ic.unicamp.br/~meidanis/courses/mc336/2009s2/prolog/problemas/

solve_1(X, [X]).
solve_1(X, [_|Xs]) :- solve_1(X, Xs).