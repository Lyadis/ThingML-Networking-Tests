/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *        Implementation for Thing t2
 *  Generated from ThingML (http://www.thingml.org)
 *****************************************************/

#include "t2.h"

/*****************************************************************************
 * Implementation for type : t2
 *****************************************************************************/

// Declaration of prototypes:
void t2_chrt_OnExit(int state, struct t2_Instance *_instance);
// Declaration of functions:

// On Entry Actions:
void t2_chrt_OnEntry(int state, struct t2_Instance *_instance) {
switch(state) {
case T2_CHRT_STATE:
_instance->t2_chrt_State = T2_CHRT_ACTIVE_STATE;
t2_chrt_OnEntry(_instance->t2_chrt_State, _instance);
break;
case T2_CHRT_ACTIVE_STATE:
break;
default: break;
}
}

// On Exit Actions:
void t2_chrt_OnExit(int state, struct t2_Instance *_instance) {
switch(state) {
case T2_CHRT_STATE:
t2_chrt_OnExit(_instance->t2_chrt_State, _instance);
break;
case T2_CHRT_ACTIVE_STATE:
break;
default: break;
}
}

// Event Handlers for incoming messages:
void t2_handle_p2_printHello(struct t2_Instance *_instance) {
uint8_t t2_chrt_State_event_consumed = 0;
if (_instance->t2_chrt_State == T2_CHRT_ACTIVE_STATE) {
if (t2_chrt_State_event_consumed == 0 && 1) {
fprintf(stdout, "[t2] p2:Hello\n");
t2_chrt_State_event_consumed = 1;
}
}
}
void t2_handle_p3_printHello(struct t2_Instance *_instance) {
uint8_t t2_chrt_State_event_consumed = 0;
if (_instance->t2_chrt_State == T2_CHRT_ACTIVE_STATE) {
if (t2_chrt_State_event_consumed == 0 && 1) {
fprintf(stdout, "[t2] p3:Hello\n");
t2_chrt_State_event_consumed = 1;
}
}
}
void t2_handle_p4_printHello(struct t2_Instance *_instance) {
uint8_t t2_chrt_State_event_consumed = 0;
if (_instance->t2_chrt_State == T2_CHRT_ACTIVE_STATE) {
if (t2_chrt_State_event_consumed == 0 && 1) {
fprintf(stdout, "[t2] p4:Hello\n");
t2_chrt_State_event_consumed = 1;
}
}
}
void t2_handle_p_printHello(struct t2_Instance *_instance) {
uint8_t t2_chrt_State_event_consumed = 0;
if (_instance->t2_chrt_State == T2_CHRT_ACTIVE_STATE) {
if (t2_chrt_State_event_consumed == 0 && 1) {
fprintf(stdout, "[t2] p:Hello\n");
t2_chrt_State_event_consumed = 1;
}
}
}

// Observers for outgoing messages:



