%15.a.Write a predicate to transform a list in a set, considering the first occurrence.


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

%list_to_set(l1..ln)=
%-> [] , n=0;
%-> l1+list_to_set(remove_occ(l2..ln,l1)) , otherwise
%list_to_set(L-list, R-list)
%list_to_set(i,o)

list_to_set([],[]).
list_to_set([H|T],[H|R]):-
    remove_occ(T,H,R1),
    list_to_set(R1,R).


%15.b.Write a predicate to decompose a list in a list respecting the following: [list of even numbers list of odd
% numbers] and also return the number of even numbers and the numbers of
% odd numbers


%decompose(l1..ln)=
%-> [0,0,[],[]] , n=0;
%-> {decompose(l2..ln),1+nr_even,l1+even_list} , l1%2=0;
%-> {decompose(l2..ln) , 1+nr_odd, l1+odd_list} , l1%2=1;
%decompose(L-list, R-list)
%decompose(i,o)

decompose([],[0,0,[],[]]).
decompose([H|T],[H1f,H2,[H|H3],H4]) :- H mod 2 =:= 0,
    decompose(T,[H1,H2,H3,H4]),
    H1f is H1 + 1.
decompose([H|T],[H1,H2f,H3,[H|H4]]) :- H mod 2 =:= 1,
    decompose(T,[H1,H2,H3,H4]),
    H2f is H2+1.








































