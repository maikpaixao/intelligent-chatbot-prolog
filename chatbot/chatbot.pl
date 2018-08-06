/*00000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000____________0000____000000____0000________________0000________________0000000
00000000____________0000____000000____0000________________0000________________0000000
00000000____000000000000____000000____0000____00000000____0000000000____0000000000000
00000000____000000000000______________0000____00000000____0000000000____0000000000000
00000000____000000000000______________0000________________0000000000____0000000000000
00000000____000000000000____000000____0000________________0000000000____0000000000000
00000000____________0000____000000____0000____00000000____0000000000____0000000000000
00000000____________0000____000000____0000____00000000____0000000000____0000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000*/

:- consult('read_atomics.pl').
:- consult('gramatica.pl').
:- consult('bancoPadroes.pl').

presidente :- write('Ola! Eu sou o Bot-3000, atual presidente da republica.'), nl, 
				write('O que voce deseja saber de mim?'), nl,
				conversar. 

remove([], List, List).
remove([H|T], List2, [H|Result]) :- remove(T, List2, Result).

conversar(['tchau']) :- reponder(['Ate a proxima!']).
conversar :- nl, write('Escreva: '), read_atomics(Input), conversar(Input), !.
conversar(Dados) :- (write(Dados), casar(['voce', 'sabia', _|_], Dicionario, Dados)
					->
					write('achou\n'),
					padrao(Estimulo, Resposta),
					casar(Estimulo, Dicionario, Dados),
					casar(Resposta, Dicionario, Saida),
					Lista = Dados,
					Lista = [X,Y,Z|R],
					remove(E, [_], R),
					write(E),
					escrever('Sim, eu sabia que ', R),
					write('Presidente: '), reponder(Saida), !, conversar
					;
					write('perdeu\n'),
					padrao(Estimulo, Resposta),
					casar(Estimulo, Dicionario, Dados),
					casar(Resposta, Dicionario, Saida),
					write('Presidente: '), reponder(Saida), !, conversar
     				).

reponder([]) :- nl. 
reponder([C|L]) :- write(C), write(' '), reponder(L). 

casar([],_,[]).
casar([Palavra|Padrao], Dicionario, [Palavra|Alvo]) :- atom(Palavra), casar(Padrao, Dicionario, Alvo).
casar([C|Padrao], Dicionario, Alvo) :- integer(C), consultar(C, Dicionario, AlvoEsquerdo),
									append(AlvoEsquerdo, AlvoDireito, Alvo), casar(Padrao, Dicionario, AlvoDireito).

consultar(Index, [(Index, Valor)|_], Valor).
consultar(Index, [(Index1, _)|Dicionario], Valor) :- \=(Index, Index1), consultar(Key, Dicionario, Valor).

escrever(Texto, R) :-
		remove(E, [_], R),
		atomic_list_concat(R, ',', A),
		atomic_list_concat(E, ' ', B),
        append('bancoPadroes.pl'),
		
		atom_concat('\npadrao([voce,sabia,', A, X),
        atom_concat(X , '],[''', Z),
		atom_concat(Z, Texto, K),
		atom_concat(K, B, H),
        atom_concat(H, '.'']).', L),
		write(L),

		atom_concat('\npadrao([voce,sabia,', B, S),
        atom_concat(S , ', _|_],[''', U),
		atom_concat(U, Texto, P),
		atom_concat(P, B, F),
        atom_concat(F, '.'']).', V),
        write(V),

		atom_concat('\npadrao([voce,sabia,', B, Y),
        atom_concat(Y , ', _],[''', W),
		atom_concat(W, Texto, D),
		atom_concat(D, B, C),
        atom_concat(C, '.'']).', M),
        write(M),
        told.