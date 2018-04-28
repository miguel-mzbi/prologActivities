head([X|_], X).
head([], _) :-
    fail.