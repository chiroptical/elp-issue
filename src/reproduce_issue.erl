-module(request_slack).

-export([
    response_url_get/2
]).

response_url_get(Url, Token) ->
    restc:request(
        get,
        json,
        Url,
        [200],
        [{<<"Authorization">>, <<"Bearer ", Token/binary>>}],
        {},
        []
    ).
