% Define colors
color(blue).
color(red).
color(green).
color(yellow).
color(purple).

% Check if X is in List
list_member(X,[X|_]).
list_member(X,[_|Tail]) :- list_member(X,Tail).

% Negation
not(P) :- P, !, fail ; true.

% Find if vertex-color pair in map
check_map(Vertex, [colored(Vertex,Color)|_], Color).
% Recursively check color map for specified entry
check_map(Vertex, [_|Tail], Color) :- check_map(Vertex, Tail, Color).

% Blank coloring is valid
valid_coloring(ColorMap, []).
% Check if coloring is valid by going through each edge and checking if the colors are different
valid_coloring(ColorMap, [edge(U,V)|Tail]) :- 
  check_map(U,ColorMap,Cu),
  check_map(V,ColorMap,Cv),
  not(Cu == Cv),
  valid_coloring(ColorMap, Tail).

% Blank coloring is a coloring still
coloring([],[]).
% Color vertices with up to 5 colors
coloring(Vertices, Coloring) :-
  color_vertices(Vertices, [color(blue),color(red),color(green),color(yellow),color(purple)], Coloring).
% Blank is fine
color_vertices([],_,[]).
% For each vertex get a color and color the vertex
color_vertices([V|Tail], Colors, [colored(V,C)|A]) :-
  list_member(C, Colors),
  color_vertices(Tail, Colors, A).

% Color graph by generating a coloring and checking if it is valid
color_graph(ColorMap,Vertices,Edges) :- coloring(Vertices,ColorMap), valid_coloring(ColorMap, Edges).
