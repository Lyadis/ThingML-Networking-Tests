/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *           Header for Thing MQTTClientPSM
 *  Generated from ThingML (http://www.thingml.org)
 *****************************************************/

#ifndef MQTTClientPSM_H_
#define MQTTClientPSM_H_

#ifdef __cplusplus
extern "C" {
#endif

#include "thingml_typedefs.h"

/*****************************************************************************
 * Headers for type : MQTTClientPSM
 *****************************************************************************/


// BEGIN: Code from the c_header annotation MQTTClientPSM

#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>

#include "thingmlmqtt/ThingMLMQTT.h"
#include "MQTTAsync.h"

// END: Code from the c_header annotation MQTTClientPSM

// Definition of the instance stuct:
struct MQTTClientPSM_Instance {
// Variables for the ID of the ports of the instance
uint16_t id_mqttport;
// Pointer to receiver list
struct Msg_Handler ** mqttport_receiver_list_head;
struct Msg_Handler ** mqttport_receiver_list_tail;
// Handler Array
struct Msg_Handler * mqttport_handlers;
uint16_t id_syncmqttport;
// Pointer to receiver list
struct Msg_Handler ** syncmqttport_receiver_list_head;
struct Msg_Handler ** syncmqttport_receiver_list_tail;
// Handler Array
struct Msg_Handler * syncmqttport_handlers;
// Variables for the current instance state
int MQTTClientPSM_behavior_State;
// Variables for the properties of the instance
MQTTAsync MQTTClientPSM_client__var;
ThingMLMQTTContext* MQTTClientPSM_context__var;
const char* MQTTClientPSM_serverURI__var;
const char* MQTTClientPSM_clientId__var;
int MQTTClientPSM_qos__var;

};
// Declaration of prototypes outgoing messages:
void MQTTClientPSM_behavior_OnEntry(int state, struct MQTTClientPSM_Instance *_instance);
void MQTTClientPSM_handle_syncmqttport_subscribe(struct MQTTClientPSM_Instance *_instance, const char* topic);
void MQTTClientPSM_handle_syncmqttport_publish(struct MQTTClientPSM_Instance *_instance, const char* topic, char * msg);
void MQTTClientPSM_handle_mqttport_disconnect(struct MQTTClientPSM_Instance *_instance);
void MQTTClientPSM_handle_mqttport_reconnect(struct MQTTClientPSM_Instance *_instance);
// Declaration of callbacks for incoming messages:
void register_MQTTClientPSM_send_mqttport_subscribed_listener(void (*_listener)(struct MQTTClientPSM_Instance *));
void register_external_MQTTClientPSM_send_mqttport_subscribed_listener(void (*_listener)(struct MQTTClientPSM_Instance *));
void register_MQTTClientPSM_send_mqttport_connected_listener(void (*_listener)(struct MQTTClientPSM_Instance *));
void register_external_MQTTClientPSM_send_mqttport_connected_listener(void (*_listener)(struct MQTTClientPSM_Instance *));
void register_MQTTClientPSM_send_mqttport_unsubscribed_listener(void (*_listener)(struct MQTTClientPSM_Instance *));
void register_external_MQTTClientPSM_send_mqttport_unsubscribed_listener(void (*_listener)(struct MQTTClientPSM_Instance *));
void register_MQTTClientPSM_send_mqttport_disconnected_listener(void (*_listener)(struct MQTTClientPSM_Instance *));
void register_external_MQTTClientPSM_send_mqttport_disconnected_listener(void (*_listener)(struct MQTTClientPSM_Instance *));
void register_MQTTClientPSM_send_mqttport_published_listener(void (*_listener)(struct MQTTClientPSM_Instance *));
void register_external_MQTTClientPSM_send_mqttport_published_listener(void (*_listener)(struct MQTTClientPSM_Instance *));
void register_MQTTClientPSM_send_syncmqttport_message_received_listener(void (*_listener)(struct MQTTClientPSM_Instance *, const char*, char *));
void register_external_MQTTClientPSM_send_syncmqttport_message_received_listener(void (*_listener)(struct MQTTClientPSM_Instance *, const char*, char *));

// Definition of the states:
#define MQTTCLIENTPSM_BEHAVIOR_STATE 0
#define MQTTCLIENTPSM_BEHAVIOR_INITIALIZE_STATE 1
#define MQTTCLIENTPSM_BEHAVIOR_FINALIZE_STATE 2



#ifdef __cplusplus
}
#endif

#endif //MQTTClientPSM_H_
