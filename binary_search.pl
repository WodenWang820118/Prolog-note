%%%%%%%%%%%%%%%%%%%%%%%% search element in a binary tree %%%%%%%%%%%%%%%%%%%%%%%%
% import the module to be used
:-ensure_loaded(binary_insert).

% usage, first get a tree
% ?-insertnode([7,6,12],nil,Tree), in(6,Tree)
% Tree = t(7, t(6, nil, nil), t(12, nil, nil)).

% ?- insertnode([7,12,6],nil,Tree), in(100,Tree).
% false.


% if the root itself is X, then X
% base case
in(X, t(X, _, _)).

% if the X is smaller, search the Left subtree
% Left is also denoted as a subtree
% in (+key, +Node)
in(X, t(Root, Left, _)):-
  gt(Root, X),
  in(X, Left).

in(X, t(Root, _, Right)):-
  gt(X,Root),
  in(X, Right).


%%%%%%%%%%%%%%%%%%%%%%%% search element in a binary tree ends %%%%%%%%%%%%%%%%%%%%%%%%