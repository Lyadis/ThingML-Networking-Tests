/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *        Implementation for Thing MQTTClientPIM
 *  Generated from ThingML (http://www.thingml.org)
 *****************************************************/

#include "MQTTClientPIM.h"

/*****************************************************************************
 * Implementation for type : MQTTClientPIM
 *****************************************************************************/

// Declaration of prototypes:
void MQTTClientPIM_behavior_OnExit(int state, struct MQTTClientPIM_Instance *_instance);
void MQTTClientPIM_send_syncmqttport_publish(struct MQTTClientPIM_Instance *_instance, const char* topic, char * msg);
void MQTTClientPIM_send_syncmqttport_subscribe(struct MQTTClientPIM_Instance *_instance, const char* topic);
void MQTTClientPIM_send_syncmqttport_unsubscribe(struct MQTTClientPIM_Instance *_instance, const char* topic);
// Declaration of functions:

// On Entry Actions:
void MQTTClientPIM_behavior_OnEntry(int state, struct MQTTClientPIM_Instance *_instance) {
switch(state) {
case MQTTCLIENTPIM_BEHAVIOR_STATE:
_instance->MQTTClientPIM_behavior_State = MQTTCLIENTPIM_BEHAVIOR_INIT_STATE;
MQTTClientPIM_behavior_OnEntry(_instance->MQTTClientPIM_behavior_State, _instance);
break;
case MQTTCLIENTPIM_BEHAVIOR_INIT_STATE:
break;
case MQTTCLIENTPIM_BEHAVIOR_START_STATE:
break;
default: break;
}
}

// On Exit Actions:
void MQTTClientPIM_behavior_OnExit(int state, struct MQTTClientPIM_Instance *_instance) {
switch(state) {
case MQTTCLIENTPIM_BEHAVIOR_STATE:
MQTTClientPIM_behavior_OnExit(_instance->MQTTClientPIM_behavior_State, _instance);
break;
case MQTTCLIENTPIM_BEHAVIOR_INIT_STATE:
break;
case MQTTCLIENTPIM_BEHAVIOR_START_STATE:
break;
default: break;
}
}

// Event Handlers for incoming messages:
void MQTTClientPIM_handle_syncmqttport_message_received(struct MQTTClientPIM_Instance *_instance, const char* topic, char * msg) {
uint8_t MQTTClientPIM_behavior_State_event_consumed = 0;
if (_instance->MQTTClientPIM_behavior_State == MQTTCLIENTPIM_BEHAVIOR_START_STATE) {
if (MQTTClientPIM_behavior_State_event_consumed == 0 && 1) {
fprintf(stdout, "new message recieved... \n");
MQTTClientPIM_behavior_State_event_consumed = 1;
}
}
}
void MQTTClientPIM_handle_signal_clock_tick(struct MQTTClientPIM_Instance *_instance) {
uint8_t MQTTClientPIM_behavior_State_event_consumed = 0;
if (_instance->MQTTClientPIM_behavior_State == MQTTCLIENTPIM_BEHAVIOR_START_STATE) {
if (MQTTClientPIM_behavior_State_event_consumed == 0 && 1) {
MQTTClientPIM_send_syncmqttport_publish(_instance, _instance->MQTTClientPIM_topic__var, _instance->MQTTClientPIM_msg__var);
MQTTClientPIM_behavior_State_event_consumed = 1;
}
}
}
void MQTTClientPIM_handle_mqttport_subscribed(struct MQTTClientPIM_Instance *_instance) {
uint8_t MQTTClientPIM_behavior_State_event_consumed = 0;
if (_instance->MQTTClientPIM_behavior_State == MQTTCLIENTPIM_BEHAVIOR_INIT_STATE) {
if (MQTTClientPIM_behavior_State_event_consumed == 0 && 1) {
MQTTClientPIM_behavior_OnExit(MQTTCLIENTPIM_BEHAVIOR_INIT_STATE, _instance);
_instance->MQTTClientPIM_behavior_State = MQTTCLIENTPIM_BEHAVIOR_START_STATE;
fprintf(stdout, "successfully subscribed to the topic, start messaging ...\n");
MQTTClientPIM_behavior_OnEntry(MQTTCLIENTPIM_BEHAVIOR_START_STATE, _instance);
MQTTClientPIM_behavior_State_event_consumed = 1;
}
}
}
void MQTTClientPIM_handle_mqttport_connected(struct MQTTClientPIM_Instance *_instance) {
uint8_t MQTTClientPIM_behavior_State_event_consumed = 0;
if (_instance->MQTTClientPIM_behavior_State == MQTTCLIENTPIM_BEHAVIOR_INIT_STATE) {
if (MQTTClientPIM_behavior_State_event_consumed == 0 && 1) {
fprintf(stdout, "subscribing to a topic... \n");
MQTTClientPIM_send_syncmqttport_subscribe(_instance, _instance->MQTTClientPIM_topic__var);
MQTTClientPIM_behavior_State_event_consumed = 1;
}
}
}

// Observers for outgoing messages:
void (*external_MQTTClientPIM_send_syncmqttport_publish_listener)(struct MQTTClientPIM_Instance *, const char*, char *)= 0x0;
void register_external_MQTTClientPIM_send_syncmqttport_publish_listener(void (*_listener)(struct MQTTClientPIM_Instance *, const char*, char *)){
external_MQTTClientPIM_send_syncmqttport_publish_listener = _listener;
}
void (*MQTTClientPIM_send_syncmqttport_publish_listener)(struct MQTTClientPIM_Instance *, const char*, char *)= 0x0;
void register_MQTTClientPIM_send_syncmqttport_publish_listener(void (*_listener)(struct MQTTClientPIM_Instance *, const char*, char *)){
MQTTClientPIM_send_syncmqttport_publish_listener = _listener;
}
void MQTTClientPIM_send_syncmqttport_publish(struct MQTTClientPIM_Instance *_instance, const char* topic, char * msg){
if (MQTTClientPIM_send_syncmqttport_publish_listener != 0x0) MQTTClientPIM_send_syncmqttport_publish_listener(_instance, topic, msg);
if (external_MQTTClientPIM_send_syncmqttport_publish_listener != 0x0) external_MQTTClientPIM_send_syncmqttport_publish_listener(_instance, topic, msg);
;
}
void (*external_MQTTClientPIM_send_syncmqttport_subscribe_listener)(struct MQTTClientPIM_Instance *, const char*)= 0x0;
void register_external_MQTTClientPIM_send_syncmqttport_subscribe_listener(void (*_listener)(struct MQTTClientPIM_Instance *, const char*)){
external_MQTTClientPIM_send_syncmqttport_subscribe_listener = _listener;
}
void (*MQTTClientPIM_send_syncmqttport_subscribe_listener)(struct MQTTClientPIM_Instance *, const char*)= 0x0;
void register_MQTTClientPIM_send_syncmqttport_subscribe_listener(void (*_listener)(struct MQTTClientPIM_Instance *, const char*)){
MQTTClientPIM_send_syncmqttport_subscribe_listener = _listener;
}
void MQTTClientPIM_send_syncmqttport_subscribe(struct MQTTClientPIM_Instance *_instance, const char* topic){
if (MQTTClientPIM_send_syncmqttport_subscribe_listener != 0x0) MQTTClientPIM_send_syncmqttport_subscribe_listener(_instance, topic);
if (external_MQTTClientPIM_send_syncmqttport_subscribe_listener != 0x0) external_MQTTClientPIM_send_syncmqttport_subscribe_listener(_instance, topic);
;
}
void (*external_MQTTClientPIM_send_syncmqttport_unsubscribe_listener)(struct MQTTClientPIM_Instance *, const char*)= 0x0;
void register_external_MQTTClientPIM_send_syncmqttport_unsubscribe_listener(void (*_listener)(struct MQTTClientPIM_Instance *, const char*)){
external_MQTTClientPIM_send_syncmqttport_unsubscribe_listener = _listener;
}
void (*MQTTClientPIM_send_syncmqttport_unsubscribe_listener)(struct MQTTClientPIM_Instance *, const char*)= 0x0;
void register_MQTTClientPIM_send_syncmqttport_unsubscribe_listener(void (*_listener)(struct MQTTClientPIM_Instance *, const char*)){
MQTTClientPIM_send_syncmqttport_unsubscribe_listener = _listener;
}
void MQTTClientPIM_send_syncmqttport_unsubscribe(struct MQTTClientPIM_Instance *_instance, const char* topic){
if (MQTTClientPIM_send_syncmqttport_unsubscribe_listener != 0x0) MQTTClientPIM_send_syncmqttport_unsubscribe_listener(_instance, topic);
if (external_MQTTClientPIM_send_syncmqttport_unsubscribe_listener != 0x0) external_MQTTClientPIM_send_syncmqttport_unsubscribe_listener(_instance, topic);
;
}



