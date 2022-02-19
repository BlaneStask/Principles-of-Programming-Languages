% 1
sorted([]) .
sorted([_]) .
sorted([X, Y|Z]) :- X =< Y, sorted( [Y|Z] ), !.

/* Testing:
 *  sorted([1,2,3,4]).
 *  sorted([6,2,5,4]).
 */

% 2
subsetsum(SET, SUM, ANSWER) :- subset(SET, ANSWER), sum(ANSWER, SUM).
sum([], 0).
sum([X|T], SUM) :- sum(T, TAILSUM), SUM is TAILSUM + X.
subset([], []).
subset([E|T], [E|NT]) :- subset(T, NT).
subset([_|T], NT) :- subset(T, NT).

/* Testing:
 *  subsetsum([1, 2, 2, 3, 4, 5], 5, Subset).
 *  subsetsum([1, 2, 2, 3, 4, 5], 3, Subset).
 */

% 3
concat([], L, L).
concat([X1|L1], L2, [X1|L3]) :- concat(L1, L2, L3).
shift([H|T], S) :- concat(T, [H], S).

/* Testing:
 *  shift([1, 2, 3, 4, 5], L1).
 *  shift([1, 2, 3, 4, 5], L1), shift(L1, L2).
 */

% 4
palindrome(L) :- reverse(L, L).

/* Testing:
 *  palindrome([1,2,2,1]).
 *  palindrome([1,2,3,1]).
 */

% 5
flatten2([], []) :- !.
flatten2([L|Ls], FL) :- !, flatten2(L, NewL), flatten2(Ls, NewLs), append(NewL, NewLs, FL).
flatten2(L, [L]).

/* Testing:
 *  flatten([a, b, [c, d], [], [[[e]]], f], L).
 *  flatten([a, [l, x], [c, e, d], [], [p], f], L).
 */

% 6
operator1 --> [+].
operator2 --> [-].
operator3 --> [*].
operator4 --> [/].
expr_trinary --> [1], operator1, [2].
expr_trinary --> [1], operator2, [2].
expr_trinary --> [1], operator3, [2].
expr_trinary --> [1], operator4, [2].
expr_trinary --> ([1]).
expr(E) :- phrase(expr_trinary, Expr_trinary).

/* Testing:
 *  expr(5-6).
 *  expr((5)).
 *  expr(5=6).
 */

% 7
btree(void).
btree(tree(_Element,Left,Right)) :- btree(Left), btree(Right).

/* Testing:
 *  binary_tree(tree(a,tree(b,tree(d,void,void),tree(e,void,void)),tree(c,tree(f,void,void),tree(g,void,void)))).
 */

% 8
ltree([], 0 ,_).
ltree([_, _, _], 1, 0).
ltree([_, LC, RC], N2, D2) :- D2 > 0, D is D2-1, ltree(LC, NL, D), ltree(RC, NR, D), N2 is NL+NR.

/* Testing:
 *  T = [8,[3,[1,[],[]],[6,[4,[],[]],[7,[],[]]]],[10,[],[14,[13,[],[]],[]]]], ltree(T,N,0).
 *  T = [8,[3,[1,[],[]],[6,[4,[],[]],[7,[],[]]]],[10,[],[14,[13,[],[]],[]]]], ltree(T,N,3).
 */