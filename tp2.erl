-module(tp2).

-export([my_bang_bang/2,
	 fact/1,
	 my_take_while/2,
	 my_drop_while/2,
	 my_compose/3,
	 my_map/2
]).

my_bang_bang([Head | _], 0) ->
    Head;
my_bang_bang([_ | Tail], N) ->
    my_bang_bang(Tail, N - 1).

fact(0) ->
    1;
fact(N) ->
    fact(N - 1) * N.

my_take_while(Pred, [Head | Tail]) ->
    case Pred(Head) of
	true  -> [Head | my_take_while(Pred, Tail)];
	false -> []
    end;
my_take_while(_, []) ->
    [].

my_drop_while(Pred, [Head | Tail]) ->
    case Pred(Head) of
	true  -> my_drop_while(Pred, Tail);
	false -> [Head | Tail]
    end;
my_drop_while(_, []) ->
    [].

my_compose(F, G, X) ->
    F(G(X)).
	    
my_map(Fun, [Head | Tail]) ->
    [Fun(Head) | my_map(Fun, Tail)];
my_map(_, []) ->
    [].
