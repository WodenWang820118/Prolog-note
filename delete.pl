%%%%%%%%%%%%%%%%%%%%%%%% delete a node in a binary tree %%%%%%%%%%%%%%%%%%%%%%%%
:-ensure_loaded(binary_insert).

% usage
% ?-insertnode([7,12,6,4,8],nil,Tree),delete(7,Tree,Rest).
% Tree = t(7, t(6, t(4, nil, nil), nil), t(12, t(8, nil, nil), nil)),
% Rest = t(6, t(4, nil, nil), t(12, t(8, nil, nil), nil)) .

delete(X,nil,nil):-write(X),write('there is an empty tree\n').

% if delete a node with a left node and right leaf
% return the left node
% for example, insertnode([7,6],nil,Tree)
%     7
%    / \
%   6  nil
%  / \
% nil nil
%
% delete the node 7 would be
%     6
%    / \
%   nil nil
delete(X, t(X,Left,nil),Left):-!.

% same logic applies on another side
delete(X, t(X,nil,Right),Right):-!.


% the Left value must be lower than Right value
% therefore, bring the Left value to the top
% and the Right node becomes Left's Right node
%
% the tree structure
%       7
%      / \
%     6   12
%    /   /
%   4   8
%
% if delete 7
% it would be
%
%       6
%      / \
%     4   12
%        /
%       8
% deleting the node (7), bring the Predecessor value (6) to the root
% rebuild the NL (NewLeft, 4) to new tree's left subtree
% Right (12,8) remain on the right subtree
delete(X,t(X,Left,Right),t(Predecessor,NL,Right)):-
  get_pred(Left,Predecessor,NL).

% if the X is smaller, search for the X on the left subtree
delete(X,t(Root,Left,Right),t(Root,NL,Right)):-
  X < Root,!,
  delete(X,Left,NL).

% if the X if larger, search for the X on the right subtree
delete(X,t(Root,Left,Right),t(Root,Left,NR)):-
  delete(X,Right,NR).

% get Left's Predecessor value and its left node
% if its right node is nil
get_pred(t(Predecessor,Left,nil),Predecessor,Left):-!.

% get Left's Predecessor
% there's a Right node -> get its Predecessor to form NR (NewRight)
% X would be the Left's value, with its left subtree and NR subtree
get_pred(t(X,Left,Right),Predecessor,t(X,Left,NR)):-
  get_pred(Right,Predecessor,NR).

%%%%%%%%%%%%%%%%%%%%%%%% delete a node in a binary tree ends %%%%%%%%%%%%%%%%%%%%%%%%