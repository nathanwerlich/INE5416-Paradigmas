:- consult('cco.pl').
% Questao 1 - t1C
nfase(F, N) :- findall(N, disciplina(F, N, _), L), length(L, N).

% Questao 2 - t1C
ncurso(N) :- findall(N, disciplina(_, N, _), L), length(L, N).

% Questao 3 - t1C
ntempre(N) :- findall(D, setof(Dpre, prerequisito(Dpre, D), L), L), length(L, N).

% Questao 4 - t1C
nsaopre(N) :- findall(Dpre, prerequisito(Dpre, _), L), sort(L, L2), length(L2, N).

% Questao 5 - t1C
npre(D, N) :- findall(Dpre, prerequisito(Dpre, D), L), length(L, N).
%findall(_, prerequisito(_, D), L), length(L, N).

% Questao 6 - t1C
npresetof(D,N) :- setof(Dpre, prerequisito(Dpre, D), L), length(L, N) .
maispre(D2) :- findall(M, npresetof(D2, M), L), max_list(L, N) ,npresetof(D2, N).

% Questao 7 - t1C
npos(D,N) :- findall(_, prerequisito(D, _), L), length(L, N).

% Questao 8 - t1C
% Tentativa 3.0 de Solução.
%pegapos([X|Y], L) :- findall(Z, npos(X, Z), QtdPos), T is [QtdPos], append(L, T).
%pegapos([], L) :- T is [], append(L, T).
%maispos(D) :- findall(D, disciplina(_, D, _), L), pegapos[L, Qtd], max_list(Qtd, K), npos(D, K).
%maispos(D) :- findall(M, npos(D,M), L) ,max_list(L, N) , npos(D, N).
%findall(N, npos(_, N), L), max_list(L, M), npos(D, M).

npossetof(D,N) :- setof(Dpre, prerequisito(D, Dpre), L), length(L, N).
maispos(D) :- findall(M, npossetof(D, M), L), max_list(L, N) , npossetof(D, N).

% Questao 9 - t1C

auxprecad(Dpre, []) :- \+prerequisito(Dpre, _).
auxprecad(Dpre, [D|N]) :- prerequisito(Dpre, D), auxprecad(D, N).
cad(D, [D|N]) :- auxprecad(D, N).
tamanhocad(D, P) :- cad(D, N), length(N, P).
maiorcadeia(D, C) :- aggregate_all(max(P), tamanhocad(D, P), P), cad(D, C), length(C, P).
maiorcadeia(N) :- findall(C, maiorcadeia(_, C), N).