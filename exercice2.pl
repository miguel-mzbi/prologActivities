isVowel(X) :-
    X = a;
    X = e;
    X = i;
    X = o;
    X = u.

deconsonant([]).
deconsonant([X|T]) :-
    isVowel(X),
    write(X),
    nl,
    deconsonant(T).

deconsonant([X|T]) :-
    not(isVowel(X)),
    deconsonant(T).
