/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *           Header for Thing PingServer
 *  Generated from ThingML (http://www.thingml.org)
 *****************************************************/

#ifndef PingServer_H_
#define PingServer_H_

#ifdef __cplusplus
extern "C" {
#endif

#include "thingml_typedefs.h"

/*****************************************************************************
 * Headers for type : PingServer
 *****************************************************************************/

// Definition of the instance stuct:
struct PingServer_Instance {
// Variables for the ID of the instance
int id;
// Variables for the current instance state
int PingServer_PongServerMachine_State;
// Variables for the properties of the instance

};
// Declaration of prototypes outgoing messages:
void PingServer_PongServerMachine_OnEntry(int state, struct PingServer_Instance *_instance);
void PingServer_handle_ping_service_ping(struct PingServer_Instance *_instance);
// Declaration of callbacks for incoming messages:
void register_PingServer_send_ping_service_pong_listener(void (*_listener)(struct PingServer_Instance *));
void register_external_PingServer_send_ping_service_pong_listener(void (*_listener) external_(struct PingServer_Instance *));

// Definition of the states:
#define PINGSERVER_PONGSERVERMACHINE_STATE 0
#define PINGSERVER_PONGSERVERMACHINE_ACTIVE_STATE 1



#ifdef __cplusplus
}
#endif

#endif //PingServer_H_
