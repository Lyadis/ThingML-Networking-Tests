/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *        Implementation for Thing gateway
 *  Generated from ThingML (http://www.thingml.org)
 *****************************************************/

#include "gateway.h"

/*****************************************************************************
 * Implementation for type : gateway
 *****************************************************************************/

// Declaration of prototypes:
void gateway_chrt_OnExit(int state, struct gateway_Instance *_instance);
void gateway_send_send_printHello(struct gateway_Instance *_instance);
void gateway_send_send2_printHello(struct gateway_Instance *_instance);
// Declaration of functions:

// On Entry Actions:
void gateway_chrt_OnEntry(int state, struct gateway_Instance *_instance) {
switch(state) {
case GATEWAY_CHRT_STATE:
_instance->gateway_chrt_State = GATEWAY_CHRT_ACTIVE_STATE;
gateway_chrt_OnEntry(_instance->gateway_chrt_State, _instance);
break;
case GATEWAY_CHRT_ACTIVE_STATE:
break;
default: break;
}
}

// On Exit Actions:
void gateway_chrt_OnExit(int state, struct gateway_Instance *_instance) {
switch(state) {
case GATEWAY_CHRT_STATE:
gateway_chrt_OnExit(_instance->gateway_chrt_State, _instance);
break;
case GATEWAY_CHRT_ACTIVE_STATE:
break;
default: break;
}
}

// Event Handlers for incoming messages:
void gateway_handle_listen_printHello(struct gateway_Instance *_instance) {
uint8_t gateway_chrt_State_event_consumed = 0;
if (_instance->gateway_chrt_State == GATEWAY_CHRT_ACTIVE_STATE) {
if (gateway_chrt_State_event_consumed == 0 && 1) {
gateway_send_send_printHello(_instance);
gateway_send_send2_printHello(_instance);
fprintf(stdout, "[gateway] msg received\n");
gateway_chrt_State_event_consumed = 1;
}
}
}

// Observers for outgoing messages:
void (*external_gateway_send_send_printHello_listener)(struct gateway_Instance *)= 0x0;
void register_external_gateway_send_send_printHello_listener(void (*_listener)(struct gateway_Instance *)){
external_gateway_send_send_printHello_listener = _listener;
}
void (*gateway_send_send_printHello_listener)(struct gateway_Instance *)= 0x0;
void register_gateway_send_send_printHello_listener(void (*_listener)(struct gateway_Instance *)){
gateway_send_send_printHello_listener = _listener;
}
void gateway_send_send_printHello(struct gateway_Instance *_instance){
if (gateway_send_send_printHello_listener != 0x0) gateway_send_send_printHello_listener(_instance);
if (external_gateway_send_send_printHello_listener != 0x0) external_gateway_send_send_printHello_listener(_instance);
;
}
void (*external_gateway_send_send2_printHello_listener)(struct gateway_Instance *)= 0x0;
void register_external_gateway_send_send2_printHello_listener(void (*_listener)(struct gateway_Instance *)){
external_gateway_send_send2_printHello_listener = _listener;
}
void (*gateway_send_send2_printHello_listener)(struct gateway_Instance *)= 0x0;
void register_gateway_send_send2_printHello_listener(void (*_listener)(struct gateway_Instance *)){
gateway_send_send2_printHello_listener = _listener;
}
void gateway_send_send2_printHello(struct gateway_Instance *_instance){
if (gateway_send_send2_printHello_listener != 0x0) gateway_send_send2_printHello_listener(_instance);
if (external_gateway_send_send2_printHello_listener != 0x0) external_gateway_send_send2_printHello_listener(_instance);
;
}



