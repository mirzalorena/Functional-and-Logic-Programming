%1.a determine the lowest common multiple of a list

%additional functions:

%*function that computes de greatest common divisor of 2 numbers
%gcd(A - int, B - int, Res - int)
%gcd(i,i,o)
gcd(A,0,Res) :-
    Res = A.
gcd(A,B,Res) :-
    BP is A mod B,
    gcd(B,BP,Res).

%*function that computes the lowest common multiple of 2 integer numbers
%lcm(A - int, B - int, Res - int)
%flow(i,i,o)
lcm(0,0,0).
lcm(A,B,Res):-
    gcd(A,B,R1),
    Res is A*B/R1.

%main function:

%function that computes the lowest common multiple of a list
%lcmList(L - list, Res - int)
%flow(i,o)
lcmList([],1).
lcmList([H|T],Res):-
    lcmList(T,Res1),
    lcm(H,Res1,Res).


%1.b. add a value v after 1-st, 2-nd, 4-th, 8-th, … element in a list

%mathematical model:
%add(l1l2..ln,v,p,c)=
%-> [] , n=0
%-> add(l2..ln,v,p*2,c+1) , p=c;
%-> add(l2..ln,v,p,c+1) , p!=c;

%main function:
%add(L-list,V-int, P-int,C-int,R-res)
%flow(i,i,i,i,o)

add([],_,_,_,[]).
add([H|T],V,P,C,[H,V|TR]) :-
   P =:= C,
   C1 is C+1,
   P1 is P*2,
   add(T,V,P1,C1,TR).
add([H|T],V,P,C,[H|TR]) :-
   P =\= C,
   C1 is C+1,
   add(T,V,P,C1,TR).

addValue(L,V,R):-add(L,V,1,1,R).














