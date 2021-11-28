/***************************************/
%     CS 381 - Programming Lab #5       %
%                                       %
%  <Matthew Mazon>                      %
%  <mazonm@oregonstate.edu>             %
%                                       %
/***************************************/

% load family tree
:- consult('royal.pl').

% enables piping in tests
portray(Term) :- atom(Term), format("~s", Term).

%Given in assignment
mother(M,C):- parent(M,C), female(M).
%Similar to mother but with male.
father(F,C):- parent(F,C), male(F).
%P is a spouse of S if: P is married to S or S is married to P.
spouse(P,S):- married(P,S); married(S,P).
%P is a child of C if P is a son of C or P is a daughter of C.
child(P,C):- son(P,C); daughter(P,C).
%P is a son of C if C is the parent of P and P is male.
son(P,C):- parent(C,P), male(P).
%P is a daughter of C if C is the parent of P and P is female.
daughter(P,C):- parent(C,P), female(P).
%P is a sibling of S if X is the parent of S and P is the child of S where P != S.
sibling(P,S):- parent(X, S), child(P, X), P\=S.
%B is a brother of P if B is a sibling of P and is male.
brother(B,P):- sibling(B,P), male(B).
%S is a sister of P if S is a sibling of P and S is female.
sister(S,P):- sibling(S,P), female(S).
%U is an uncle of P if X is a parent of P and U is a brther of X; DONT HAVE SECOND RULE WORKING.
uncle(U,P):- (parent(X,P), brother(U, X)); (parent(X,P), sibling(Y,X),spouse(U, Y), male(U)).
%A is an aunt of P if X is a parent of P and A is a sister of X; DONT HAVE SECOND RULE.
aunt(A,P):- (parent(X,P), sister(A, X)); (parent(X,P), sibling(Y,X), spouse(A, Y), female(A)).
%G is the grandparent of C if X is the parent of C and G is the parent of C.
grandparent(G,C):- parent(X, C), parent(G, X).
%G is the grandfather of C if G is the grandparent of C and G is male.
grandfather(G,C):- grandparent(G,C), male(G).
%G is the grandmother of C if G is the grandparent of C and G is female.
grandmother(G,C):- grandparent(G,C), female(G).
%G is the grandchild of P if X is the child of P and G is the child of X.
grandchild(G,P):- child(X,P), child(G,X).

%This is my base case. When A is the parent of N
ancestor(A,N):- parent(A,N).
%This is the recursion.
%A is an ancestor of N when A is the parent of X and X is the ancestor of N.
ancestor(A,N):- parent(A,X), ancestor(X,N).

%This is my base case: When D is the child of N.
descendant(D,N):- child(D,N). 
%This is the recursion.
%D is the descendent of N when D is the child of X and X is the descendent of N.
descendant(D,N):- child(D, X), descendant(X,N).

%This gets the age of somoone. It subtracts died from born.
older(X,Y):- died(X,E), born(X,B), died(Y,Q), born (Y,Z), (E-B) > (Q-Z).

%This looks at when someone was born then goes through and checks to see who reigned when G is greater than B and G is less than E.
regentWhenBorn(X,Y):- born(Y,G), reigned(X, B, E), G > B, G < E.