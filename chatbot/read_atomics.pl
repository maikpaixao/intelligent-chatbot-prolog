% Natural Language Processing for Prolog Programmers - Michael A. Covington

read_atomics(Atomics) :- read_char(FirstC,FirstT),complete_line(FirstC,FirstT,Atomics).
read_char(Char,Type) :- get0(C),char_type(C,Type,Char).

complete_line(_,end,[]) :- !.
complete_line(_,blank,Atomics) :- !,read_atomics(Atomics).
complete_line(FirstC,special,[A|Atomics]) :- !,name(A,[FirstC]),read_atomics(Atomics).
complete_line(FirstC,alpha,[A|Atomics]) :- 
   complete_word(FirstC,alpha,Word,NextC,NextT),name(A,Word),complete_line(NextC,NextT,Atomics).

complete_word(FirstC,alpha,[FirstC|List],FollC,FollT) :- !,read_char(NextC,NextT),complete_word(NextC,NextT,List,FollC,FollT).
complete_word(FirstC,FirstT,[],FirstC,FirstT).

char_type(10,end,10) :- !.
char_type(13,end,13) :- !.
char_type(-1,end,-1) :- !.
char_type(Code,blank,32) :- Code =< 32, !.
char_type(Code,alpha,Code) :- 48 =< Code, Code =< 57, !.
char_type(Code,alpha,Code) :- 97 =< Code, Code =< 122, !.
char_type(Code,alpha,NewCode) :- 65 =< Code, Code =< 90, !, NewCode is Code + 32.
char_type(95,alpha,95):-!.
char_type(46,alpha,46):-!.
char_type(Code,special,Code).