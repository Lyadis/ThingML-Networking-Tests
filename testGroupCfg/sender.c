/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *        Implementation for Thing sender
 *  Generated from ThingML (http://www.thingml.org)
 *****************************************************/

#include "sender.h"

/*****************************************************************************
 * Implementation for type : sender
 *****************************************************************************/

// Declaration of prototypes:
void sender_chrt_OnExit(int state, struct sender_Instance *_instance);
void sender_send_p_printHello(struct sender_Instance *_instance);
void sender_send_p2_printHello(struct sender_Instance *_instance);
// Declaration of functions:

// On Entry Actions:
void sender_chrt_OnEntry(int state, struct sender_Instance *_instance) {
switch(state) {
case SENDER_CHRT_STATE:
_instance->sender_chrt_State = SENDER_CHRT_ACTIVE_STATE;
sender_chrt_OnEntry(_instance->sender_chrt_State, _instance);
break;
case SENDER_CHRT_ACTIVE_STATE:
sender_send_p_printHello(_instance);
sender_send_p2_printHello(_instance);
fprintf(stdout, "[sender] msg sent\n");
break;
default: break;
}
}

// On Exit Actions:
void sender_chrt_OnExit(int state, struct sender_Instance *_instance) {
switch(state) {
case SENDER_CHRT_STATE:
sender_chrt_OnExit(_instance->sender_chrt_State, _instance);
break;
case SENDER_CHRT_ACTIVE_STATE:
break;
default: break;
}
}

// Event Handlers for incoming messages:

// Observers for outgoing messages:
void (*external_sender_send_p_printHello_listener)(struct sender_Instance *)= 0x0;
void register_external_sender_send_p_printHello_listener(void (*_listener)(struct sender_Instance *)){
external_sender_send_p_printHello_listener = _listener;
}
void (*sender_send_p_printHello_listener)(struct sender_Instance *)= 0x0;
void register_sender_send_p_printHello_listener(void (*_listener)(struct sender_Instance *)){
sender_send_p_printHello_listener = _listener;
}
void sender_send_p_printHello(struct sender_Instance *_instance){
if (sender_send_p_printHello_listener != 0x0) sender_send_p_printHello_listener(_instance);
if (external_sender_send_p_printHello_listener != 0x0) external_sender_send_p_printHello_listener(_instance);
;
}
void (*external_sender_send_p2_printHello_listener)(struct sender_Instance *)= 0x0;
void register_external_sender_send_p2_printHello_listener(void (*_listener)(struct sender_Instance *)){
external_sender_send_p2_printHello_listener = _listener;
}
void (*sender_send_p2_printHello_listener)(struct sender_Instance *)= 0x0;
void register_sender_send_p2_printHello_listener(void (*_listener)(struct sender_Instance *)){
sender_send_p2_printHello_listener = _listener;
}
void sender_send_p2_printHello(struct sender_Instance *_instance){
if (sender_send_p2_printHello_listener != 0x0) sender_send_p2_printHello_listener(_instance);
if (external_sender_send_p2_printHello_listener != 0x0) external_sender_send_p2_printHello_listener(_instance);
;
}



