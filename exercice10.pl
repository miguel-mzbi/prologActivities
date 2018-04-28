power(X, 0, 1).
power(X, 1, X).
power(X, Y, R) :-
    Y2 is Y-1,
    power(X, Y2, R2),
    R is R2 * X.