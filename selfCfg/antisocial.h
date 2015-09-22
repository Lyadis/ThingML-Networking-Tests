/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *           Header for Thing antisocial
 *  Generated from ThingML (http://www.thingml.org)
 *****************************************************/

#ifndef antisocial_H_
#define antisocial_H_

#ifdef __cplusplus
extern "C" {
#endif

#include "thingml_typedefs.h"

/*****************************************************************************
 * Headers for type : antisocial
 *****************************************************************************/

// Definition of the instance stuct:
struct antisocial_Instance {
// Variables for the ID of the ports of the instance
uint16_t id_pout;
// Pointer to receiver list
struct Msg_Handler ** pout_receiver_list_head;
struct Msg_Handler ** pout_receiver_list_tail;
uint16_t id_pin;
// Handler Array
struct Msg_Handler * pin_handlers;
// Variables for the current instance state
int antisocial_Chart_State;
// Variables for the properties of the instance

};
// Declaration of prototypes outgoing messages:
void antisocial_Chart_OnEntry(int state, struct antisocial_Instance *_instance);
void antisocial_handle_pin_m(struct antisocial_Instance *_instance, char * s);
// Declaration of callbacks for incoming messages:
void register_antisocial_send_pout_m_listener(void (*_listener)(struct antisocial_Instance *, char *));
void register_external_antisocial_send_pout_m_listener(void (*_listener)(struct antisocial_Instance *, char *));

// Definition of the states:
#define ANTISOCIAL_CHART_STATE 0
#define ANTISOCIAL_CHART_INIT_STATE 1



#ifdef __cplusplus
}
#endif

#endif //antisocial_H_
