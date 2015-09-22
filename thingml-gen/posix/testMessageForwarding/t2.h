/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *           Header for Thing t2
 *  Generated from ThingML (http://www.thingml.org)
 *****************************************************/

#ifndef t2_H_
#define t2_H_

#ifdef __cplusplus
extern "C" {
#endif

#include "thingml_typedefs.h"

/*****************************************************************************
 * Headers for type : t2
 *****************************************************************************/

// Definition of the instance stuct:
struct t2_Instance {
// Variables for the ID of the instance
int id;
// Variables for the current instance state
int t2_org.sintef.thingml.impl.StateMachineImpl_State;
// Variables for the properties of the instance
};

// Declaration of prototypes outgoing messages:
void t2_org.sintef.thingml.impl.StateMachineImpl_OnEntry(int state, struct t2_Instance *_instance);
void t2_handle_p1_m(struct t2_Instance *_instance);
// Declaration of callbacks for incomming messages:
void register_t2_send_p2_m_listener(void (*_listener)(struct t2_Instance*));

// Definition of the states:
#define T2_ORG.SINTEF.THINGML.IMPL.STATEMACHINEIMPL_STATE 0
#define T2_ORG.SINTEF.THINGML.IMPL.STATEMACHINEIMPL_S1_STATE 1



#ifdef __cplusplus
}
#endif

#endif //t2_H_