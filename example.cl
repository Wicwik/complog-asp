vehicle((veh1;veh2)).
outlook(veh1).
% forbidden(veh1).
blinker(veh2,left).

overtake(V,U,left) :- outlook(V), vehicle(U), vehicle(V), U!=V, not blinker(U, left).

overtake(V,U,right) :- outlook(V), vehicle(U), vehicle(V), U!=V, not overtake(V,U,left).
:- forbidden(V).

#show overtake/3.