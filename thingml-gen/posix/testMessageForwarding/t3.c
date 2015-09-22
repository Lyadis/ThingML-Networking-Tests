/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *        Implementation for Thing t3
 *  Generated from ThingML (http://www.thingml.org)
 *****************************************************/

#include "t3.h"

/*****************************************************************************
 * Implementation for type : t3
 *****************************************************************************/

// Declaration of prototypes:
#ifdef __cplusplus
extern "C" {
#endif
void t3_org.sintef.thingml.impl.StateMachineImpl_OnExit(int state, struct t3_Instance *_instance);
#ifdef __cplusplus
}
#endif

// Declaration of functions:

// On Entry Actions:
void t3_org.sintef.thingml.impl.StateMachineImpl_OnEntry(int state, struct t3_Instance *_instance) {
switch(state) {
case T3_ORG.SINTEF.THINGML.IMPL.STATEMACHINEIMPL_STATE:
_instance->t3_org.sintef.thingml.impl.StateMachineImpl_State = T3_ORG.SINTEF.THINGML.IMPL.STATEMACHINEIMPL_S1_STATE;
t3_org.sintef.thingml.impl.StateMachineImpl_OnEntry(_instance->t3_org.sintef.thingml.impl.StateMachineImpl_State, _instance);
break;
case T3_ORG.SINTEF.THINGML.IMPL.STATEMACHINEIMPL_S1_STATE:
break;
default: break;
}
}

// On Exit Actions:
void t3_org.sintef.thingml.impl.StateMachineImpl_OnExit(int state, struct t3_Instance *_instance) {
switch(state) {
case T3_ORG.SINTEF.THINGML.IMPL.STATEMACHINEIMPL_STATE:
t3_org.sintef.thingml.impl.StateMachineImpl_OnExit(_instance->t3_org.sintef.thingml.impl.StateMachineImpl_State, _instance);
break;
case T3_ORG.SINTEF.THINGML.IMPL.STATEMACHINEIMPL_S1_STATE:
break;
default: break;
}
}

// Event Handlers for incoming messages:
void t3_handle_p_m(struct t3_Instance *_instance) {
uint8_t t3_org.sintef.thingml.impl.StateMachineImpl_State_event_consumed = 0;
if (_instance->t3_org.sintef.thingml.impl.StateMachineImpl_State == T3_ORG.SINTEF.THINGML.IMPL.STATEMACHINEIMPL_S1_STATE) {
if (t3_org.sintef.thingml.impl.StateMachineImpl_State_event_consumed == 0 && 1) {
{
fprintf(stdout, "[t3] received m");

}
t3_org.sintef.thingml.impl.StateMachineImpl_State_event_consumed = 1;
}
}
}

// Observers for outgoing messages:

