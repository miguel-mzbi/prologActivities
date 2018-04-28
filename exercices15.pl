% Ex 1:
% Write a predicate print every second/1 to print every other elementin a list,
% beginning at the second element —i.e. the 2nd, 4th, 6thelements etc. It should always
% succeed provided it is given a list as itsargument.
print_every_second([]).
print_every_second([_]).
print_every_second([_, X|T]) :-
    write(X),
    nl,
    print_every_second(T).

% Ex 2:
% Write a predicate deconsonant/1 to print any element of a list that isn’t a consonant
% (i.e. we want toprint out the vowels fa,e,i,o,ug). It should always succeed provided
% it is given a list as its argument (we assume that the input list only contains vowels
% and consonants).
isVowel(X) :-
    X = a; X = e; X = i; X = o; X = u.
deconsonant([]).
deconsonant([X|T]) :-
    isVowel(X),
    write(X),
    nl,
    deconsonant(T).
deconsonant([X|T]) :-
    not(isVowel(X)),
    deconsonant(T).

% Ex 3:
% Write a predicate head/2 which takes a list as its first argument andreturns the 
% head of the list as its second argument. It should fail ifthere is no first element.
head([X|_], X).
head([], _) :-
    fail.

% Ex 4:
% Write a predicate tail/2 which takes a list as its first argument and returns
% the tail of the list as its second argument. It should fail if there is no first
% element.
tail([_| R], R).
tail([], _) :-
    fail.

% Ex 5:
% Write a predicate last/2 which takes a list as its first argument and returns the
% last element of the list.
last([L|T], L) :-
    T = [].
last([_|Y], L) :-
    last(Y, L).

% Ex 6:
% Write a predicate max/3 which takes three arguments, the first two are positive
% integer numbers and returns in the third the max of them.
max(X, Y, M) :-
    X > Y,
    M is X;
    Y > X,
    M is Y.
    
% Ex 7:
% Write a predicate fact/2 which takes a natural number as first argument,
% and returns the factorial of the number.
factPar(0, 1).
factPar(1, 1).
factPar(X, R) :-
    factPar(X-1, R2),
    R is X * R2.

% Ex 8:
% Write a predicate fib/2 which takes a natural number as first argument, and returns
% the value of the Fibonacci sequence for that position (counting from 1).
fib(0, 0).
fib(1, 1).
fib(X, R) :-
    X >= 2,
    X1 is X - 1,
    X2 is X - 2,
    fib(X1, R1),
    fib(X2, R2),
    R is R1 + R2.

% Ex 9:
% Write a predicate length2/2 which takes a list as first argument, and returns in the
% second one the number of elements in the list.
length2([], 0).
length2([_|X], L) :-
    length2(X, L2),
    L is L2+1.

% Ex 10:
% Write a predicate power/3 which takes a numberas first argument, a natural number
% as second argument and returns the first number to the power of the second.
power(_, 0, 1).
power(X, 1, X).
power(X, Y, R) :-
    Y2 is Y-1,
    power(X, Y2, R2),
    R is R2 * X.

% Ex 11:
% Write a predicate count_vowels/2 which takes a list as its first argument and
% returns an integer number (as its second argument) which consists of the count of
% elements of the input list which area vowel (we assume that the input list only
% contains vowels and consonants).

% isVowel already defined in Ex 2
count_vowels([X], R) :-
    isVowel(X),
    R is 1;
    % If it isn't a vowel
    not(isVowel(X)),
    R is 0.
count_vowels([X|T], R) :-
    isVowel(X),
    count_vowels(T, R2),
    R is R2 + 1;
    % If it isn't a vowel
    not(isVowel(X)),
    count_vowels(T, R).

% Ex 12: 
% Write a predicate vowels/2 which takes a list as its first argument and
% returns a list(as its second argument) which consists of the elements of the input list
% which area vowel (we assume that the input list onlycontains vowels and consonants).

% isVowel already defined in Ex 2
vowels([], []).
vowels([X|T], R) :-
    isVowel(X),
    vowels(T, R2),
    R = [X|R2];
    % If not a vowel
    not(isVowel(X)),
    vowels(T, R).
    
% Ex 13:
% Define nple/3 to take two inputs —an integer and a list of integers.
% The result is to be a list of integers formed by multiplyingeach integer in the list 
% by the input integer.
nple(_, [], []).
nple(X, [H|T], R) :-
    nple(X, T, R2),
    N is X * H,
    R = [N|R2].

% Ex 14:
% Define del all/3 which takes a possible element of a list and a list as inputs and
% returns the list with all occurences of the named element removed. (If the named 
% element is not in the list thenthe result is, of course, the whole list with
% no deletions)
del_all(_, [], []).
del_all(D, [H|T], R) :-
    D = H,
    del_all(D, T, R);
    % If the item doesn't need to be deleted
    D \= H,
    del_all(D, T, R2),
    R = [H|R2].

% Ex 15:
% Write a predicate find every second/2 which takes a list as its first
% argument and returns a list (as its second argument) which consists ofevery other
% element of the input list starting at the second element.
find_every_second([], []).
find_every_second([_], []).
find_every_second([_, X|T], R) :-
    find_every_second(T, R2),
    R = [X|R2].

% Extra 5 for practice

% Ex 16:
% Define sum/2 to take a list of integers as input and return the output as their sum.
sum([], 0).
sum([H|T], R) :-
    sum(T, R2),
    R is H + R2.

% Ex 17:
% Write a predicate nth/3 which takes two inputs: the first a positive integer and
% the second a list. The output (initially, an uninstantiated variable) will be the
% element that occurs at the nth position in the list.

% Element 0 is the 1st. (List start at 1)
nth(_, [], _) :-
    fail.
nth(1, [H|_], H).
nth(X, [_|T], R) :-
    X1 is X - 1,
    nth(X1, T, R).

% Ex 18:
% Write a predicate dupli/2 which takes two inputs: the first is a list, and the
% second will be the list with every element duplicated.
dupli([], []).
dupli([H|T], R) :-
    dupli(T, R2),
    R = [H, H|R2].

% Ex 19:
% Write a predicate split/4 that splits a list into two parts, the length of the
% first part is given.
split(X, 0, [], X).
split([H|T], N, L1, L2) :-
    N1 is N - 1,
    split(T, N1, R1, L2),
    L1 = [H|R1].

% Ex 20:
% Write a predicate npli/3 which takes three inputs: the first is a list, the second is
% the number of times that every elements will be copied and the third element is the
% new list.
build(X, 1, [X]).
build(X, N, R) :-
    N > 1,
    N1 is N - 1,
    build(X, N1, R2),
    R = [X|R2].

appendLists([], X, X).
appendLists([X|Y], L, [X| N]) :-
    appendLists(Y, L, N).

npli([], _, []).
npli([H|T], N, R) :-
    npli(T, N, R2),
    build(H, N, R3),
    appendLists(R3, R2, R).

% Practice functions
append([], X, [X]).
append([H|T], X, R) :-
    append(T, X, R2),
    R = [H|R2].
