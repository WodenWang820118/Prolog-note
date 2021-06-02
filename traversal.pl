%%%%%%%%%%%%%%%%%%%%%%%% traversal in a binary tree %%%%%%%%%%%%%%%%%%%%%%%%
:-ensure_loaded(binary_insert).

% the tree structure
%       7
%      / \
%     6   12
%    /   /
%   4   8

% inorder
% ?- insertnode([7,12,6,4,8],nil,Tree),inorder(Tree,List).
% Tree = t(7, t(6, t(4, nil, nil), nil), t(12, t(8, nil, nil), nil)),
% List = [4, 6, 7, 8, 12].

% preorder
% insertnode([7,12,6,4,8],nil,Tree),preorder(Tree,List).
% Tree = t(7, t(6, t(4, nil, nil), nil), t(12, t(8, nil, nil), nil)),
% List = [7, 6, 4, 12, 8].

% postorder
% ?- insertnode([7,12,6,4,8],nil,Tree),postorder(Tree,List).
% Tree = t(7, t(6, t(4, nil, nil), nil), t(12, t(8, nil, nil), nil)),
% List = [4, 6, 8, 12, 7].



% base case 
% stop backtracking if the node is nil, i.e. leaf
% and the List is empty
inorder(nil,[]).

% traversal the node inorder
% and generates a List
inorder(t(Root, Left, Right),List):-
  inorder(Left, LeftList),
  inorder(Right, RightList),
  append(LeftList,[Root|RightList],List).

% base case 
% stop backtracking if the node is nil, i.e. leaf
% and the List is empty
preorder(nil,[]).

% traversal the node preorder
% and generates a List
preorder(t(Root, Left, Right),List):-
  preorder(Left, LeftList),
  preorder(Right, RightList),
  append([Root|LeftList],RightList,List).

% base case 
% stop backtracking if the node is nil, i.e. leaf
% and the List is empty
postorder(nil,[]).

% traversal the node postorder
% and generates a List
postorder(t(Root, Left, Right),List):-
  postorder(Left, LeftList),
  postorder(Right, RightList),
  append(LeftList, RightList, NewList),
  append(NewList,[Root],List).