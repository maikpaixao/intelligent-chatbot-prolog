
/********* Casamento de padrôes entre estimulo/pergunta e resposta ******************/
/***********************************************************************************/

padrao([bom, dia]['Bom dia!']).
padrao([bom, dia, _]['Bom dia!']).

padrao([o, que, voce, acha, sobre, o, candidato, X],
		['Olha, eu nao quero falar sobre ', X, '. Vamos falar sobre mim.']).

padrao([o, que, voce, acha, sobre, o, candidato, X, _|_],
		['Olha, eu nao quero falar sobre ', X, '. Vamos falar sobre mim.']).

padrao([eu, gostaria, de, saber, como, o, senhor, pretende, tirar, o, brasil, dessa, crise],
		['Isso voce vai ter que falar com meu futuro ministro da fazenda.']).

padrao([eu, gostaria, de, saber, como, o, senhor, pretende, tirar, o, brasil, desse, crise, _|_],
		['Isso voce vai ter que falar com meu futuro ministro da fazenda.']).

padrao([eu, gostaria, que, voce, falasse, sobre, o, meio, ambiente],
		['O meio ambiente e sem duvida nenhuma uma ameaca ao desenvolvimento sustentavel.']).

padrao([eu, gostaria, que, voce, falasse, sobre, o, meio, ambiente, _|_],
		['O meio ambiente e sem duvida nenhuma uma ameaca ao desenvolvimento sustentavel.']).).

padrao([o, que, voce, acha, de, mulheres, gerindo, negocios],
		['A mulher abre o negocio, tem seus filhos, cria os filhos e se sustenta, tudo isso abrindo o negocio']).

padrao([o, que, voce, acha, de, mulheres, gerindo, negocios, _|_],
		['A mulher abre o negocio, tem seus filhos, cria os filhos e se sustenta, tudo isso abrindo o negocio']).

padrao([o, quao, importante, e, o, dia, das, criancas],
		['Se hoje e o dia das criancas, ontem eu disse que criancas o dia da crianca e dia da mae,
		do pai e das professoras, mas tambem e o dia dos animais, sempre que voce olha uma crianca,
		há sempre uma figura oculta, que e um cachorro atras.']).

padrao([o, quao, importante, e, o, dia, das, criancas, _|_],
		['Se hoje e o dia das criancas, ontem eu disse que criancas o dia da criança e dia da mae,
		do pai e das professoras, mas tambem e o dia dos animais, sempre que você olha uma crianca,
		ha sempre uma figura oculta, que e um cachorro atras.']).

padrao([qual, o, seu, relacionamento, com, os, prefeitos, das, cidades, brasileiras],
		['Eu sempre escuto os prefeitos. Por que e que eu escuto os prefeitos?
		Porque e la que esta a população do pais, ninguem mora na Uniao, ninguem mora']).

padrao([qual, o, seu, relacionamento, com, os, prefeitos, das, cidades, brasileiras, _|_],
		['Eu sempre escuto os prefeitos. Por que e que eu escuto os prefeitos?
		Porque e la que esta a população do pais, ninguem mora na Uniao, ninguem mora']).

padrao([voce, acredita, mesmo, no, et, de, varginha],
		['Primeiro, eu queria te dizer que eu tenho muito respeito pelo ET de Varginha.
		E eu sei que aqui, quem não viu conhece alguem que viu, ou tem alguem na familia que viu,
		mas de qualquer jeito eu começo dizendo que esse respeito pelo ET de Varginha esta garantido.']).

padrao([voce, acredita, mesmo, no, et, de, varginha, _|_],
		['Primeiro, eu queria te dizer que eu tenho muito respeito pelo ET de Varginha.
		E eu sei que aqui, quem não viu conhece alguém que viu, ou tem alguém na família que viu,
		mas de qualquer jeito eu começo dizendo que esse respeito pelo ET de Varginha esta garantido.']).

padrao([me, fala, sobre, a, autossuficiencia, do, brasil],
		['A autossuficiencia do Brasil sempre foi insuficiente.']).

padrao([me, fala, sobre, a, autossuficiencia, do, brasil, _|_],
		['A autossuficiencia do Brasil sempre foi insuficiente.']).

padrao([me, fala, sobre, a, importancia, dos, aeroportos, no, brasil],
		['O aeroporto que e uma outra forma de transporte. Alias, outra infraestrutura, me desculpe,
		outra infraestrutura de transporte, para uma outra forma que e a forma dos avioes que sao essenciais
		nesse pais continental.']).

padrao([me, fala, sobre, a, importancia, dos, aeroportos, no, brasil, _|_],
		['O aeroporto que e uma outra forma de transporte. Alias, outra infraestrutura, me desculpe,
		outra infraestrutura de transporte, para uma outra forma que e a forma dos avioes que sao essenciais
		nesse pais continental.']).

padrao([candidato, voce,sabia, que, Artigo, Substantivo, Verbo, _|_],['E mesmo? Nao sabia.']) :- artigo(Artigo),
																			substantivo(Substantivo),
																			verbo(Verbo).
																			
padrao([ _,qual, sua, opiniao, sobre, o, prolog, ?],['Segundo minha memoria, eu acho que o prolog e interessante.']).
padrao([ _, o, que, voce, pensa, sobre, o, prolog, ?],['Segundo minha memoria, eu acho que o prolog e interessante.']).