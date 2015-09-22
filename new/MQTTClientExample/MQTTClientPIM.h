/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *           Header for Thing MQTTClientPIM
 *  Generated from ThingML (http://www.thingml.org)
 *****************************************************/

#ifndef MQTTClientPIM_H_
#define MQTTClientPIM_H_

#ifdef __cplusplus
extern "C" {
#endif

#include "thingml_typedefs.h"

/*****************************************************************************
 * Headers for type : MQTTClientPIM
 *****************************************************************************/

// Definition of the instance stuct:
struct MQTTClientPIM_Instance {
// Variables for the ID of the ports of the instance
uint16_t id_mqttport;
// Handler Array
struct Msg_Handler * mqttport_handlers;
uint16_t id_syncmqttport;
// Pointer to receiver list
struct Msg_Handler ** syncmqttport_receiver_list_head;
struct Msg_Handler ** syncmqttport_receiver_list_tail;
// Handler Array
struct Msg_Handler * syncmqttport_handlers;
uint16_t id_signal;
// Handler Array
struct Msg_Handler * signal_handlers;
// Variables for the current instance state
int MQTTClientPIM_behavior_State;
// Variables for the properties of the instance
const char* MQTTClientPIM_topic__var;
char * MQTTClientPIM_msg__var;

};
// Declaration of prototypes outgoing messages:
void MQTTClientPIM_behavior_OnEntry(int state, struct MQTTClientPIM_Instance *_instance);
void MQTTClientPIM_handle_syncmqttport_message_received(struct MQTTClientPIM_Instance *_instance, const char* topic, char * msg);
void MQTTClientPIM_handle_signal_clock_tick(struct MQTTClientPIM_Instance *_instance);
void MQTTClientPIM_handle_mqttport_subscribed(struct MQTTClientPIM_Instance *_instance);
void MQTTClientPIM_handle_mqttport_connected(struct MQTTClientPIM_Instance *_instance);
// Declaration of callbacks for incoming messages:
void register_MQTTClientPIM_send_syncmqttport_publish_listener(void (*_listener)(struct MQTTClientPIM_Instance *, const char*, char *));
void register_external_MQTTClientPIM_send_syncmqttport_publish_listener(void (*_listener)(struct MQTTClientPIM_Instance *, const char*, char *));
void register_MQTTClientPIM_send_syncmqttport_subscribe_listener(void (*_listener)(struct MQTTClientPIM_Instance *, const char*));
void register_external_MQTTClientPIM_send_syncmqttport_subscribe_listener(void (*_listener)(struct MQTTClientPIM_Instance *, const char*));
void register_MQTTClientPIM_send_syncmqttport_unsubscribe_listener(void (*_listener)(struct MQTTClientPIM_Instance *, const char*));
void register_external_MQTTClientPIM_send_syncmqttport_unsubscribe_listener(void (*_listener)(struct MQTTClientPIM_Instance *, const char*));

// Definition of the states:
#define MQTTCLIENTPIM_BEHAVIOR_STATE 0
#define MQTTCLIENTPIM_BEHAVIOR_INIT_STATE 1
#define MQTTCLIENTPIM_BEHAVIOR_START_STATE 2



#ifdef __cplusplus
}
#endif

#endif //MQTTClientPIM_H_
