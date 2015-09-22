/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *        Implementation for Thing T2
 *  Generated from ThingML (http://www.thingml.org)
 *****************************************************/

#include "T2.h"

/*****************************************************************************
 * Implementation for type : T2
 *****************************************************************************/

// Declaration of prototypes:
void T2_chart_OnExit(int state, struct T2_Instance *_instance);
// Declaration of functions:

// On Entry Actions:
void T2_chart_OnEntry(int state, struct T2_Instance *_instance) {
switch(state) {
case T2_CHART_STATE:
_instance->T2_chart_State = T2_CHART_INIT_STATE;
T2_chart_OnEntry(_instance->T2_chart_State, _instance);
break;
case T2_CHART_INIT_STATE:
fprintf(stdout, "[T2] Init\n");
break;
default: break;
}
}

// On Exit Actions:
void T2_chart_OnExit(int state, struct T2_Instance *_instance) {
switch(state) {
case T2_CHART_STATE:
T2_chart_OnExit(_instance->T2_chart_State, _instance);
break;
case T2_CHART_INIT_STATE:
break;
default: break;
}
}

// Event Handlers for incoming messages:
void T2_handle_p1_m2(struct T2_Instance *_instance) {
uint8_t T2_chart_State_event_consumed = 0;
if (_instance->T2_chart_State == T2_CHART_INIT_STATE) {
if (T2_chart_State_event_consumed == 0 && 1) {
fprintf(stdout, "[T2] received p1?m2\n");
T2_chart_State_event_consumed = 1;
}
}
}
void T2_handle_p1_m(struct T2_Instance *_instance) {
uint8_t T2_chart_State_event_consumed = 0;
if (_instance->T2_chart_State == T2_CHART_INIT_STATE) {
if (T2_chart_State_event_consumed == 0 && 1) {
fprintf(stdout, "[T2] received p1?m\n");
T2_chart_State_event_consumed = 1;
}
}
}
void T2_handle_p1_m3(struct T2_Instance *_instance) {
uint8_t T2_chart_State_event_consumed = 0;
if (_instance->T2_chart_State == T2_CHART_INIT_STATE) {
if (T2_chart_State_event_consumed == 0 && 1) {
fprintf(stdout, "[T2] received p1?m3\n");
T2_chart_State_event_consumed = 1;
}
}
}
void T2_handle_p2_m2(struct T2_Instance *_instance) {
uint8_t T2_chart_State_event_consumed = 0;
if (_instance->T2_chart_State == T2_CHART_INIT_STATE) {
if (T2_chart_State_event_consumed == 0 && 1) {
fprintf(stdout, "[T2] received p2?m2\n");
T2_chart_State_event_consumed = 1;
}
}
}
void T2_handle_p2_m(struct T2_Instance *_instance) {
uint8_t T2_chart_State_event_consumed = 0;
if (_instance->T2_chart_State == T2_CHART_INIT_STATE) {
if (T2_chart_State_event_consumed == 0 && 1) {
fprintf(stdout, "[T2] received p2?m\n");
T2_chart_State_event_consumed = 1;
}
}
}
void T2_handle_p2_m3(struct T2_Instance *_instance) {
uint8_t T2_chart_State_event_consumed = 0;
if (_instance->T2_chart_State == T2_CHART_INIT_STATE) {
if (T2_chart_State_event_consumed == 0 && 1) {
fprintf(stdout, "[T2] received p2?m3\n");
T2_chart_State_event_consumed = 1;
}
}
}

// Observers for outgoing messages:



