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
// Variables for the ID of the ports of the instance
uint16_t id_p;
// Handler Array
struct Msg_Handler * p_handlers;
uint16_t id_p2;
// Handler Array
struct Msg_Handler * p2_handlers;
uint16_t id_p3;
// Handler Array
struct Msg_Handler * p3_handlers;
uint16_t id_p4;
// Handler Array
struct Msg_Handler * p4_handlers;
// Variables for the current instance state
int t2_chrt_State;
// Variables for the properties of the instance

};
// Declaration of prototypes outgoing messages:
void t2_chrt_OnEntry(int state, struct t2_Instance *_instance);
void t2_handle_p2_printHello(struct t2_Instance *_instance);
void t2_handle_p3_printHello(struct t2_Instance *_instance);
void t2_handle_p4_printHello(struct t2_Instance *_instance);
void t2_handle_p_printHello(struct t2_Instance *_instance);
// Declaration of callbacks for incoming messages:

// Definition of the states:
#define T2_CHRT_STATE 0
#define T2_CHRT_ACTIVE_STATE 1



#ifdef __cplusplus
}
#endif

#endif //t2_H_
