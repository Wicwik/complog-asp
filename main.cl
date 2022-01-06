pen(1..3).
has(1, grass).
has(2, water).

% hyppo(1).
% lion(1).
% zebra(1..4).
% antelope(1..2).

% animal((hyppo(1); lion(1); zebra(1..4); antelope(1..2))).
% large((hyppo(1))).
% carnivore((lion(1))).
% require(hyppo(1), water).
% require(antelope(1..2), grass).

animal(hyppo, 1).
animal(lion, 1).
animal(zebra, 1..4).
animal(antelope, 1..2).

carnivore(lion).
large(hyppo).

require(hyppo, water).
require(antelope, grass).


{ has_pen(animal(X, A), Y) : pen(Y) } = 1 :- animal(X, A).

% pens meet animal requirements
has_pen(animal(X, A), Y) :- require(X, Z), has(Y, Z), animal(X, A).

% a) max 3 animals
% :- { has_pen(_,Y) } > 3.

% b) carnivores can be only with large
:- has_pen(animal(X,A),Y), has_pen(animal(Z,A),Y), carnivore(X), not large(Z), X != Z.

% c)
% together()

#show has_pen/2.