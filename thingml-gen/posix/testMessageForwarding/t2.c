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
#ifdef __cplusplus
extern "C" {
#endif
void t2_org.sintef.thingml.impl.StateMachineImpl_OnExit(int state, struct t2_Instance *_instance);
void t2_send_p2_m(struct t2_Instance *_instance);
#ifdef __cplusplus
}
#endif

// Declaration of functions:

// On Entry Actions:
void t2_org.sintef.thingml.impl.StateMachineImpl_OnEntry(int state, struct t2_Instance *_instance) {
switch(state) {
case T2_ORG.SINTEF.THINGML.IMPL.STATEMACHINEIMPL_STATE:
_instance->t2_org.sintef.thingml.impl.StateMachineImpl_State = T2_ORG.SINTEF.THINGML.IMPL.STATEMACHINEIMPL_S1_STATE;
t2_org.sintef.thingml.impl.StateMachineImpl_OnEntry(_instance->t2_org.sintef.thingml.impl.StateMachineImpl_State, _instance);
break;
case T2_ORG.SINTEF.THINGML.IMPL.STATEMACHINEIMPL_S1_STATE:
break;
default: break;
}
}

// On Exit Actions:
void t2_org.sintef.thingml.impl.StateMachineImpl_OnExit(int state, struct t2_Instance *_instance) {
switch(state) {
case T2_ORG.SINTEF.THINGML.IMPL.STATEMACHINEIMPL_STATE:
t2_org.sintef.thingml.impl.StateMachineImpl_OnExit(_instance->t2_org.sintef.thingml.impl.StateMachineImpl_State, _instance);
break;
case T2_ORG.SINTEF.THINGML.IMPL.STATEMACHINEIMPL_S1_STATE:
break;
default: break;
}
}

// Event Handlers for incoming messages:
void t2_handle_p1_m(struct t2_Instance *_instance) {
uint8_t t2_org.sintef.thingml.impl.StateMachineImpl_State_event_consumed = 0;
if (_instance->t2_org.sintef.thingml.impl.StateMachineImpl_State == T2_ORG.SINTEF.THINGML.IMPL.STATEMACHINEIMPL_S1_STATE) {
if (t2_org.sintef.thingml.impl.StateMachineImpl_State_event_consumed == 0 && 1) {
{
fprintf(stdout, "[t2] received m");

t2_send_p2_m(_instance);
fprintf(stdout, "[t2] sent m");

}
t2_org.sintef.thingml.impl.StateMachineImpl_State_event_consumed = 1;
}
}
}

// Observers for outgoing messages:
void (*t2_send_p2_m_listener)(struct t2_Instance*)= 0x0;
void register_t2_send_p2_m_listener(void (*_listener)(struct t2_Instance*)){
t2_send_p2_m_listener = _listener;
}
void t2_send_p2_m(struct t2_Instance *_instance){
if (t2_send_p2_m_listener != 0x0) t2_send_p2_m_listener(_instance);
}

