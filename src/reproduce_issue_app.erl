%%%-------------------------------------------------------------------
%% @doc reproduce_issue public API
%% @end
%%%-------------------------------------------------------------------

-module(reproduce_issue_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    reproduce_issue_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
