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

:- consult('vocabulario.pl').
:- consult('read_atomics.pl').
:- consult('gramatica.pl').
:- consult('bancoPadroes.pl').

candidato :- write('Ola! Eu sou o Bot-3000, candidato a predidencia da republica.'), nl, 
				write('O que voce deseja saber de mim?'), nl,
				conversar. 

remove([], List, List).
remove([H|T], List2, [H|Result]) :- remove(T, List2, Result).

conversar(['tchau']) :- reponder(['Ate a proxima!']).
conversar :- nl, write('Escreva: '), read_atomics(Input), conversar(Input), !.
conversar(Dados) :- (casar([_,'voce', 'sabia', 'que', Artigo, Substantivo, _|_], Dicionario, Dados)
					->
					padrao(Estimulo, Resposta),
					casar(Estimulo, Dicionario, Dados),
					casar(Resposta, Dicionario, Saida),
					Lista = Dados,
					Lista = [X,Y|R],
					Lista = [A,B,C,F|D],
					write(D),
					remove(E, [_], R),
					write(E), write(R),
					escrever('Segundo minha memória, eu acho que', E, Artigo, Substantivo),
					write('Presidente: '), reponder(Saida), !, conversar
					;
					padrao(Estimulo, Resposta),
					casar(Estimulo, Dicionario, Dados),
					casar(Resposta, Dicionario, Saida),
					write('Presidente: '), reponder(Saida), !, conversar
     				).

reponder([]) :- nl. 
reponder([C|L]) :- write(C), write(' '), reponder(L). 

casar([],_,[]).
casar([Palavra|Padrao], Dicionario, [Palavra|Alvo]) :- atom(Palavra), casar(Padrao, Dicionario, Alvo).
casar([C|Padrao], Dicionario, Alvo) :- integer(C),
									consultar(C, Dicionario, AlvoEsquerdo),
									append(AlvoEsquerdo, AlvoDireito, Alvo),
									casar(Padrao, Dicionario, AlvoDireito).

consultar(Index, [(Index, Valor)|_], Valor).
consultar(Index, [(Index1, _)|Dicionario], Valor) :- \=(Index, Index1),
													consultar(Key, Dicionario, Valor).

escrever(Texto, R, Artigo, Substantivo) :-
		remove(E, [_], R),
		atomic_list_concat(R, ',', A),
		atomic_list_concat(E, ' ', B),
        append('bancoPadroes.pl'),
		
		atom_concat('\npadrao([ _,qual, sua, opiniao, sobre, ', Artigo, X),
		atom_concat(X, ', ', U),
		atom_concat(U, Substantivo, J),
        atom_concat(J , ', ?],[''', Z),
		atom_concat(Z, Texto, K),
		atom_concat(K, A, H),
        atom_concat(H, '.'']).', L),
		write(L),
		/*
		atom_concat('\npadrao([_,', A, S),
        atom_concat(S , ', _|_],[''', U),
		atom_concat(U, Texto, P),
		atom_concat(P, A, F),
        atom_concat(F, '.'']).', V),
        write(V),

		atom_concat('\npadrao([_,', A, Y),
        atom_concat(Y , ', _],[''', W),
		atom_concat(W, Texto, D),
		atom_concat(D, A, C),
        atom_concat(C, '.'']).', M),
        write(M),
		*/
        told.