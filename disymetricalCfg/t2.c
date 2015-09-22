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
void t2_Chart_OnExit(int state, struct t2_Instance *_instance);
void t2_send_pin_m3(struct t2_Instance *_instance);
// Declaration of functions:

// On Entry Actions:
void t2_Chart_OnEntry(int state, struct t2_Instance *_instance) {
switch(state) {
case T2_CHART_STATE:
_instance->t2_Chart_State = T2_CHART_INIT_STATE;
t2_Chart_OnEntry(_instance->t2_Chart_State, _instance);
break;
case T2_CHART_INIT_STATE:
fprintf(stdout, "[t2] Init\n");
break;
default: break;
}
}

// On Exit Actions:
void t2_Chart_OnExit(int state, struct t2_Instance *_instance) {
switch(state) {
case T2_CHART_STATE:
t2_Chart_OnExit(_instance->t2_Chart_State, _instance);
break;
case T2_CHART_INIT_STATE:
break;
default: break;
}
}

// Event Handlers for incoming messages:
void t2_handle_pin_m(struct t2_Instance *_instance) {
uint8_t t2_Chart_State_event_consumed = 0;
if (_instance->t2_Chart_State == T2_CHART_INIT_STATE) {
if (t2_Chart_State_event_consumed == 0 && 1) {
fprintf(stdout, "[t2] received m\n");
t2_send_pin_m3(_instance);
fprintf(stdout, "[t2] sent m3\n");
t2_Chart_State_event_consumed = 1;
}
}
}
void t2_handle_pin_m3(struct t2_Instance *_instance) {
uint8_t t2_Chart_State_event_consumed = 0;
if (_instance->t2_Chart_State == T2_CHART_INIT_STATE) {
if (t2_Chart_State_event_consumed == 0 && 1) {
fprintf(stdout, "[t2] received m3\n");
t2_Chart_State_event_consumed = 1;
}
}
}

// Observers for outgoing messages:
void (*external_t2_send_pin_m3_listener)(struct t2_Instance *)= 0x0;
void register_external_t2_send_pin_m3_listener(void (*_listener)(struct t2_Instance *)){
external_t2_send_pin_m3_listener = _listener;
}
void (*t2_send_pin_m3_listener)(struct t2_Instance *)= 0x0;
void register_t2_send_pin_m3_listener(void (*_listener)(struct t2_Instance *)){
t2_send_pin_m3_listener = _listener;
}
void t2_send_pin_m3(struct t2_Instance *_instance){
if (t2_send_pin_m3_listener != 0x0) t2_send_pin_m3_listener(_instance);
if (external_t2_send_pin_m3_listener != 0x0) external_t2_send_pin_m3_listener(_instance);
;
}



