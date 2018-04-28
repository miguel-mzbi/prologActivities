% Miguel Angel Montoya Zaragoza
% A01226045

% Declaration of valid actions (grab, climb, push, walk)
% It is not necessary to declare wich action is wich (Putting the actual verb in them),
%   because it actually causes a unused singleton. It's only useful if you store,
%   through another predicate the used route.
action( 
    state(middle, onBox, middle, hasNot),
    grab,
    state(middle, onBox, middle, has)
).
action(
	state(P, onFloor, P, Banana),
    climb,
    state(P, onBox, P, Banana)
).
action(
	state(P1, onFloor, P1, Banana),
    push(P1, P2),  
    state(P2, onFloor, P2, Banana)
).
action( 
    state(P1, onFloor, Box, Banana),
    walk(P1, P2),
    state(P2, onFloor, Box, Banana)
).

% Final state. Doesn't matter where or at which level is the monkey located,
% or where is the box. The only important thing is to have the banana.
canGet(state(_, _, _, has)).
% Not final state. Must try actions.
canGet(State) :-
    action(State, _, NewState),
    canGet(NewState).

% Final state. Doesn't matter where or at which level is the monkey located,
% or where is the box. The only important thing is to have the banana.
% Returns final point of route.
canGet(state(_, _, _, has), ["HAS BANANA!"]).
% Not final state. Must try actions.
% Unifying action will be stored in route.
canGet(State, Route) :-
    action(State, Action, NewState),
    canGet(NewState, R),
    Route = [Action|R].