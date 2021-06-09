%%%%%%%%%%%%%%%%%%%%%%%% height of a binary tree %%%%%%%%%%%%%%%%%%%%%%%%
% import the module to be used
:-ensure_loaded(binary_insert).

% usage
% insertnode([7,12,6,4,8],nil,Tree),height(Tree,Height).
% Tree = t(7, t(6, t(4, nil, nil), nil), t(12, t(8, nil, nil), nil)),
% Height = 3.

% height of an empty tree is 0
height(nil,0).

% count the left subtree's height
% count the right subtree's height
% find its max and add 1 to be the tree's height
height(t(_,Left,Right),Height):-
  height(Left,LHeight),
  height(Right,RHight),
  Height is 1 + max(LHeight,RHight).

%%%%%%%%%%%%%%%%%%%%%%%% height of a binary tree ends %%%%%%%%%%%%%%%%%%%%%%%%