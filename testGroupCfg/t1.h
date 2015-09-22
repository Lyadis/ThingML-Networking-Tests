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
// Variables for the ID of the ports of the instance
uint16_t id_p;
// Handler Array
struct Msg_Handler * p_handlers;
// Variables for the current instance state
int t1_chrt_State;
// Variables for the properties of the instance

};
// Declaration of prototypes outgoing messages:
void t1_chrt_OnEntry(int state, struct t1_Instance *_instance);
void t1_handle_p_printHello(struct t1_Instance *_instance);
// Declaration of callbacks for incoming messages:

// Definition of the states:
#define T1_CHRT_STATE 0
#define T1_CHRT_ACTIVE_STATE 1



#ifdef __cplusplus
}
#endif

#endif //t1_H_
