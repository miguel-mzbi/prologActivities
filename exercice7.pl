factPar(0, 1).
factPar(1, 1).
factPar(X, R) :-
    factPar(X-1, R2),
    R is X * R2.