%a prolog program showing the various family relatiionships among some  people

%generally males and females
male(abraham).
female(hilda).
female(sarah).
male(isaac).
male(lukas).
female(naomi).
male(jacob).
male(fred).
male(job).
female(margie).
female(evelyne).
male(esau).
female(rebeccah).
female(judy).
male(martin).
female(eunice).
male(joseph).
female(rachael).
female(leah).
male(jack).
male(judah).
famale(alicia).

%the eldest in the family tree: level 1
parent(abraham, isaac).
parent(abraham, naomi).
parent(sarah, isaac).
parent(sarah, naomi).
parent(abraham, lukas).
parent(hilda, lukas).

%level 2 family

parent(isaac, jacob).
parent(isaac, esau).
parent(rebeccah, jacob).
parent(rebeccah, esau).
parent(isaac, eunice).
parent(rebeccah, eunice).

parent(naomi, judy).
parent(naomi, martin).
parent(job, judy).
parent(job, martin).
parent(naomi, leah).
parent(judah, leah).

parent(lukas, evelyne).
parent(lukas, fred).
parent(margie, evelyne).
parent(margie, fred).
parent(margie, jack).
parent(joseph, jack).

%level 3 family  ---> to be continued



%the family relationships rules.

%father relationship rule.
father(X,Y) :-  parent(X,Y), male(X).

%mother relationship rule.
mother(Z,W) :-  parent(Z,W), female(Z).

%wife relationship rule.
wife(W, H) :- parent(W, C), parent(H, C), female(W).

%husband relationship rule.
husband(H, W) :- parent(H, V), parent(W, V), male(H).

%motherInLaw relationship rule.
motherInLaw(M, S) :- mother(M, W), (wife(W, S); husband(W, S)), \+mother(M, S).

%fatherInLaw relationship rule.
fatherInLaw(F, L) :- father(F, P), (wife(P, L) ; husband(P, L)), \+father(F, L).

%stepMother relatiionship rule.
stepMother(S, M) :-  wife(S, F) , father(F, M), \+mother(S, M). 

%stepFather relationship rule.
stepFather(F, S ) :-  husband(F, M), mother(M, S), \+father(F, S).


%grandfather relationship rule1.
grandfather(U, V) :- father(U, Z), parent(Z,V).

%grandmother relationship rule.
grandmother(U, V) :- mother(U, P), parent(P,V).

%grandparent relationship rule.
grandparent(Q, V) :- parent(Q, L), parent(L, V).

%brother relationship rule.
brother(K, L) :- parent(P, K), parent(P, L) , male(K),  K \== L. 

%sister relationship rule.
sister(R, D) :- parent(C, R), parent(C, D), female(R), R \= D.

%halfBrother relationship rule.
halfBrother(H, B) :-  brother(H, B), mother(M, H), \+mother(M, B).

%halfSister relatiionship rule.
halfSister(H, S) :- sister(H, S), mother(M, H), \+mother(M, S).

%aunt relationship rule.
aunt(A, U) :- sister(A, N), parent(N, U).

%uncle relationship rule.
uncle(U, M) :- brother(U, P), parent(P, M).

%cousin relationship rule1.
cousin(C, M) :- parent(A, C), (aunt(A, M) ; uncle(A, M)).

%niece relatiionship rule.
niece(N, S) :- female(N), parent(P, N), (sister(P, S) ; brother(P, S)).

%nephew relatiionship rule.
nephew(N, T) :- male(N), parent(P, N), (sister(P, T) ; brother(P, T)).