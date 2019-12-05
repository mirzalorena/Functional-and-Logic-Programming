%7.a. Determine the position of the maximal element of a linear list.
%Eg.: maxpos([10,14,12,13,14], L) produces L = [2,5].


%auxiliar functions:
%maxim(a,b)=
%-> a	,a>b;
%-> b	,b>a;
%maxim(A-int,B-int,R-int)
%maxim(i,i,o)

maxim(A,B,A) :- A>=B.
maxim(A,B,B) :- B>A.

%maxList(l1l2..ln)=
%-> 0	,n=0;
%-> H	,n=1;
%-> maxim(l1,maxList(l2..ln))	,otherwise
%maxList(L-list,R-int)
%maxList(i,o)

maxList([],0).
maxList([H],H).
maxList([H|T],R):-
    maxList(T,R1),
    maxim(H,R1,R).

%replacePos(l1l2..ln,v,pos)=
%-> []   ,n=0;
%->pos+replacePos(l2..ln,v,pos+1)   ,l1=v;
%->replacePos(l2..ln,v,pos+1)      l1!=v;
%replacePos(L-list, V-int,Pos-int,R-list)
%replacePos(i,i,i,o)

replacePos([],_,_,[]).
replacePos([H|T],V,Pos,[Pos|R]) :-
    H=:=V,
    Pos1 is Pos+1,
    replacePos(T,V,Pos1,R).
replacePos([H|T],V,Pos,R) :-
    H=\=V,
    Pos1 is Pos+1,
    replacePos(T,V,Pos1,R).

%main function:
%maxPos(L-list,R-list)
%maxPos(i,o)

maxPos(H,R) :-
    maxList(H,R1),
    replacePos(H,R1,1,R).


% 7.b.For a heterogeneous list, formed from integer numbers and %list ofnumbers, replace every sublist with the
%position of the maximum element from that sublist.


%main function:
%Mathematical model:
%heterList(l1..ln,list)=
%->[] , n=0
%-> replacePos(l1,maxList(l1),1)+heterList(l2..ln) , is_list(l1)=true
%->l1+heterList(l2..ln) , otherwise

%heterList(L-list, R-list)
%flow model: heterList(i,o)

heterList([],0).
heterList([H|T],[H1|R]) :- is_list(H), !,
    maxPos(H,H1),
    heterList(T,R).
heterList([H|T],[H|R]) :-
    heterList(T,R).





