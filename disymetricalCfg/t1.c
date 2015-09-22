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
void t1_Chart_OnExit(int state, struct t1_Instance *_instance);
void t1_send_pout_m(struct t1_Instance *_instance);
void t1_send_pout_m2(struct t1_Instance *_instance);
// Declaration of functions:

// On Entry Actions:
void t1_Chart_OnEntry(int state, struct t1_Instance *_instance) {
switch(state) {
case T1_CHART_STATE:
_instance->t1_Chart_State = T1_CHART_INIT_STATE;
t1_Chart_OnEntry(_instance->t1_Chart_State, _instance);
break;
case T1_CHART_INIT_STATE:
fprintf(stdout, "[t1] Init\n");
t1_send_pout_m(_instance);
fprintf(stdout, "[t1] sent m\n");
t1_send_pout_m2(_instance);
fprintf(stdout, "[t1] sent m2\n");
break;
default: break;
}
}

// On Exit Actions:
void t1_Chart_OnExit(int state, struct t1_Instance *_instance) {
switch(state) {
case T1_CHART_STATE:
t1_Chart_OnExit(_instance->t1_Chart_State, _instance);
break;
case T1_CHART_INIT_STATE:
break;
default: break;
}
}

// Event Handlers for incoming messages:

// Observers for outgoing messages:
void (*external_t1_send_pout_m_listener)(struct t1_Instance *)= 0x0;
void register_external_t1_send_pout_m_listener(void (*_listener)(struct t1_Instance *)){
external_t1_send_pout_m_listener = _listener;
}
void (*t1_send_pout_m_listener)(struct t1_Instance *)= 0x0;
void register_t1_send_pout_m_listener(void (*_listener)(struct t1_Instance *)){
t1_send_pout_m_listener = _listener;
}
void t1_send_pout_m(struct t1_Instance *_instance){
if (t1_send_pout_m_listener != 0x0) t1_send_pout_m_listener(_instance);
if (external_t1_send_pout_m_listener != 0x0) external_t1_send_pout_m_listener(_instance);
;
}
void (*external_t1_send_pout_m2_listener)(struct t1_Instance *)= 0x0;
void register_external_t1_send_pout_m2_listener(void (*_listener)(struct t1_Instance *)){
external_t1_send_pout_m2_listener = _listener;
}
void (*t1_send_pout_m2_listener)(struct t1_Instance *)= 0x0;
void register_t1_send_pout_m2_listener(void (*_listener)(struct t1_Instance *)){
t1_send_pout_m2_listener = _listener;
}
void t1_send_pout_m2(struct t1_Instance *_instance){
if (t1_send_pout_m2_listener != 0x0) t1_send_pout_m2_listener(_instance);
if (external_t1_send_pout_m2_listener != 0x0) external_t1_send_pout_m2_listener(_instance);
;
}



