% Miguel Angel Montoya Zaragoza
% A01226045
%
% Methods that actually move items in arrays.
%
% hanoiArray(N, O, D, A, RO, RD, RA)
% Must be called as follows:
%   N - Number of disks to be moved
%   F - Origin array representing the origin tower. Must contain disks. 
%       Can contain more than the disks expected to move.
%   D - Destination array. Represents a tower. Must be empty. If the array
%       contains disks it should be assumed that those disk are in order, 
%       and bigger than any disk on F. (Please use hanoiArrayInit instead)
%   A - Auxiliary array. Represents a tower. Must be empty. If the array
%       contains disks it should be assumed that those disk are in order, 
%       and bigger than any disk on F. (Please use hanoiArrayInit instead)
%  RO - Resulting Origin Tower. Must be empty if all disk were instructed
%       to be moved. Else, remaining disks will appear.
%  RD - Resulting Destination Tower. Must be empty if no disk were placed
%       at start. Else, remaining disks will appear. (Please use henoiArrayInit)
%  RD - Resulting Auxiliary Tower. Must be empty if no disk were placed
%       at start. Else, remaining disks will appear. (Please use henoiArrayInit)
%
% hanoiArrayInit(N, O, RO, RD, RA)
% Must be called as follows:
%   N - Number of disks to be moved
%   F - Origin array representing the origin tower. Must contain disks. 
%       Can contain more than the disks expected to move.
%  RO - Resulting Origin Tower. Must be empty if all disk were instructed
%       to be moved. Else, remaining disks will appear.
%  RD - Resulting Destination Tower. Will contain the disks expected to
%       be moved, in order.
%  RA - Resulting Auxiliary Tower. Will be empty.
% 
% Examples:
%
% USING hanoiArray
% hanoiArray(3, [1,2,3], [], [], FROM, TO, AUX).
%   FROM = [4, 6],
%   TO = [1, 2, 3, 200],
%   AUX = [100, 300] .
% hanoiArray(3, [1,2,3,4,6], [200], [100,300], FROM, TO, AUX).
%   FROM = [4, 6],
%   TO = [1, 2, 3, 200],
%   AUX = [100, 300] .
%
% USING hanoiArrayInit
% hanoiArrayInit(4, [1,2,3,4], FROM, TO, AUX).
%   FROM = AUX, AUX = [],
%   TO = [1, 2, 3, 4] . 
% hanoiArrayInit(4, [1,2,3,4,5,6], FROM, TO, AUX).
%   FROM = [5, 6],
%   TO = [1, 2, 3, 4],
%   AUX = [] .
%
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%
% Method that gives instruction on playing
%
% hanoiText(N, O, D, A)
% Must be called as follows:
%   N - Number of disks to be moved
%   O - Name for origin tower.
%   D - Name for dest tower.
%   A - Name for aux tower.
%
% Example:
% hanoiText(3, a, c, b).
%   From a to c
%   From a to b
%   From c to b
%   From a to c
%   From b to a
%   From b to c
%   From a to c
%   true

hanoiArray(1, [H|T], Y, Z, NewX, NewY, Z) :-
    NewX = T,
    NewY = [H| Y].
hanoiArray(N, X, Y, Z, NewX, NewY, NewZ) :-
    N > 1,
    M is N -1,
    hanoiArray(M, X, Z, Y, Xt1, Zt1, Yt1),
    hanoiArray(1, Xt1, Yt1, Zt1, Xt2, Yt2, Zt2),
    hanoiArray(M, Zt2, Yt2, Xt2, NewZ, NewY, NewX).

hanoiArrayInit(N, X, NewX, NewY, NewZ) :-
    N > 1,
    hanoiArray(N, X, [], [], NewX, NewY, NewZ).

hanoiText(1, X, Y, _) :-  
    write("From "), 
    write(X), 
    write(" to "), 
    write(Y), 
    nl. 
hanoiText(N, X, Y, Z) :- 
    N > 1, 
    M is N - 1, 
    hanoiText(M, X, Z, Y), 
    hanoiText(1, X, Y, Z), 
    hanoiText(M, Z, Y, X).