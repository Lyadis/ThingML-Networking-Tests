/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *        Implementation for Thing PingServer
 *  Generated from ThingML (http://www.thingml.org)
 *****************************************************/

#include "PingServer.h"

/*****************************************************************************
 * Implementation for type : PingServer
 *****************************************************************************/

// Declaration of prototypes:
void PingServer_PongServerMachine_OnExit(int state, struct PingServer_Instance *_instance);
void PingServer_send_ping_service_pong(struct PingServer_Instance *_instance);
// Declaration of functions:

// On Entry Actions:
void PingServer_PongServerMachine_OnEntry(int state, struct PingServer_Instance *_instance) {
switch(state) {
case PINGSERVER_PONGSERVERMACHINE_STATE:
_instance->PingServer_PongServerMachine_State = PINGSERVER_PONGSERVERMACHINE_ACTIVE_STATE;
fprintf(stderr, "Ping Server Started!\n");
PingServer_PongServerMachine_OnEntry(_instance->PingServer_PongServerMachine_State, _instance);
break;
case PINGSERVER_PONGSERVERMACHINE_ACTIVE_STATE:
break;
default: break;
}
}

// On Exit Actions:
void PingServer_PongServerMachine_OnExit(int state, struct PingServer_Instance *_instance) {
switch(state) {
case PINGSERVER_PONGSERVERMACHINE_STATE:
PingServer_PongServerMachine_OnExit(_instance->PingServer_PongServerMachine_State, _instance);
break;
case PINGSERVER_PONGSERVERMACHINE_ACTIVE_STATE:
break;
default: break;
}
}

// Event Handlers for incoming messages:
void PingServer_handle_ping_service_ping(struct PingServer_Instance *_instance) {
uint8_t PingServer_PongServerMachine_State_event_consumed = 0;
if (_instance->PingServer_PongServerMachine_State == PINGSERVER_PONGSERVERMACHINE_ACTIVE_STATE) {
if (PingServer_PongServerMachine_State_event_consumed == 0 && 1) {
PingServer_send_ping_service_pong(_instance);
fprintf(stderr, "Server received ping\n");
PingServer_PongServerMachine_State_event_consumed = 1;
}
}
}

// Observers for outgoing messages:
void (*external_PingServer_send_ping_service_pong_listener)(struct PingServer_Instance *)= 0x0;
void register_external_PingServer_send_ping_service_pong_listener(void (*_listener)(struct PingServer_Instance *)){
external_PingServer_send_ping_service_pong_listener = _listener;
}
void (*PingServer_send_ping_service_pong_listener)(struct PingServer_Instance *)= 0x0;
void register_PingServer_send_ping_service_pong_listener(void (*_listener)(struct PingServer_Instance *)){
PingServer_send_ping_service_pong_listener = _listener;
}
void PingServer_send_ping_service_pong(struct PingServer_Instance *_instance){
if (PingServer_send_ping_service_pong_listener != 0x0) PingServer_send_ping_service_pong_listener(_instance);
if (external_PingServer_send_ping_service_pong_listener != 0x0) external_PingServer_send_ping_service_pong_listener(_instance);
;
}



