parent(pam, bob).
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

female(pam).
female(liz).
female(ann).
female(pat).

male(tom).
male(bob).
male(jim).

offspring(Y, X) :-
    parent(X, Y).

mother(X, Y) :-
    parent(X, Y),
    female(X).

grandparent(X, Z) :-
    parent(X, Y),
    parent(Y, Z),
    male(X).

sister(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    female(X),
    X \= Y.

sibling(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    X \= Y.

predecessor(X, Z) :-
    parent(X, Z).

predecessor(X, Z) :-
    parent(X, A),
    predecessor(A, Z).
    
predecessorFem(X, Z) :-
    female(X),
    predecessor(X, Z).
