-module(snmpm_user1). % aka snmp_manager_v3
-behaviour(snmpm_user).

%% snmpm_user callback API:
-export([handle_error/3,
  handle_agent/5,
  handle_pdu/4,
  handle_trap/3,
  handle_inform/3,
  handle_report/3]).

%% ========================================================================
%% snmpm_user callback functions
%% Signature of these CBs are defined by snmpm_user.
%% ========================================================================
handle_error(ReqId, Reason, Server) ->
  io:format("handle_error (A snmpm_user CB)~n"),
  ignore.

handle_agent(Domain, Address, Type, SnmpInfo, UserData) ->
  io:format("handle_agent (A snmpm_user CB)~n"),
  ignore.

handle_pdu(Agent, ReqId, SnmpResponse, Server) ->
  io:format("handle_pdu (A snmpm_user CB)~n"),
  io:format("received handle_pdu:"
  "~n   Agent:   ~p"
  "~n   ReqId:        ~p"
  "~n   SnmpResponse: ~p"
  "~n   Server:     ~p~n",
    [Agent, ReqId, SnmpResponse, Server]),
  ignore.

handle_trap(Agent, SnmpTrap, Server) ->
  io:format("handle_trap (A snmpm_user CB)~n"),
  ignore.

handle_inform(Agent, SnmpInform, Server) ->
  io:format("handle_inform (A snmpm_user CB)~n"),
  ignore.

handle_report(Agent, SnmpReport, Server) ->
  io:format("handle_report (A snmpm_user CB)~n"),
  ignore.