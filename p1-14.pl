%14.a.Write a predicate to test equality of two sets without using the set difference.

%lenght(l1..ln)=
%-> [] , n=0;
%-> 1+ lenght(l2..ln) , otherwise
%lenght(L-list, R-int)
%lenght(i,o)

lenght([],0).
lenght([_|T],R) :-
    lenght(T,R1),
    R is R1+1.

%contains(l1..ln,e)=
%-> false, n=0;
%-> true , l1=e;
%-> contains(l2..ln,e) , otherwise
%contains(L-list,E-int)
%contains(i,i)

contains([V|_],V) :- !.
contains([_|T],E) :- contains(T,E).


%remove_occ(l1..ln,e)=
%-> [] , n=0;
%-> l1+remove_occ(l2..ln) , l1!=e
%-> remove_occ(l2..ln) , l1=e;
%remove_occ(L-list, E-int , R-list)
%remove_occ(i,i,o)

remove_occ([],_,[]).
remove_occ([H|T],E,[H|R]):-
           H=\=E,
           remove_occ(T,E,R).
remove_occ([H|T],E,R):-
    H=:=E,
    remove_occ(T,E,R).

%set_equal(a1..an, b1..bm)=
%-> true , n=0 and m=0;
%-> set_equal(remove_occ(a2..an,b1),remove_occ(b2..bm,a1),
% n=m and contains(a1..an,b1)=true and contains(b1..bm,a1) = tru
% set_equal(A-list, B-list)
% set_equal(i,i).


set_equal([],[]).
set_equal([HA|TA],[HB|TB]):-
    lenght(TA,CA),
    lenght(TB,CB),
    CA =:= CB,
    contains([HB|TB],HA),
    contains([HA|TA],HB),
    remove_occ(TB,HA,RA),
    remove_occ(TA,HB,RB),
    set_equal(RA,RB).


%14.b. Write a predicate to select the n-th element of a given list.

%select_n(l1..ln,n)=
%-> l1 , n=1;
%-> select_n(l1..ln,n-1) , otherwise
%select_n(L-list, N-int , R-int).
%select_n(i,i,o).

select_n([H|_],1,H):- !.
select_n([_|T],N,R) :-
    N1 is N-1,
    select_n(T,N1,R).

































