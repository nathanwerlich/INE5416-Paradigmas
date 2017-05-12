:- consult('cco.pl').

% Questão 1 (resolvida)
discfase(D, F) :- disciplina(F, D, _).

% Questão 2
prereqfase(Dpr, Fpr) :- disciplina(Fpr, Dpr, _), prerequisito(Dpr, _).

% Questão 3

nomeprereqnome(Npr, N) :- disciplina(_, Cod, N), prerequisito(PCod, Cod), disciplina(_,PCod, Npr).

% Questão 4

nomeprereqfase(Npr, Dpr, Fpr) :- disciplina(Fpr, Dpr, Npr), prerequisito(Dpr, _).

% Questão 5

prereqdiscfase(Dpr, D, F) :- disciplina(F, D, _), prerequisito(Dpr, D).

% Questão 6

prereqdiscfaseprereq(Dpr, D, Fpr) :- disciplina(Fpr, Dpr, _), prerequisito(Dpr, D).

% Questão 7

nomeprereqdiscfase(Npr, Dpr, D, F) :-  disciplina(F, D, _), prerequisito(Dpr, D), disciplina(_,Dpr, Npr).