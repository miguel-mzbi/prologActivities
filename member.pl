member([E|_], E).
member([_|Y], E) :-
    member(Y, E).