/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *        Implementation for Thing MQTTClientPSM
 *  Generated from ThingML (http://www.thingml.org)
 *****************************************************/

#include "MQTTClientPSM.h"

/*****************************************************************************
 * Implementation for type : MQTTClientPSM
 *****************************************************************************/

// Declaration of prototypes:
void MQTTClientPSM_behavior_OnExit(int state, struct MQTTClientPSM_Instance *_instance);
void MQTTClientPSM_send_mqttport_subscribed(struct MQTTClientPSM_Instance *_instance);
void MQTTClientPSM_send_mqttport_connected(struct MQTTClientPSM_Instance *_instance);
void MQTTClientPSM_send_mqttport_unsubscribed(struct MQTTClientPSM_Instance *_instance);
void MQTTClientPSM_send_mqttport_disconnected(struct MQTTClientPSM_Instance *_instance);
void MQTTClientPSM_send_mqttport_published(struct MQTTClientPSM_Instance *_instance);
void MQTTClientPSM_send_syncmqttport_message_received(struct MQTTClientPSM_Instance *_instance, const char* topic, char * msg);
void connection_callback(void *_instance, ...);
void connection_fail_callback(void *_instance, ...);
void connection_lost_callback(void *_instance, ...);
void message_arrived_callback(void *_instance, ...);
void subscribe_callback(void *_instance, ...);
void subscribe_fail_callback(void *_instance, ...);
void message_published_callback(void *_instance, ...);
void f_MQTTClientPSM_create_and_connect_client(struct MQTTClientPSM_Instance *_instance);
void f_MQTTClientPSM_connect_client(struct MQTTClientPSM_Instance *_instance);
void f_MQTTClientPSM_subscribe_topic(struct MQTTClientPSM_Instance *_instance, const char* topic);
void f_MQTTClientPSM_publish_message(struct MQTTClientPSM_Instance *_instance, const char* topic, char * msg);
// Declaration of functions:
// Definition of function connection_callback
void connection_callback(void *_instance, ...) {
printf("connection callback is called...\n");
MQTTClientPSM_send_mqttport_connected((MQTTClientPSM_Instance *) _instance);
}
// Definition of function connection_fail_callback
void connection_fail_callback(void *_instance, ...) {
printf("connection fail callback is called...\n");
}
// Definition of function connection_lost_callback
void connection_lost_callback(void *_instance, ...) {
char* reason;
va_list valist;
va_start(valist, _instance);
reason = va_arg(valist, char*);
va_end(valist);
printf("connection lost callback is lost, reason %c...\n", *reason);
}
// Definition of function message_arrived_callback
void message_arrived_callback(void *_instance, ...) {
char* message;
char* topic;
va_list valist;
va_start(valist, _instance);
topic = va_arg(valist, char*);
message = va_arg(valist, char*);
va_end(valist);
printf("message arrived callback is called: topic '%s' and payload '%s'\n", topic, message);
free(message);
free(topic);
}
// Definition of function subscribe_callback
void subscribe_callback(void *_instance, ...) {
printf("subscribe callback is called\n");
MQTTClientPSM_send_mqttport_subscribed((MQTTClientPSM_Instance *) _instance);
}
// Definition of function subscribe_fail_callback
void subscribe_fail_callback(void *_instance, ...) {
int reason;
va_list valist;
va_start(valist, _instance);
reason = va_arg(valist, int);
va_end(valist);
printf("subscribe fail callback is called with the reason %d\n", reason);
}
// Definition of function message_published_callback
void message_published_callback(void *_instance, ...) {
printf("message published callback is called with the reason\n");
MQTTClientPSM_send_mqttport_published((MQTTClientPSM_Instance *) _instance);
}
// Definition of function create_and_connect_client
void f_MQTTClientPSM_create_and_connect_client(struct MQTTClientPSM_Instance *_instance) {
MQTTAsync_destroy(&_instance->MQTTClientPSM_client__var);
nullset_thingml_mqtt_context(_instance->MQTTClientPSM_context__var);
create_mqtt_client(&_instance->MQTTClientPSM_client__var, _instance->MQTTClientPSM_serverURI__var, _instance->MQTTClientPSM_clientId__var, _instance->MQTTClientPSM_context__var);
_instance->MQTTClientPSM_context__var->thing_instance = _instance;
_instance->MQTTClientPSM_context__var->fn_onconn_callback = connection_callback;
_instance->MQTTClientPSM_context__var->fn_connlost_callback = connection_lost_callback;
_instance->MQTTClientPSM_context__var->fn_onconnfail_callback = connection_fail_callback;
_instance->MQTTClientPSM_context__var->fn_onmsgrcv_callback = message_arrived_callback;
f_MQTTClientPSM_connect_client(_instance);
}
// Definition of function connect_client
void f_MQTTClientPSM_connect_client(struct MQTTClientPSM_Instance *_instance) {
connect_mqtt_client(_instance->MQTTClientPSM_context__var);
}
// Definition of function subscribe_topic
void f_MQTTClientPSM_subscribe_topic(struct MQTTClientPSM_Instance *_instance, const char* topic) {
printf("Subscribe to the topic \"%s\"...\n", topic);
_instance->MQTTClientPSM_context__var->fn_onsub_callback = subscribe_callback;
_instance->MQTTClientPSM_context__var->fn_onsubfail_callback = subscribe_fail_callback;
subscribe_mqtt_client(_instance->MQTTClientPSM_context__var, topic, _instance->MQTTClientPSM_qos__var);
}
// Definition of function publish_message
void f_MQTTClientPSM_publish_message(struct MQTTClientPSM_Instance *_instance, const char* topic, char * msg) {
printf("Publishing message \"%s\" on the topic \"%s\"...\n", msg, topic);
_instance->MQTTClientPSM_context__var->fn_onsend_callback = message_published_callback;
publish_mqtt_client(_instance->MQTTClientPSM_context__var, topic,msg, _instance->MQTTClientPSM_qos__var);
}

// On Entry Actions:
void MQTTClientPSM_behavior_OnEntry(int state, struct MQTTClientPSM_Instance *_instance) {
switch(state) {
case MQTTCLIENTPSM_BEHAVIOR_STATE:
_instance->MQTTClientPSM_behavior_State = MQTTCLIENTPSM_BEHAVIOR_INITIALIZE_STATE;
MQTTClientPSM_behavior_OnEntry(_instance->MQTTClientPSM_behavior_State, _instance);
break;
case MQTTCLIENTPSM_BEHAVIOR_INITIALIZE_STATE:
f_MQTTClientPSM_create_and_connect_client(_instance);
break;
case MQTTCLIENTPSM_BEHAVIOR_FINALIZE_STATE:
MQTTAsync_destroy(&_instance->MQTTClientPSM_client__var);
free(_instance->MQTTClientPSM_context__var);
break;
default: break;
}
}

// On Exit Actions:
void MQTTClientPSM_behavior_OnExit(int state, struct MQTTClientPSM_Instance *_instance) {
switch(state) {
case MQTTCLIENTPSM_BEHAVIOR_STATE:
MQTTClientPSM_behavior_OnExit(_instance->MQTTClientPSM_behavior_State, _instance);
break;
case MQTTCLIENTPSM_BEHAVIOR_INITIALIZE_STATE:
break;
case MQTTCLIENTPSM_BEHAVIOR_FINALIZE_STATE:
break;
default: break;
}
}

// Event Handlers for incoming messages:
void MQTTClientPSM_handle_syncmqttport_subscribe(struct MQTTClientPSM_Instance *_instance, const char* topic) {
uint8_t MQTTClientPSM_behavior_State_event_consumed = 0;
if (_instance->MQTTClientPSM_behavior_State == MQTTCLIENTPSM_BEHAVIOR_INITIALIZE_STATE) {
if (MQTTClientPSM_behavior_State_event_consumed == 0 && 1) {
f_MQTTClientPSM_subscribe_topic(_instance, topic);
MQTTClientPSM_behavior_State_event_consumed = 1;
}
}
}
void MQTTClientPSM_handle_syncmqttport_publish(struct MQTTClientPSM_Instance *_instance, const char* topic, char * msg) {
uint8_t MQTTClientPSM_behavior_State_event_consumed = 0;
if (_instance->MQTTClientPSM_behavior_State == MQTTCLIENTPSM_BEHAVIOR_INITIALIZE_STATE) {
if (MQTTClientPSM_behavior_State_event_consumed == 0 && 1) {
f_MQTTClientPSM_publish_message(_instance, topic, msg);
MQTTClientPSM_behavior_State_event_consumed = 1;
}
}
}
void MQTTClientPSM_handle_mqttport_disconnect(struct MQTTClientPSM_Instance *_instance) {
uint8_t MQTTClientPSM_behavior_State_event_consumed = 0;
if (_instance->MQTTClientPSM_behavior_State == MQTTCLIENTPSM_BEHAVIOR_INITIALIZE_STATE) {
if (MQTTClientPSM_behavior_State_event_consumed == 0 && 1) {
MQTTClientPSM_behavior_OnExit(MQTTCLIENTPSM_BEHAVIOR_INITIALIZE_STATE, _instance);
_instance->MQTTClientPSM_behavior_State = MQTTCLIENTPSM_BEHAVIOR_FINALIZE_STATE;
MQTTClientPSM_behavior_OnEntry(MQTTCLIENTPSM_BEHAVIOR_FINALIZE_STATE, _instance);
MQTTClientPSM_behavior_State_event_consumed = 1;
}
}
}
void MQTTClientPSM_handle_mqttport_reconnect(struct MQTTClientPSM_Instance *_instance) {
uint8_t MQTTClientPSM_behavior_State_event_consumed = 0;
if (_instance->MQTTClientPSM_behavior_State == MQTTCLIENTPSM_BEHAVIOR_FINALIZE_STATE) {
if (MQTTClientPSM_behavior_State_event_consumed == 0 && 1) {
MQTTClientPSM_behavior_OnExit(MQTTCLIENTPSM_BEHAVIOR_FINALIZE_STATE, _instance);
_instance->MQTTClientPSM_behavior_State = MQTTCLIENTPSM_BEHAVIOR_INITIALIZE_STATE;
MQTTClientPSM_behavior_OnEntry(MQTTCLIENTPSM_BEHAVIOR_INITIALIZE_STATE, _instance);
MQTTClientPSM_behavior_State_event_consumed = 1;
}
}
}

// Observers for outgoing messages:
void (*external_MQTTClientPSM_send_mqttport_subscribed_listener)(struct MQTTClientPSM_Instance *)= 0x0;
void register_external_MQTTClientPSM_send_mqttport_subscribed_listener(void (*_listener)(struct MQTTClientPSM_Instance *)){
external_MQTTClientPSM_send_mqttport_subscribed_listener = _listener;
}
void (*MQTTClientPSM_send_mqttport_subscribed_listener)(struct MQTTClientPSM_Instance *)= 0x0;
void register_MQTTClientPSM_send_mqttport_subscribed_listener(void (*_listener)(struct MQTTClientPSM_Instance *)){
MQTTClientPSM_send_mqttport_subscribed_listener = _listener;
}
void MQTTClientPSM_send_mqttport_subscribed(struct MQTTClientPSM_Instance *_instance){
if (MQTTClientPSM_send_mqttport_subscribed_listener != 0x0) MQTTClientPSM_send_mqttport_subscribed_listener(_instance);
if (external_MQTTClientPSM_send_mqttport_subscribed_listener != 0x0) external_MQTTClientPSM_send_mqttport_subscribed_listener(_instance);
;
}
void (*external_MQTTClientPSM_send_mqttport_connected_listener)(struct MQTTClientPSM_Instance *)= 0x0;
void register_external_MQTTClientPSM_send_mqttport_connected_listener(void (*_listener)(struct MQTTClientPSM_Instance *)){
external_MQTTClientPSM_send_mqttport_connected_listener = _listener;
}
void (*MQTTClientPSM_send_mqttport_connected_listener)(struct MQTTClientPSM_Instance *)= 0x0;
void register_MQTTClientPSM_send_mqttport_connected_listener(void (*_listener)(struct MQTTClientPSM_Instance *)){
MQTTClientPSM_send_mqttport_connected_listener = _listener;
}
void MQTTClientPSM_send_mqttport_connected(struct MQTTClientPSM_Instance *_instance){
if (MQTTClientPSM_send_mqttport_connected_listener != 0x0) MQTTClientPSM_send_mqttport_connected_listener(_instance);
if (external_MQTTClientPSM_send_mqttport_connected_listener != 0x0) external_MQTTClientPSM_send_mqttport_connected_listener(_instance);
;
}
void (*external_MQTTClientPSM_send_mqttport_unsubscribed_listener)(struct MQTTClientPSM_Instance *)= 0x0;
void register_external_MQTTClientPSM_send_mqttport_unsubscribed_listener(void (*_listener)(struct MQTTClientPSM_Instance *)){
external_MQTTClientPSM_send_mqttport_unsubscribed_listener = _listener;
}
void (*MQTTClientPSM_send_mqttport_unsubscribed_listener)(struct MQTTClientPSM_Instance *)= 0x0;
void register_MQTTClientPSM_send_mqttport_unsubscribed_listener(void (*_listener)(struct MQTTClientPSM_Instance *)){
MQTTClientPSM_send_mqttport_unsubscribed_listener = _listener;
}
void MQTTClientPSM_send_mqttport_unsubscribed(struct MQTTClientPSM_Instance *_instance){
if (MQTTClientPSM_send_mqttport_unsubscribed_listener != 0x0) MQTTClientPSM_send_mqttport_unsubscribed_listener(_instance);
if (external_MQTTClientPSM_send_mqttport_unsubscribed_listener != 0x0) external_MQTTClientPSM_send_mqttport_unsubscribed_listener(_instance);
;
}
void (*external_MQTTClientPSM_send_mqttport_disconnected_listener)(struct MQTTClientPSM_Instance *)= 0x0;
void register_external_MQTTClientPSM_send_mqttport_disconnected_listener(void (*_listener)(struct MQTTClientPSM_Instance *)){
external_MQTTClientPSM_send_mqttport_disconnected_listener = _listener;
}
void (*MQTTClientPSM_send_mqttport_disconnected_listener)(struct MQTTClientPSM_Instance *)= 0x0;
void register_MQTTClientPSM_send_mqttport_disconnected_listener(void (*_listener)(struct MQTTClientPSM_Instance *)){
MQTTClientPSM_send_mqttport_disconnected_listener = _listener;
}
void MQTTClientPSM_send_mqttport_disconnected(struct MQTTClientPSM_Instance *_instance){
if (MQTTClientPSM_send_mqttport_disconnected_listener != 0x0) MQTTClientPSM_send_mqttport_disconnected_listener(_instance);
if (external_MQTTClientPSM_send_mqttport_disconnected_listener != 0x0) external_MQTTClientPSM_send_mqttport_disconnected_listener(_instance);
;
}
void (*external_MQTTClientPSM_send_mqttport_published_listener)(struct MQTTClientPSM_Instance *)= 0x0;
void register_external_MQTTClientPSM_send_mqttport_published_listener(void (*_listener)(struct MQTTClientPSM_Instance *)){
external_MQTTClientPSM_send_mqttport_published_listener = _listener;
}
void (*MQTTClientPSM_send_mqttport_published_listener)(struct MQTTClientPSM_Instance *)= 0x0;
void register_MQTTClientPSM_send_mqttport_published_listener(void (*_listener)(struct MQTTClientPSM_Instance *)){
MQTTClientPSM_send_mqttport_published_listener = _listener;
}
void MQTTClientPSM_send_mqttport_published(struct MQTTClientPSM_Instance *_instance){
if (MQTTClientPSM_send_mqttport_published_listener != 0x0) MQTTClientPSM_send_mqttport_published_listener(_instance);
if (external_MQTTClientPSM_send_mqttport_published_listener != 0x0) external_MQTTClientPSM_send_mqttport_published_listener(_instance);
;
}
void (*external_MQTTClientPSM_send_syncmqttport_message_received_listener)(struct MQTTClientPSM_Instance *, const char*, char *)= 0x0;
void register_external_MQTTClientPSM_send_syncmqttport_message_received_listener(void (*_listener)(struct MQTTClientPSM_Instance *, const char*, char *)){
external_MQTTClientPSM_send_syncmqttport_message_received_listener = _listener;
}
void (*MQTTClientPSM_send_syncmqttport_message_received_listener)(struct MQTTClientPSM_Instance *, const char*, char *)= 0x0;
void register_MQTTClientPSM_send_syncmqttport_message_received_listener(void (*_listener)(struct MQTTClientPSM_Instance *, const char*, char *)){
MQTTClientPSM_send_syncmqttport_message_received_listener = _listener;
}
void MQTTClientPSM_send_syncmqttport_message_received(struct MQTTClientPSM_Instance *_instance, const char* topic, char * msg){
if (MQTTClientPSM_send_syncmqttport_message_received_listener != 0x0) MQTTClientPSM_send_syncmqttport_message_received_listener(_instance, topic, msg);
if (external_MQTTClientPSM_send_syncmqttport_message_received_listener != 0x0) external_MQTTClientPSM_send_syncmqttport_message_received_listener(_instance, topic, msg);
;
}



