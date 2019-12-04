%1.a. Sort a list with removing the double values


%lenght(l1..ln)=
%-> [] , n=0;
%-> 1+ lenght(l2..ln) , otherwise
%lenght(L-list, R-int)
%lenght(i,o)

lenght([],0).
lenght([_|T],R) :-
    lenght(T,R1),
    R is R1+1.

%my_merge(l1..ln, r1..rm)=
%-> l1..ln , m=0;
%-> r1..rm , n=0;
%-> l1+my_merge(l2..ln, r1..rm) , l1<=r1
%-> r1+my_merge(l1..ln , r2..rm) , l1>r1
%my_merge(L-list, R-list, R-list)
%my_merge(i,i,o)

my_merge(L,[],L).
my_merge([],R,R).
my_merge([HL|TL],[HR|TR],[HL|R]) :- HL=<HR,
    my_merge(TL, [HR|TR], R).
my_merge([HL|TL],[HR|TR],TR,R) :- HL>HR,
    my_merge([HL|TL],TR,R).

%my_append(l1..ln,e)=
%-> [e] , n=0;
%-> l1+ my_append(l2..ln,e) otherwise
%my_append(L-list, E-int ,R-list)
%my_append(i,i,o)

my_append([],E,[E]).
my_append([H|T],E,[H|R]):-
    my_append(T,E,R).


%split(l1..ln, c1..cm)=
%-> return , abs(m-n)<=1
%-> split(l2..ln,l1+c1..cm) , n>m
%split(L-list, LC-list, Left-list, Right- list)
%split(i,i,o,o)

split(L,LC,LC,L):-
    lenght(L,0,RL),
    lenght(LC,0,RLC),
    Diff is RLC-RL,
    abs(Diff,AUX),
    AUX =< 1.
split([H|T],LC,Left,Right):-
    my_append(LC,H,RA),
    split(T,RA,Left,Right).

%merge_sort(l1..ln)=
%-> [] , n=0;
%-> [l1] , n=1;
%-> my_merge(merge_sort(l1..l(n/2)),merge_sort(l(n/2+1)..ln))
%merge_sort(L-list, R-list)
%merge_sort(i,o)

merge_sort([],[]).
merge_sort([E],[E]).
merge_sort(L,R):-
    split(L,Left,Right),
    merge_sort(Left,RL),
    merge_sort(Right,RR),
    my_merge(RL,RR,R).

%remove_doubles(l1..ln)=
%-> [] , n=0;
%-> [l1] , n=1;
%-> l1+remove_doubles(l2..ln) , l1!=l2
%-> remove_doubles(l2..ln) , otherwise
%remove_doubles(L-list , R-list)
%remove_doubles(i,o)

remove_doubles([],[]).
remove_doubles([E],[E]).
remove_doubles([H1,H2|T],[H1|R]) :- H1=\=H2,
    remove_doubles([H2|T],R).
remove_doubles([H1,H2|T],R) :- H1=:=H2,
    remove_doubles([H2|T],R).


%sort_list(L-list, R-list)
%sort_list(i,o)

sort_list(L,R) :-
    merge_sort(L,RS),
    remove_doubles(RS,R).















































