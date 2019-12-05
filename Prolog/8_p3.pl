%Generate all strings of n parenthesis correctly closed.
% Eg: n=4 => (()) and () ()

paranteza('(').
paranteza(')').

%check(l1..ln,c)=
%-> check(l2..ln,c+1) , l1='('
%-> check(l2..ln, c-1) , l1=')' and c>0
%check(L-list,C-int)
%check(i,i)


check([],0).
check([H|T],C):-
    H=='(',
    NC is C+1,
    check(T,NC).
check([H|T],C):-
    H==')',
    C > 0 ,
    NC is C-1,
    check(T,NC).

%allCombinations(n,i,c)=
%-> c , i=n;
%-> allCombinations(n,i+1,paranteza(x)+c) , otherwise
%allCombinations(N-int,I-int,C-list,R-list)
%allCombinations(i,i,i,o)

allCombinations(N,N,C,C) :- !.
allCombinations(N,I,C,R) :-
    paranteza(X),
    NI is I+1,
    allCombinations(N,NI,[X|C],R).

%oneSolution(N-int,R-list)
%oneSolution(i,o)

oneSolution(N,R):-
    allCombinations(N,0,[],R),
    check(R,0).

%allSolutions(N-int, R-list)
%allSolutions(i,o)

allSolutions(N,R):-
    findall(RPartial,oneSolution(N,RPartial),R).











































