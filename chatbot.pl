
artigo(o).
artigo(a).
artigo(um).
artigo(uma).

nome(homem).
nome(mulher).
nome(rapaz).
nome(moça).

preposição(mediante).
preposicao(com).
preposicao(a).
preposicao(até).

verbo(estuda).
verbo(mora).
verbo(é).
verbo(está).

falar(X) :- oracao(X, [ ]).
oracao(Sujeito, Predicado) :- predicado_nominal(Sujeito, Resto), predicado_verbal(Resto, Predicado).

predicado_nominal([Nome | Predicado], Predicado) :- nome(Nome).
predicado_nominal([Artigo, Nome | Predicado], Predicado) :- artigo(Artigo), nome(Nome).

predicado_verbal([Verbo | Predicado], Predicado) :- verbo(Verbo).
predicado_verbal([Verbo, Preposicao | Resto], Predicado) :- verbo(Verbo), preposicao(Preposicao), predicado_nominal(Resto, Predicado).
