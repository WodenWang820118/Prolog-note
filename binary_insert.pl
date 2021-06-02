%%%%%%%%%%%%%%%%%%%%%%%% create a binary tree %%%%%%%%%%%%%%%%%%%%%%%%

% it is true when X is greater than Y
gt(X,Y):- X > Y.

% create a node with only X
% createnode(+Tree, +Value, -t (-Value, -LeftLeaf, -RightLeaf))
createnode(nil, X ,t(X, nil ,nil)).

% base case
% avoid the duplicate
% otherwise, create a node
createnode(t(X, Left, Right), X, t(X, Left, Right)):-!. % the "!" cut down the backtracking, it's often more efficient

% create a node to a tree with the value X
% if X is smaller, create a node, with the value X, to Left1 subtree
% which backtracks to the base case
createnode(t(Root, Left, Right), X, t(Root, Left1, Right)):-
  gt(Root, X),!,
  createnode(Left, X, Left1).

createnode(t(Root, Left, Right), X, t(Root, Left, Right1)):-
  gt(X, Root),!,
  createnode(Right, X, Right1).

% base case
% the NewTree equals the Result tree
% and the list is empty, then the backtracking stops
insertnode([],Tree,Tree).

% insert a list of tree node
insertnode([X|Xs], Tree, Result):-
  createnode(Tree, X, NewTree),
  insertnode(Xs, NewTree, Result).

%%%%%%%%%%%%%%%%%%%%%%%% create a binary tree ends %%%%%%%%%%%%%%%%%%%%%%%%