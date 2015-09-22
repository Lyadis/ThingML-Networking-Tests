/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *        Implementation for Thing PingClient
 *  Generated from ThingML (http://www.thingml.org)
 *****************************************************/

#include "PingClient.h"

/*****************************************************************************
 * Implementation for type : PingClient
 *****************************************************************************/

// Declaration of prototypes:
void PingClient_PingClientMachine_OnExit(int state, struct PingClient_Instance *_instance);
void PingClient_send_ping_service_ping(struct PingClient_Instance *_instance);
// Declaration of functions:

// On Entry Actions:
void PingClient_PingClientMachine_OnEntry(int state, struct PingClient_Instance *_instance) {
switch(state) {
case PINGCLIENT_PINGCLIENTMACHINE_STATE:
_instance->PingClient_PingClientMachine_State = PINGCLIENT_PINGCLIENTMACHINE_PING_STATE;
fprintf(stderr, "Ping Client Started!\n");
PingClient_PingClientMachine_OnEntry(_instance->PingClient_PingClientMachine_State, _instance);
break;
case PINGCLIENT_PINGCLIENTMACHINE_PING_STATE:
fprintf(stderr, "Send Ping...\n");
PingClient_send_ping_service_ping(_instance);
break;
case PINGCLIENT_PINGCLIENTMACHINE_PONG_STATE:
fprintf(stderr, "Got pong!\n");
break;
case PINGCLIENT_PINGCLIENTMACHINE_STOP_STATE:
fprintf(stderr, "Bye.\n");
break;
default: break;
}
}

// On Exit Actions:
void PingClient_PingClientMachine_OnExit(int state, struct PingClient_Instance *_instance) {
switch(state) {
case PINGCLIENT_PINGCLIENTMACHINE_STATE:
PingClient_PingClientMachine_OnExit(_instance->PingClient_PingClientMachine_State, _instance);
break;
case PINGCLIENT_PINGCLIENTMACHINE_PING_STATE:
break;
case PINGCLIENT_PINGCLIENTMACHINE_PONG_STATE:
break;
case PINGCLIENT_PINGCLIENTMACHINE_STOP_STATE:
break;
default: break;
}
}

// Event Handlers for incoming messages:
void PingClient_handle_ping_service_pong(struct PingClient_Instance *_instance) {
uint8_t PingClient_PingClientMachine_State_event_consumed = 0;
if (_instance->PingClient_PingClientMachine_State == PINGCLIENT_PINGCLIENTMACHINE_PING_STATE) {
if (PingClient_PingClientMachine_State_event_consumed == 0 && 1) {
PingClient_PingClientMachine_OnExit(PINGCLIENT_PINGCLIENTMACHINE_PING_STATE, _instance);
_instance->PingClient_PingClientMachine_State = PINGCLIENT_PINGCLIENTMACHINE_PONG_STATE;
PingClient_PingClientMachine_OnEntry(PINGCLIENT_PINGCLIENTMACHINE_PONG_STATE, _instance);
PingClient_PingClientMachine_State_event_consumed = 1;
}
}
}
void PingClient_handle_empty_event(struct PingClient_Instance *_instance) {
if (_instance->PingClient_PingClientMachine_State == PINGCLIENT_PINGCLIENTMACHINE_PONG_STATE) {
if (1) {
PingClient_PingClientMachine_OnExit(PINGCLIENT_PINGCLIENTMACHINE_PONG_STATE, _instance);
_instance->PingClient_PingClientMachine_State = PINGCLIENT_PINGCLIENTMACHINE_STOP_STATE;
PingClient_PingClientMachine_OnEntry(PINGCLIENT_PINGCLIENTMACHINE_STOP_STATE, _instance);
}
}
}

// Observers for outgoing messages:
void (*external_PingClient_send_ping_service_ping_listener)(struct PingClient_Instance *)= 0x0;
void register_external_PingClient_send_ping_service_ping_listener(void (*_listener)(struct PingClient_Instance *)){
external_PingClient_send_ping_service_ping_listener = _listener;
}
void (*PingClient_send_ping_service_ping_listener)(struct PingClient_Instance *)= 0x0;
void register_PingClient_send_ping_service_ping_listener(void (*_listener)(struct PingClient_Instance *)){
PingClient_send_ping_service_ping_listener = _listener;
}
void PingClient_send_ping_service_ping(struct PingClient_Instance *_instance){
if (PingClient_send_ping_service_ping_listener != 0x0) PingClient_send_ping_service_ping_listener(_instance);
if (external_PingClient_send_ping_service_ping_listener != 0x0) external_PingClient_send_ping_service_ping_listener(_instance);
;
}



