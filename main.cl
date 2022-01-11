% New York
pen(1..3).
has(1, grass).
has(2, water).

animal(hyppo, 1).
animal(lion, 1).
animal(zebra, 1..4).
animal(antelope, 1..2).

carnivore(lion).
large(hyppo).

require(hyppo, water).
require(antelope, grass).

% Bratislava
% pen(1..2).
% has(1, water).

% animal(hyppo, 1).
% animal(lion, 1).

% carnivore(lion).
% large(hyppo).

% require(hyppo, water).

% each animal must be in a single pen
{ has_pen(animal(X, A), Y) : pen(Y) } = 1 :- animal(X, A).

% pens meet animal requirements
has_pen(animal(X, A), Y) :- require(X, Z), has(Y, Z), animal(X, A).

% a) max 3 animals
{ has_pen(animal(X, A), Y) : animal(X, A) } <= 3 :- pen(Y).

% b) carnivores can be only with large
:- has_pen(animal(X, _), Y), has_pen(animal(Z, _), Y), carnivore(X), not large(Z), X != Z.

% c)
:- has_pen(animal(X, _), Y), has_pen(animal(X, _), Z), Y != Z.

#show has_pen/2.