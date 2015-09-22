/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *        Implementation for Thing T1
 *  Generated from ThingML (http://www.thingml.org)
 *****************************************************/

#include "T1.h"

/*****************************************************************************
 * Implementation for type : T1
 *****************************************************************************/

// Declaration of prototypes:
void T1_chart_OnExit(int state, struct T1_Instance *_instance);
void T1_send_p1_m(struct T1_Instance *_instance);
void T1_send_p1_m2(struct T1_Instance *_instance);
void T1_send_p2_m(struct T1_Instance *_instance);
void T1_send_p2_m2(struct T1_Instance *_instance);
// Declaration of functions:

// On Entry Actions:
void T1_chart_OnEntry(int state, struct T1_Instance *_instance) {
switch(state) {
case T1_CHART_STATE:
_instance->T1_chart_State = T1_CHART_INIT_STATE;
T1_chart_OnEntry(_instance->T1_chart_State, _instance);
break;
case T1_CHART_INIT_STATE:
T1_send_p1_m(_instance);
fprintf(stdout, "[T1] sent p1!m()\n");
T1_send_p2_m(_instance);
fprintf(stdout, "[T1] sent p2!m()\n");
T1_send_p1_m2(_instance);
fprintf(stdout, "[T1] sent p1!m2()\n");
T1_send_p2_m2(_instance);
fprintf(stdout, "[T1] sent p2!m2()\n");
break;
default: break;
}
}

// On Exit Actions:
void T1_chart_OnExit(int state, struct T1_Instance *_instance) {
switch(state) {
case T1_CHART_STATE:
T1_chart_OnExit(_instance->T1_chart_State, _instance);
break;
case T1_CHART_INIT_STATE:
break;
default: break;
}
}

// Event Handlers for incoming messages:

// Observers for outgoing messages:
void (*external_T1_send_p1_m_listener)(struct T1_Instance *)= 0x0;
void register_external_T1_send_p1_m_listener(void (*_listener)(struct T1_Instance *)){
external_T1_send_p1_m_listener = _listener;
}
void (*T1_send_p1_m_listener)(struct T1_Instance *)= 0x0;
void register_T1_send_p1_m_listener(void (*_listener)(struct T1_Instance *)){
T1_send_p1_m_listener = _listener;
}
void T1_send_p1_m(struct T1_Instance *_instance){
if (T1_send_p1_m_listener != 0x0) T1_send_p1_m_listener(_instance);
if (external_T1_send_p1_m_listener != 0x0) external_T1_send_p1_m_listener(_instance);
;
}
void (*external_T1_send_p1_m2_listener)(struct T1_Instance *)= 0x0;
void register_external_T1_send_p1_m2_listener(void (*_listener)(struct T1_Instance *)){
external_T1_send_p1_m2_listener = _listener;
}
void (*T1_send_p1_m2_listener)(struct T1_Instance *)= 0x0;
void register_T1_send_p1_m2_listener(void (*_listener)(struct T1_Instance *)){
T1_send_p1_m2_listener = _listener;
}
void T1_send_p1_m2(struct T1_Instance *_instance){
if (T1_send_p1_m2_listener != 0x0) T1_send_p1_m2_listener(_instance);
if (external_T1_send_p1_m2_listener != 0x0) external_T1_send_p1_m2_listener(_instance);
;
}
void (*external_T1_send_p2_m_listener)(struct T1_Instance *)= 0x0;
void register_external_T1_send_p2_m_listener(void (*_listener)(struct T1_Instance *)){
external_T1_send_p2_m_listener = _listener;
}
void (*T1_send_p2_m_listener)(struct T1_Instance *)= 0x0;
void register_T1_send_p2_m_listener(void (*_listener)(struct T1_Instance *)){
T1_send_p2_m_listener = _listener;
}
void T1_send_p2_m(struct T1_Instance *_instance){
if (T1_send_p2_m_listener != 0x0) T1_send_p2_m_listener(_instance);
if (external_T1_send_p2_m_listener != 0x0) external_T1_send_p2_m_listener(_instance);
;
}
void (*external_T1_send_p2_m2_listener)(struct T1_Instance *)= 0x0;
void register_external_T1_send_p2_m2_listener(void (*_listener)(struct T1_Instance *)){
external_T1_send_p2_m2_listener = _listener;
}
void (*T1_send_p2_m2_listener)(struct T1_Instance *)= 0x0;
void register_T1_send_p2_m2_listener(void (*_listener)(struct T1_Instance *)){
T1_send_p2_m2_listener = _listener;
}
void T1_send_p2_m2(struct T1_Instance *_instance){
if (T1_send_p2_m2_listener != 0x0) T1_send_p2_m2_listener(_instance);
if (external_T1_send_p2_m2_listener != 0x0) external_T1_send_p2_m2_listener(_instance);
;
}



