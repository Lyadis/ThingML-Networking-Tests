/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *           Header for Thing t1
 *  Generated from ThingML (http://www.thingml.org)
 *****************************************************/

#ifndef t1_H_
#define t1_H_

#ifdef __cplusplus
extern "C" {
#endif

#include "thingml_typedefs.h"

/*****************************************************************************
 * Headers for type : t1
 *****************************************************************************/

// Definition of the instance stuct:
struct t1_Instance {
// Variables for the ID of the instance
int id;
// Variables for the current instance state
int t1_org.sintef.thingml.impl.StateMachineImpl_State;
// Variables for the properties of the instance
};

// Declaration of prototypes outgoing messages:
void t1_org.sintef.thingml.impl.StateMachineImpl_OnEntry(int state, struct t1_Instance *_instance);
// Declaration of callbacks for incomming messages:
void register_t1_send_p_m_listener(void (*_listener)(struct t1_Instance*));

// Definition of the states:
#define T1_ORG.SINTEF.THINGML.IMPL.STATEMACHINEIMPL_STATE 0
#define T1_ORG.SINTEF.THINGML.IMPL.STATEMACHINEIMPL_S1_STATE 1



#ifdef __cplusplus
}
#endif

#endif //t1_H_