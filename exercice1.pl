print_every_second([]).

print_every_second([_]).

print_every_second([_, X|T]) :-
    write(X),
    nl,
    print_every_second(T).