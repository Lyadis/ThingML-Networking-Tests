/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *           Header for Thing gateway
 *  Generated from ThingML (http://www.thingml.org)
 *****************************************************/

#ifndef gateway_H_
#define gateway_H_

#ifdef __cplusplus
extern "C" {
#endif

#include "thingml_typedefs.h"

/*****************************************************************************
 * Headers for type : gateway
 *****************************************************************************/

// Definition of the instance stuct:
struct gateway_Instance {
// Variables for the ID of the ports of the instance
uint16_t id_listen;
// Handler Array
struct Msg_Handler * listen_handlers;
uint16_t id_send;
// Pointer to receiver list
struct Msg_Handler ** send_receiver_list_head;
struct Msg_Handler ** send_receiver_list_tail;
uint16_t id_send2;
// Pointer to receiver list
struct Msg_Handler ** send2_receiver_list_head;
struct Msg_Handler ** send2_receiver_list_tail;
// Variables for the current instance state
int gateway_chrt_State;
// Variables for the properties of the instance

};
// Declaration of prototypes outgoing messages:
void gateway_chrt_OnEntry(int state, struct gateway_Instance *_instance);
void gateway_handle_listen_printHello(struct gateway_Instance *_instance);
// Declaration of callbacks for incoming messages:
void register_gateway_send_send_printHello_listener(void (*_listener)(struct gateway_Instance *));
void register_external_gateway_send_send_printHello_listener(void (*_listener)(struct gateway_Instance *));
void register_gateway_send_send2_printHello_listener(void (*_listener)(struct gateway_Instance *));
void register_external_gateway_send_send2_printHello_listener(void (*_listener)(struct gateway_Instance *));

// Definition of the states:
#define GATEWAY_CHRT_STATE 0
#define GATEWAY_CHRT_ACTIVE_STATE 1



#ifdef __cplusplus
}
#endif

#endif //gateway_H_
