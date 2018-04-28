p([1, 2, 3, 4, 5, 6]).
% p([the, cat, sat, [on, the, mat]]).

penultimo([X, _], X).

penultimo([_| Y], X) :-
    penultimo(Y, X).

isEven(X) :-
    0 is mod(X, 2).

factPar(0, 1).
factPar(1, 1).
factPar(X, R) :-
    X >= 2,
    isEven(X),
    X2 is X - 2,
    factPar(X2, R2),
    R is X * R2;
    X >= 2,
    X1 is X - 1,
    factPar(X1, R).