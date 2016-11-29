% Danh Nguyen, Ryan Dehart, Teresa Condon
% Program 4
% Word Search

% Program description: Solves word search puzzle. User inputs a section of the puzzle and the
% program searches if the hidden word is within the list.

% http://stackoverflow.com/questions/20250462/check-if-string-is-substring-in-prolog
% http://forum.devmaster.net/t/find-words-puzzle-game-in-prolog/18366/3
% http://stackoverflow.com/questions/8276510/working-with-2d-arrays-in-prolog

% ---------- MAIN ----------
main :-

  % Write intro
  write('Hello Churl, here is your puzzle.\n'),
  % Writes the table, row by row
  write(' b h j a l i c e w r t h q p l k u \n l n n x z a z c k l o z p b i a s \n g i g l o o w i v b y x t r y f k \n c v v y q n i c b e d a t a r q l \n e d r i c k g c e w q a g h u d s \n j b d x c u p q w x f h y t e s t \n l b y g d s a p p l e b n r d e a \n f i u r w q k p i c v f r i e s z \n'),
  % Writes the hidden words
  write('Hidden Words: alice, igloo, rick, test, apple, fries'),
  nl,

  findWord1,
  findWord2,
  findWord3,
  findWord4,
  findWord5,
  findWord6,

  write('\n\nBye bye!').

  % This chunk of code searches for hidden words, row by row
  % and records their positions in S. We also wrote a predicate
  % that finds if a substring is in a string without recording
  % the position at the bottom of the program.
  %
  % alice
  findWord1 :-
    sub_atom(bhjalicewrthqplku, S, L, A, alice),
    write('\n alice can be found at position: '),
    write(S).

  % igloo
  findWord2 :-
    sub_atom(gigloowivbyxtryfk, S, L, A, igloo),
    write('\n igloo can be found at position: '),
    write(S).

  % rick
  findWord3 :-
    sub_atom(edrickgcewqaghuds, S, L, A, rick),
    write('\n rick can be found at position: '),
    write(S).

  % test
  findWord4 :-
    sub_atom(jbdxcupqwxfhytest, S, L, A, test),
    write('\n test can be found at position: '),
    write(S).

  % apple
  findWord5 :-
    sub_atom(lbygdsapplebnrdea, S, L, A, apple),
    write('\n apple can be found at position: '),
    write(S).

  % fries
  findWord6 :-
    sub_atom(fiurwqkpicvfriesz, S, L, A, fries),
    write('\n fries can be found at position: '),
    write(S).

% ---------- FIND HIDDEN WORDS ----------

% found at:
% http://stackoverflow.com/questions/20250462/check-if-string-is-substring-in-prolog

% takes a table in format of rows seperated by new line character, and checks if a string
% is in the table. Also working on checking backwords.
% Using suffixes and prefixes, it is very concise.
findWord(Table, String)
:-
  append(_, Suffix, Table), % searches all possible tails (Suffixes) of Table
  append(String, _, Suffix), % searches all possible heads (Rrefixes) of Suffix
  String \= [] % if a match is found, exit
  .

% So it works like this (example):
% Table = [a, b, c, d, \n, e, f, g, h]
% String = [b, c, d]
%
% It iterates through possible tails, this being the correct one:
% Head = [a], Tail = [b, c, d, \n, e, f, g, h]
% It then iterates through possible heads of the previous tail, this being the
% correct one:
% Head = [b, c, d], Tail = [\n, e, f, g, h]
%
% Thus, it found a prefix of a suffix of the original Table that matches the
% 'String' parameter.
