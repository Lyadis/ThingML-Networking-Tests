/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *        Implementation for Thing antisocial
 *  Generated from ThingML (http://www.thingml.org)
 *****************************************************/

#include "antisocial.h"

/*****************************************************************************
 * Implementation for type : antisocial
 *****************************************************************************/

// Declaration of prototypes:
void antisocial_Chart_OnExit(int state, struct antisocial_Instance *_instance);
void antisocial_send_pout_m(struct antisocial_Instance *_instance, char * s);
// Declaration of functions:

// On Entry Actions:
void antisocial_Chart_OnEntry(int state, struct antisocial_Instance *_instance) {
switch(state) {
case ANTISOCIAL_CHART_STATE:
_instance->antisocial_Chart_State = ANTISOCIAL_CHART_INIT_STATE;
antisocial_Chart_OnEntry(_instance->antisocial_Chart_State, _instance);
break;
case ANTISOCIAL_CHART_INIT_STATE:
fprintf(stdout, "[antisocial] Init\n");
antisocial_send_pout_m(_instance, "Bonjour");
fprintf(stdout, "[antisocial] sent m\n");
break;
default: break;
}
}

// On Exit Actions:
void antisocial_Chart_OnExit(int state, struct antisocial_Instance *_instance) {
switch(state) {
case ANTISOCIAL_CHART_STATE:
antisocial_Chart_OnExit(_instance->antisocial_Chart_State, _instance);
break;
case ANTISOCIAL_CHART_INIT_STATE:
break;
default: break;
}
}

// Event Handlers for incoming messages:
void antisocial_handle_pin_m(struct antisocial_Instance *_instance, char * s) {
uint8_t antisocial_Chart_State_event_consumed = 0;
if (_instance->antisocial_Chart_State == ANTISOCIAL_CHART_INIT_STATE) {
if (antisocial_Chart_State_event_consumed == 0 && 1) {
fprintf(stdout, "[antisocial] received m:");
if(s == NULL) {
fprintf(stdout, "NULL");
} else { 
					printf("%s", s);
				}
fprintf(stdout, "\n");
antisocial_Chart_State_event_consumed = 1;
}
}
}

// Observers for outgoing messages:
void (*external_antisocial_send_pout_m_listener)(struct antisocial_Instance *, char *)= 0x0;
void register_external_antisocial_send_pout_m_listener(void (*_listener)(struct antisocial_Instance *, char *)){
external_antisocial_send_pout_m_listener = _listener;
}
void (*antisocial_send_pout_m_listener)(struct antisocial_Instance *, char *)= 0x0;
void register_antisocial_send_pout_m_listener(void (*_listener)(struct antisocial_Instance *, char *)){
antisocial_send_pout_m_listener = _listener;
}
void antisocial_send_pout_m(struct antisocial_Instance *_instance, char * s){
if (antisocial_send_pout_m_listener != 0x0) antisocial_send_pout_m_listener(_instance, s);
if (external_antisocial_send_pout_m_listener != 0x0) external_antisocial_send_pout_m_listener(_instance, s);
;
}



