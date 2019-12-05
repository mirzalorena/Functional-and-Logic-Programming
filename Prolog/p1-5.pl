%5.a.Write a predicate to compute the union of two sets

%remove_occ(l1..ln,e)=
%->[],n=0;
%-> l1+remove_occ(l2..ln) , l1!=e;
%->remove_occ(l2..ln) , l1=e;
%remove_occ(L-list,E-int, R-list)
%remove_occ(i,i,o)

remove_occ([],_,[]).
remove_occ([H|T],E,[H|R]):-
           H=\=E,
           remove_occ(T,E,R).
remove_occ([H|T],E,R):-
    H=:=E,
    remove_occ(T,E,R).

%union(a1..an, b1..bm)=
%-> [] , n=0 and m=0;
%-> union(b1..bm,[]) , n=0;
%-> a1+ union(remove_occ(a1..an,a1),remove_occ(b1..bm,a1)), n>0
%union(A-list, B-list, R-list)
%union(i,i,o).

union([],[],[]).
union([],B,R):-
    union(B,[],R).
union([H|T],B,[H|R]):-
    remove_occ([H|T],H,R1),
    remove_occ(B,H,R2),
    union(R1,R2,R).

