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
uint16_t id_pin;
// Pointer to receiver list
struct Msg_Handler ** pin_receiver_list_head;
struct Msg_Handler ** pin_receiver_list_tail;
// Handler Array
struct Msg_Handler * pin_handlers;
// Variables for the current instance state
int t2_Chart_State;
// Variables for the properties of the instance

};
// Declaration of prototypes outgoing messages:
void t2_Chart_OnEntry(int state, struct t2_Instance *_instance);
void t2_handle_pin_m(struct t2_Instance *_instance);
void t2_handle_pin_m3(struct t2_Instance *_instance);
// Declaration of callbacks for incoming messages:
void register_t2_send_pin_m3_listener(void (*_listener)(struct t2_Instance *));
void register_external_t2_send_pin_m3_listener(void (*_listener)(struct t2_Instance *));

// Definition of the states:
#define T2_CHART_STATE 0
#define T2_CHART_INIT_STATE 1



#ifdef __cplusplus
}
#endif

#endif //t2_H_
