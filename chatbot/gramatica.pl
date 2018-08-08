
:- consult('vocabulario.pl').

falar(X) :- oracao(X, [ ]).
oracao(Sujeito, Predicado) :- predicado_nominal(Sujeito, Resto), predicado_verbal(Resto, Predicado).

predicado_nominal([Nome | Predicado], Predicado) :- nome(Nome).
predicado_nominal([Pronome | Predicado], Predicado) :- pronome(Pronome).
predicado_nominal([Artigo, Nome | Predicado], Predicado) :- artigo(Artigo), nome(Nome).

predicado_verbal([Verbo | Predicado], Predicado) :- verbo(Verbo).
predicado_verbal([Verbo, Preposicao | Resto], Predicado) :- verbo(Verbo),
                                                            preposicao(Preposicao),
                                                            predicado_nominal(Resto, Predicado).

predicado_verbal([Verbo, Adverbio | Resto], Predicado) :- verbo(Verbo),
                                                        adverbio(Adverbio),
                                                        predicado_nominal(Resto, Predicado).
