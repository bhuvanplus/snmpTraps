-module(snmp_manager).
-export([start/0, get/0, async_get/0]).

-define(AGENT,     "Agent1"). % Agent #1 name
-define(USER,     ?MODULE). % Manager id
-define(USER_MOD, snmpm_user1).
%-define(USER_MOD, snmpm_user_default).

start() ->
  snmp:start(),
  snmpm:start(),
  snmpm:register_user(?USER, ?USER_MOD, undefined),
  Opts_Agent1 = [
    {engine_id, "agent1_engine_id"},
    {community, "public"},
    {version, v2},
    %{port, 161},
    {address, {127,0,0,1}}
  ],
  snmpm:register_agent(?USER, ?AGENT, Opts_Agent1).

get() ->
  Reply = snmpm:sync_get2(?USER, ?AGENT, [[1,3,6,1,2,1,1,1,0]]),
  io:format("SNMP Reply: ~p~n", [Reply]).

async_get() ->
  snmpm:async_get2(?USER, ?AGENT, [[1,3,6,1,2,1,1,1,0]]),
  io:format("Async GET Request sent.~n").