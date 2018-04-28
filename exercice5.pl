last([L|T], L) :-
    T = [].
last([_|Y], L) :-
    last(Y, L).
    