%%%%%%%%%%%%%%%%%%%%%%%% if binary tree is balanced %%%%%%%%%%%%%%%%%%%%%%%%
% import the module to be used
:-ensure_loaded(binary_insert).
:-ensure_loaded(height).

% usage
% ?- insertnode([7,12,6,4,8],nil,Tree),is_balance(Tree).
% Tree = t(7, t(6, t(4, nil, nil), nil), t(12, t(8, nil, nil), nil)).

% ?- insertnode([1,2,3],nil,Tree),is_balance(Tree).
% false.

% under the definition, the empty tree is balanced
is_balance(nil).

% calculate left subtree's height and right subtree's height
% based on the definition to decide if the tree is balanced 
is_balance(t(_,Left,Right)):-
  height(Left,LHeight),
  height(Right,RHeight),
  abs(LHeight-RHeight) < 2.

%%%%%%%%%%%%%%%%%%%%%%%% if binary tree is balanced ends %%%%%%%%%%%%%%%%%%%%%%%%