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
#ifdef __cplusplus
extern "C" {
#endif
void t1_org.sintef.thingml.impl.StateMachineImpl_OnExit(int state, struct t1_Instance *_instance);
void t1_send_p_m(struct t1_Instance *_instance);
#ifdef __cplusplus
}
#endif

// Declaration of functions:

// On Entry Actions:
void t1_org.sintef.thingml.impl.StateMachineImpl_OnEntry(int state, struct t1_Instance *_instance) {
switch(state) {
case T1_ORG.SINTEF.THINGML.IMPL.STATEMACHINEIMPL_STATE:
_instance->t1_org.sintef.thingml.impl.StateMachineImpl_State = T1_ORG.SINTEF.THINGML.IMPL.STATEMACHINEIMPL_S1_STATE;
t1_org.sintef.thingml.impl.StateMachineImpl_OnEntry(_instance->t1_org.sintef.thingml.impl.StateMachineImpl_State, _instance);
break;
case T1_ORG.SINTEF.THINGML.IMPL.STATEMACHINEIMPL_S1_STATE:
{
t1_send_p_m(_instance);
fprintf(stdout, "[t1] sent m\n");

}
break;
default: break;
}
}

// On Exit Actions:
void t1_org.sintef.thingml.impl.StateMachineImpl_OnExit(int state, struct t1_Instance *_instance) {
switch(state) {
case T1_ORG.SINTEF.THINGML.IMPL.STATEMACHINEIMPL_STATE:
t1_org.sintef.thingml.impl.StateMachineImpl_OnExit(_instance->t1_org.sintef.thingml.impl.StateMachineImpl_State, _instance);
break;
case T1_ORG.SINTEF.THINGML.IMPL.STATEMACHINEIMPL_S1_STATE:
break;
default: break;
}
}

// Event Handlers for incoming messages:

// Observers for outgoing messages:
void (*t1_send_p_m_listener)(struct t1_Instance*)= 0x0;
void register_t1_send_p_m_listener(void (*_listener)(struct t1_Instance*)){
t1_send_p_m_listener = _listener;
}
void t1_send_p_m(struct t1_Instance *_instance){
if (t1_send_p_m_listener != 0x0) t1_send_p_m_listener(_instance);
}

