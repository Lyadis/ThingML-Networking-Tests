/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *           Header for Thing PingClient
 *  Generated from ThingML (http://www.thingml.org)
 *****************************************************/

#ifndef PingClient_H_
#define PingClient_H_

#ifdef __cplusplus
extern "C" {
#endif

#include "thingml_typedefs.h"

/*****************************************************************************
 * Headers for type : PingClient
 *****************************************************************************/

// Definition of the instance stuct:
struct PingClient_Instance {
// Variables for the ID of the instance
int id;
// Variables for the current instance state
int PingClient_PingClientMachine_State;
// Variables for the properties of the instance

};
// Declaration of prototypes outgoing messages:
void PingClient_PingClientMachine_OnEntry(int state, struct PingClient_Instance *_instance);
void PingClient_handle_ping_service_pong(struct PingClient_Instance *_instance);
// Declaration of callbacks for incoming messages:
void register_PingClient_send_ping_service_ping_listener(void (*_listener)(struct PingClient_Instance *));
void register_external_PingClient_send_ping_service_ping_listener(void (*_listener) external_(struct PingClient_Instance *));

// Definition of the states:
#define PINGCLIENT_PINGCLIENTMACHINE_STATE 0
#define PINGCLIENT_PINGCLIENTMACHINE_PING_STATE 1
#define PINGCLIENT_PINGCLIENTMACHINE_PONG_STATE 2
#define PINGCLIENT_PINGCLIENTMACHINE_STOP_STATE 3



#ifdef __cplusplus
}
#endif

#endif //PingClient_H_
