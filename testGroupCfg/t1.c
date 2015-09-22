/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *        Implementation for Thing t1
 *  Generated from ThingML (http://www.thingml.org)
 *****************************************************/

#include "t1.h"

/*****************************************************************************
 * Implementation for type : t1
 *****************************************************************************/

// Declaration of prototypes:
void t1_chrt_OnExit(int state, struct t1_Instance *_instance);
// Declaration of functions:

// On Entry Actions:
void t1_chrt_OnEntry(int state, struct t1_Instance *_instance) {
switch(state) {
case T1_CHRT_STATE:
_instance->t1_chrt_State = T1_CHRT_ACTIVE_STATE;
t1_chrt_OnEntry(_instance->t1_chrt_State, _instance);
break;
case T1_CHRT_ACTIVE_STATE:
break;
default: break;
}
}

// On Exit Actions:
void t1_chrt_OnExit(int state, struct t1_Instance *_instance) {
switch(state) {
case T1_CHRT_STATE:
t1_chrt_OnExit(_instance->t1_chrt_State, _instance);
break;
case T1_CHRT_ACTIVE_STATE:
break;
default: break;
}
}

// Event Handlers for incoming messages:
void t1_handle_p_printHello(struct t1_Instance *_instance) {
uint8_t t1_chrt_State_event_consumed = 0;
if (_instance->t1_chrt_State == T1_CHRT_ACTIVE_STATE) {
if (t1_chrt_State_event_consumed == 0 && 1) {
fprintf(stdout, "[t1] Hello\n");
t1_chrt_State_event_consumed = 1;
}
}
}

// Observers for outgoing messages:



