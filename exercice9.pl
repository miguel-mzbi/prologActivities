length2([], 0).
length2([_|X], L) :-
    length2(X, L2),
    L is L2+1.