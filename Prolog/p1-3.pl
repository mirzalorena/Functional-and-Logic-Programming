%3.a.Define a predicate to remove from a list all repetitive eleme%nts.

%remove_occ(l1..ln,e)=
%->[] , n=0;
%->remove_occ(l2..ln) , l1=e;
%->l1+remove_occ(l2..ln) , l1!=e;
%remove_occ(L-list, E-int, R-res)
%remove_occ(i,i,o)

remove_occ([],_,[]).
remove_occ([H|T],E,R):- H=:=E,
    remove_occ(T,E,R).
remove_occ([H|T],E,[H|R]) :- H=\=E,
           remove_occ(T,E,R).

%count_occ(l1..ln,e)=
%-> 0, n=0;
%-> 1+count_occ(l2..ln,e) , l1=e;
%->count_occ(l2..ln,2) , l1!=e;
%count_occ(L-list,E-int, R-int).
%count_occ(i,i,o).

count_occ([],_,0).
count_occ([H|T],E,R) :- H=:=E,
    count_occ(T,E,R1),
    R is R1+1.
count_occ([H|T],E,R) :- H=\=E,
    count_occ(T,E,R).

%remove_repet(l1..ln)=
%->[] , n=0;
%-> l1+remove_repet(l2..ln), count_occ(l1..ln,l1)=1
%->remove_repet(l2..ln), otherwise;
%remove_repet(L-list,R-list)
%remove_repet(i,o)

remove_repet([],[]).
remove_repet([H|T],[H|R]):-
    count_occ([H|T],H,RC),
    RC =:=1,
    remove_repet(T,R).
remove_repet([H|T],R):-
    count_occ([H|T],H,RC),
    RC =\= 1,
    remove_occ([H|T],H,RO),
    remove_repet(RO,R).


% 3.b.Remove all occurrence of a maximum value from a list on in%tegernumbers.

%maxim(a,b)=
%->a, a>=b;
%->b , b>a;
%maxim(A - int, B- int, R-int).
%maxim(i,i,o);

maxim(A,B,A) :- A>=B.
maxim(A,B,B) :- B>A.

%maximList(l1..ln)=
%l1, n=1;
%maxim(l1,maximList(l2..ln))
%maximList(L-list, R-int)
%maximList(i,o).

maximList([H],H).
maximList([H|T],R):-
    maximList(T,RM),
    maxim(H,RM,R).

%remove_maxim(l1..ln)=
%->remove_occ(l1..ln,maximList(l1..ln))
%remove_maxim(L-list, R-list)
%remove_maxim(i,o)

remove_maxim(L,R):-
    maximList(L,RM),
    remove_occ(L,RM,R).

















