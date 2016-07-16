-module(tp1).

-export([my_sub/2, my_neg/1, my_head/1, 
my_tail/1, my_append/2, my_init/1, 
my_last/1, my_null/1, my_length/1, 
my_reverse/1, my_take/2, my_drop/2,
my_get/2, my_concat/1, my_insert/2, my_sort/1]).

my_sub(X, Y) ->
    X - Y.

my_neg(X) ->
    my_sub(0, X).

my_head([Head | _]) ->
    Head.

my_tail([_ | Tail]) ->
    Tail.

my_append([], Ys) ->
    Ys;
my_append([Head | Tail], Ys) ->
    [Head | my_append(Tail, Ys)].

my_init([_ | []]) ->
    [];
my_init([Head | Tail]) ->
    [Head | my_init(Tail)].

my_last([Head | []]) ->
    Head;
my_last([_ | Tail]) ->
    my_last(Tail).

my_null([]) ->
    true;
my_null(_) ->
    false.

my_length([]) ->
    0;
my_length([_ | Tail]) ->
    1 + my_length(Tail).

my_reverse([]) ->
    [];
my_reverse([Head | Tail]) ->
    my_append(my_reverse(Tail), [Head]).

my_take(_, []) ->
    [];
my_take(1, [Head | _]) ->
    [Head];
my_take(N, [_ | Tail]) ->
    my_take(N - 1, Tail).

my_drop(_, []) ->
    [];
my_drop(1, [_ | Tail]) ->
    [Tail];
my_drop(N, [Head | Tail]) ->
    [Head | my_drop(N - 1, Tail)].

my_get(N, L) ->
    my_head(my_take(N, L)).

my_concat([]) ->
    [];
my_concat([Head | Tail]) ->
    my_append(Head, my_concat(Tail)).

my_insert(E, []) ->
    [E];
my_insert(E, [Head | Tail]) when E < Head ->
    [E | [Head | Tail]];
my_insert(E, [Head | Tail]) ->
    [Head | my_insert(E, Tail)].

my_sort([]) ->
    [];
my_sort([Head | Tail]) ->
    my_insert(Head, my_sort(Tail)).
