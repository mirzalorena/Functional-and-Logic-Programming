%7.a.Write a predicate to compute the intersection of two sets.

% contains(l1...ln, e) =
%	false, n = 0
%	true, l1 = e
%	contains(l2...ln, e), otherwise

% contains(L:list, E:number)
% contains(i, i)

contains([V|_], V) :- !.
contains([_|T], E) :- contains(T, E).

%intersecton(a1..an, b1..bm)=
%-> [] , n=0;
%-> a1+ insersection(a2..an,b1..bm) , contains(b1..bm,a1)=true
%-> intersection(a2..an , b1..bm) , otherwise;
%insersection(A-list, B-list, R-list)
%insersection(i,i,o)

intersection([], _, []).
intersection([H|T], B, [H|R]) :-
    contains(B, H),
    intersection(T, B, R), !.
intersection([_|T], B, R) :- intersection(T, B, R).
