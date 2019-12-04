%6.a. Write a predicate to test if a list is a set

%count_occ(l1..ln,e)=
%-> 0, n=0;
%-> 1+count_occ(l2..ln) , l1=e;
%-> count_occ(l2..ln) , l1!=e;
%count_occ(L-list,E-int, R-int)
%count_occ(i,i,o)

count_occ([],_,0).
count_occ([H|T],E,R1):-
    H=:=E,
    count_occ(T,E,R),
    R1 is R+1.
count_occ([H|T],E,R):-
    H=\=E,
    count_occ(T,E,R).

%test_set(l1..ln)=
%-> false, n=0;
%-> false  , count_occ(l1..ln,l1)!=1;
%-> test_set(l2..ln) , otherwise;
%test_set(L-list)
%test_set(i)

test_set([]).
test_set([H|T]):-
    count_occ([H|T],H,R),
    R=:=1,
    test_set(T), !.


% 6.b.Write a predicate to remove the first three occurrences of %an element in a list. If the element occurs less
%than three times, all occurrences will be removed.

%remove_k_occ(l1..ln,e,k)=
%-> [] ,n=0;
%-> l1..ln, k=0
%remove_k_occ(l2..ln,e,k-1) , l1=e;
%l1+remove_k_occ(l2..ln,e,k) , l1!=e;
%remove_k_occ(L-list, E-int ,K-int, R-list)
%remove_k_occ(i,i,i,o)

remove_k_occ([],_,_,[]) :- !.
remove_k_occ(L,_,0,L) :- !.
remove_k_occ([H|T],E,K,R) :- H=:=E,
    K1 is K-1,
    remove_k_occ(T,E,K1,R).
remove_k_occ([H|T],E,K,[H|R]) :- H=\=E,
    remove_k_occ(T,E,K,R).

remove_3_occ(L,E,R) :- remove_k_occ(L,E,3,R).





















