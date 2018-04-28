tail([_| R], R).
tail([], _) :-
    fail.