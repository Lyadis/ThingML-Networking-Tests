/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *           Header for Thing t3
 *  Generated from ThingML (http://www.thingml.org)
 *****************************************************/

#ifndef t3_H_
#define t3_H_

#ifdef __cplusplus
extern "C" {
#endif

#include "thingml_typedefs.h"

/*****************************************************************************
 * Headers for type : t3
 *****************************************************************************/

// Definition of the instance stuct:
struct t3_Instance {
// Variables for the ID of the instance
int id;
// Variables for the current instance state
int t3_org.sintef.thingml.impl.StateMachineImpl_State;
// Variables for the properties of the instance
};

// Declaration of prototypes outgoing messages:
void t3_org.sintef.thingml.impl.StateMachineImpl_OnEntry(int state, struct t3_Instance *_instance);
void t3_handle_p_m(struct t3_Instance *_instance);
// Declaration of callbacks for incomming messages:

// Definition of the states:
#define T3_ORG.SINTEF.THINGML.IMPL.STATEMACHINEIMPL_STATE 0
#define T3_ORG.SINTEF.THINGML.IMPL.STATEMACHINEIMPL_S1_STATE 1



#ifdef __cplusplus
}
#endif

#endif //t3_H_