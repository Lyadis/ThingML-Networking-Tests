/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *           Header for Thing sender
 *  Generated from ThingML (http://www.thingml.org)
 *****************************************************/

#ifndef sender_H_
#define sender_H_

#ifdef __cplusplus
extern "C" {
#endif

#include "thingml_typedefs.h"

/*****************************************************************************
 * Headers for type : sender
 *****************************************************************************/

// Definition of the instance stuct:
struct sender_Instance {
// Variables for the ID of the ports of the instance
uint16_t id_p;
// Pointer to receiver list
struct Msg_Handler ** p_receiver_list_head;
struct Msg_Handler ** p_receiver_list_tail;
uint16_t id_p2;
// Pointer to receiver list
struct Msg_Handler ** p2_receiver_list_head;
struct Msg_Handler ** p2_receiver_list_tail;
// Variables for the current instance state
int sender_chrt_State;
// Variables for the properties of the instance

};
// Declaration of prototypes outgoing messages:
void sender_chrt_OnEntry(int state, struct sender_Instance *_instance);
// Declaration of callbacks for incoming messages:
void register_sender_send_p_printHello_listener(void (*_listener)(struct sender_Instance *));
void register_external_sender_send_p_printHello_listener(void (*_listener)(struct sender_Instance *));
void register_sender_send_p2_printHello_listener(void (*_listener)(struct sender_Instance *));
void register_external_sender_send_p2_printHello_listener(void (*_listener)(struct sender_Instance *));

// Definition of the states:
#define SENDER_CHRT_STATE 0
#define SENDER_CHRT_ACTIVE_STATE 1



#ifdef __cplusplus
}
#endif

#endif //sender_H_
