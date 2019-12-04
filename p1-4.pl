%4.a.Write a predicate to determine the difference of two sets


%contains(l1..ln,e)=
%->false, n=0;
%->true , l1=e;
%-> contains(l2..ln,e) , otherwise
%contains(L-list, E-int)
%containt(i,i)

contains([V|_],V) :- !.
contains([_|T],V) :- contains(T,V).

%A-B two sets
%difference(a1..an,b1..bn)=
%->[], n=0;
%-> difference(a2..an, b1..bn) , contains(b1..bn, a1)=true;
%-> a1+ difference(a2..an, b1..bn) , otherwise;
%difference(A-list, B-list, R-list)
%difference(i,i,o)

difference([],_,[]).
difference([H|T],B,R) :-
    contains(B,H),
    difference(T,B,R), !.
difference([H|T],B,[H|R]) :-
    difference(T,B,R).

%4.b. Write a predicate to add value 1 after every even element from a list.

%insert(l1..ln)=
%-> [], n=0;
%-> l1+1+insert(l2..ln), l1%2==0;
%-> l1+insert(l2..ln) , l1%2!=0;
%insert(L-list,R-list)
%insert(i,o)

insert([],[]).
insert([H|T],[H,1|R]):-
    H mod 2 =:= 0,
    insert(T,R).
insert([H|T],[H|R]):-
    H mod 2 =\= 0,
    insert(T,R).











