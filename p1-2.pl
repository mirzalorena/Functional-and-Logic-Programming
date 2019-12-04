%2.a. Write a predicate to remove all occurrences of a certain atm
% from a list

%remove_all_occ(l1..ln,e)=
%-> [] , n=0;
%-> remove_all_occ(l2..ln,e) , l1=e;
%-> l1+remove_all_occ(l2..ln,e) , l1!=e;
%remove_all_occ(L-list, E-int , R-list)
%flow: remove_all_occ(i,i,o)

remove_all_occ([],_,[]).
remove_all_occ([H|T],E,R) :- H=:=E,
    remove_all_occ(T,E,R).
remove_all_occ([H|T],E,[H|R]) :- H=\=E,
    remove_all_occ(T,E,R).

% 2.b.Define a predicate to produce a list of pairs (atom n) from %aninitial list of atoms. In this initial list atom has
%n occurrences.

%count_occ(l1..ln,e)=
%-> [], n=0;
%-> 1+count_occ(l2..ln) , l1=e;
%-> count_occ(l2..ln) , l1!=e;
%count_occ(L-list, E-int, R-int)
%count_occ(i,i,o)

count_occ([],_,0).
count_occ([H|T],E,R):- H=:=E,
    count_occ(T,E,R1),
    R is R1+1.
count_occ([H|T],E,R):- H=\=E,
    count_occ(T,E,R).

%numberatom(l1..ln)=
%-> [], n=0;
%->[l1,count_occ(l1)]+numberatom(remo_all_occ(l1)) , otherwise
%numberatom(L-list, R-list)
%numberatom(i,o)

numberatom([],[]).
numberatom([H|T], [[H, RC]|R]) :-
    count_occ([H|T], H, RC),
    remove_all_occ(T, H, RR),
    numberatom(RR, R).









