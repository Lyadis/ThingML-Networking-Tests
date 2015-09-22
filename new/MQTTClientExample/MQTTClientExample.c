/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *      Implementation for Application MQTTClientExample
 *  Generated from ThingML (http://www.thingml.org)
 *****************************************************/

#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <math.h>
#include <signal.h>
#include <pthread.h>
#include "thingml_typedefs.h"
#include "runtime.h"
#include "MQTTClientPIM.h"
#include "ClockLinux.h"
#include "MQTTClientPSM.h"





/*****************************************************************************
 * Definitions for configuration : MQTTClientExample
 *****************************************************************************/

//Declaration of connexion array
#define NB_MAX_CONNEXION 6
struct Msg_Handler * MQTTClientExample_receivers[NB_MAX_CONNEXION];

//Declaration of instance variables
//Instance MQTTClientExample_mqttclpsm
struct MQTTClientPSM_Instance MQTTClientExample_mqttclpsm_var;
struct Msg_Handler MQTTClientExample_mqttclpsm_mqttport_handlers;
uint16_t MQTTClientExample_mqttclpsm_mqttport_msgs[3];
void * MQTTClientExample_mqttclpsm_mqttport_handlers_tab[3];

struct Msg_Handler MQTTClientExample_mqttclpsm_syncmqttport_handlers;
uint16_t MQTTClientExample_mqttclpsm_syncmqttport_msgs[3];
void * MQTTClientExample_mqttclpsm_syncmqttport_handlers_tab[3];

//Instance MQTTClientExample_clock
struct ClockLinux_Instance MQTTClientExample_clock_var;
//Instance MQTTClientExample_mqttclpim
struct MQTTClientPIM_Instance MQTTClientExample_mqttclpim_var;
struct Msg_Handler MQTTClientExample_mqttclpim_mqttport_handlers;
uint16_t MQTTClientExample_mqttclpim_mqttport_msgs[3];
void * MQTTClientExample_mqttclpim_mqttport_handlers_tab[3];

struct Msg_Handler MQTTClientExample_mqttclpim_syncmqttport_handlers;
uint16_t MQTTClientExample_mqttclpim_syncmqttport_msgs[1];
void * MQTTClientExample_mqttclpim_syncmqttport_handlers_tab[1];

struct Msg_Handler MQTTClientExample_mqttclpim_signal_handlers;
uint16_t MQTTClientExample_mqttclpim_signal_msgs[1];
void * MQTTClientExample_mqttclpim_signal_handlers_tab[1];


// Enqueue of messages ClockLinux::signal::clock_tick
void enqueue_ClockLinux_send_signal_clock_tick(struct ClockLinux_Instance *_instance){
fifo_lock();
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (1 >> 8) & 0xFF );
_fifo_enqueue( 1 & 0xFF );

// ID of the source port of the instance
_fifo_enqueue( (_instance->id_signal >> 8) & 0xFF );
_fifo_enqueue( _instance->id_signal & 0xFF );
}
else {
}
fifo_unlock_and_notify();
}
// Enqueue of messages MQTTClientPSM::mqttport::subscribed
void enqueue_MQTTClientPSM_send_mqttport_subscribed(struct MQTTClientPSM_Instance *_instance){
fifo_lock();
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (2 >> 8) & 0xFF );
_fifo_enqueue( 2 & 0xFF );

// ID of the source port of the instance
_fifo_enqueue( (_instance->id_mqttport >> 8) & 0xFF );
_fifo_enqueue( _instance->id_mqttport & 0xFF );
}
else {
}
fifo_unlock_and_notify();
}
// Enqueue of messages MQTTClientPSM::mqttport::connected
void enqueue_MQTTClientPSM_send_mqttport_connected(struct MQTTClientPSM_Instance *_instance){
fifo_lock();
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (3 >> 8) & 0xFF );
_fifo_enqueue( 3 & 0xFF );

// ID of the source port of the instance
_fifo_enqueue( (_instance->id_mqttport >> 8) & 0xFF );
_fifo_enqueue( _instance->id_mqttport & 0xFF );
}
else {
}
fifo_unlock_and_notify();
}
// Enqueue of messages MQTTClientPSM::mqttport::published
void enqueue_MQTTClientPSM_send_mqttport_published(struct MQTTClientPSM_Instance *_instance){
fifo_lock();
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (4 >> 8) & 0xFF );
_fifo_enqueue( 4 & 0xFF );

// ID of the source port of the instance
_fifo_enqueue( (_instance->id_mqttport >> 8) & 0xFF );
_fifo_enqueue( _instance->id_mqttport & 0xFF );
}
else {
}
fifo_unlock_and_notify();
}


//Dynamic dispatcher for message unsubscribe
void dispatch_unsubscribe(uint16_t sender, const char* param_topic) {
void executor_dispatch_unsubscribe(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *, const char* param_topic) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 5) {
           handler = (void *) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL)
       handler((**cur).instance, param_topic);
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == MQTTClientExample_mqttclpim_var.id_syncmqttport) {
executor_dispatch_unsubscribe(MQTTClientExample_mqttclpim_var.syncmqttport_receiver_list_head,MQTTClientExample_mqttclpim_var.syncmqttport_receiver_list_tail);}
}

//Dynamic dispatcher for message subscribed
void dispatch_subscribed(uint16_t sender) {
void executor_dispatch_subscribed(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 2) {
           handler = (void *) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL)
       handler((**cur).instance);
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == MQTTClientExample_mqttclpsm_var.id_mqttport) {
executor_dispatch_subscribed(MQTTClientExample_mqttclpsm_var.mqttport_receiver_list_head,MQTTClientExample_mqttclpsm_var.mqttport_receiver_list_tail);}
}

//Dynamic dispatcher for message connected
void dispatch_connected(uint16_t sender) {
void executor_dispatch_connected(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 3) {
           handler = (void *) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL)
       handler((**cur).instance);
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == MQTTClientExample_mqttclpsm_var.id_mqttport) {
executor_dispatch_connected(MQTTClientExample_mqttclpsm_var.mqttport_receiver_list_head,MQTTClientExample_mqttclpsm_var.mqttport_receiver_list_tail);}
}

//Dynamic dispatcher for message subscribe
void dispatch_subscribe(uint16_t sender, const char* param_topic) {
void executor_dispatch_subscribe(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *, const char* param_topic) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 6) {
           handler = (void *) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL)
       handler((**cur).instance, param_topic);
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == MQTTClientExample_mqttclpim_var.id_syncmqttport) {
executor_dispatch_subscribe(MQTTClientExample_mqttclpim_var.syncmqttport_receiver_list_head,MQTTClientExample_mqttclpim_var.syncmqttport_receiver_list_tail);}
}

//Dynamic dispatcher for message published
void dispatch_published(uint16_t sender) {
void executor_dispatch_published(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 4) {
           handler = (void *) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL)
       handler((**cur).instance);
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == MQTTClientExample_mqttclpsm_var.id_mqttport) {
executor_dispatch_published(MQTTClientExample_mqttclpsm_var.mqttport_receiver_list_head,MQTTClientExample_mqttclpsm_var.mqttport_receiver_list_tail);}
}

//Dynamic dispatcher for message clock_tick
void dispatch_clock_tick(uint16_t sender) {
void executor_dispatch_clock_tick(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 1) {
           handler = (void *) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL)
       handler((**cur).instance);
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == MQTTClientExample_clock_var.id_signal) {
executor_dispatch_clock_tick(MQTTClientExample_clock_var.signal_receiver_list_head,MQTTClientExample_clock_var.signal_receiver_list_tail);}
}

//Dynamic dispatcher for message publish
void dispatch_publish(uint16_t sender, const char* param_topic, char * param_msg) {
void executor_dispatch_publish(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *, const char* param_topic, char * param_msg) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 7) {
           handler = (void *) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL)
       handler((**cur).instance, param_topic, param_msg);
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == MQTTClientExample_mqttclpim_var.id_syncmqttport) {
executor_dispatch_publish(MQTTClientExample_mqttclpim_var.syncmqttport_receiver_list_head,MQTTClientExample_mqttclpim_var.syncmqttport_receiver_list_tail);}
}

//Dynamic dispatcher for message message_received
void dispatch_message_received(uint16_t sender, const char* param_topic, char * param_msg) {
void executor_dispatch_message_received(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *, const char* param_topic, char * param_msg) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 8) {
           handler = (void *) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL)
       handler((**cur).instance, param_topic, param_msg);
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == MQTTClientExample_mqttclpsm_var.id_syncmqttport) {
executor_dispatch_message_received(MQTTClientExample_mqttclpsm_var.syncmqttport_receiver_list_head,MQTTClientExample_mqttclpsm_var.syncmqttport_receiver_list_tail);}
}
void sync_dispatch_MQTTClientPIM_send_syncmqttport_unsubscribe(struct MQTTClientPIM_Instance *_instance, const char* topic){
dispatch_unsubscribe(_instance->id_syncmqttport, topic);
}
void sync_dispatch_MQTTClientPIM_send_syncmqttport_subscribe(struct MQTTClientPIM_Instance *_instance, const char* topic){
dispatch_subscribe(_instance->id_syncmqttport, topic);
}
void sync_dispatch_MQTTClientPIM_send_syncmqttport_publish(struct MQTTClientPIM_Instance *_instance, const char* topic, char * msg){
dispatch_publish(_instance->id_syncmqttport, topic, msg);
}
void sync_dispatch_MQTTClientPSM_send_syncmqttport_message_received(struct MQTTClientPSM_Instance *_instance, const char* topic, char * msg){
dispatch_message_received(_instance->id_syncmqttport, topic, msg);
}

void processMessageQueue() {
fifo_lock();
while (fifo_empty()) fifo_wait();
byte mbuf[2];
uint8_t mbufi = 0;

// Read the code of the next port/message in the queue
uint16_t code = fifo_dequeue() << 8;

code += fifo_dequeue();

// Switch to call the appropriate handler
switch(code) {
case 2:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
fifo_unlock();
dispatch_subscribed((mbuf[0] << 8) + mbuf[1] /* instance port*/);
break;
case 3:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
fifo_unlock();
dispatch_connected((mbuf[0] << 8) + mbuf[1] /* instance port*/);
break;
case 4:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
fifo_unlock();
dispatch_published((mbuf[0] << 8) + mbuf[1] /* instance port*/);
break;
case 1:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
fifo_unlock();
dispatch_clock_tick((mbuf[0] << 8) + mbuf[1] /* instance port*/);
break;
}
}


//external Message enqueue

void initialize_configuration_MQTTClientExample() {
// Initialize connectors
register_ClockLinux_send_signal_clock_tick_listener(enqueue_ClockLinux_send_signal_clock_tick);
register_MQTTClientPSM_send_mqttport_subscribed_listener(enqueue_MQTTClientPSM_send_mqttport_subscribed);
register_MQTTClientPSM_send_mqttport_connected_listener(enqueue_MQTTClientPSM_send_mqttport_connected);
register_MQTTClientPSM_send_mqttport_published_listener(enqueue_MQTTClientPSM_send_mqttport_published);
register_MQTTClientPSM_send_syncmqttport_message_received_listener(sync_dispatch_MQTTClientPSM_send_syncmqttport_message_received);
register_MQTTClientPIM_send_syncmqttport_publish_listener(sync_dispatch_MQTTClientPIM_send_syncmqttport_publish);
register_MQTTClientPIM_send_syncmqttport_subscribe_listener(sync_dispatch_MQTTClientPIM_send_syncmqttport_subscribe);
register_MQTTClientPIM_send_syncmqttport_unsubscribe_listener(sync_dispatch_MQTTClientPIM_send_syncmqttport_unsubscribe);

// Init the ID, state variables and properties for instance MQTTClientExample_mqttclpsm
MQTTClientExample_mqttclpsm_var.id_mqttport = add_instance( (void*) &MQTTClientExample_mqttclpsm_var);
MQTTClientExample_mqttclpsm_mqttport_msgs[0] = 9;
MQTTClientExample_mqttclpsm_mqttport_handlers_tab[0] = NULL;
MQTTClientExample_mqttclpsm_mqttport_msgs[1] = 10;
MQTTClientExample_mqttclpsm_mqttport_handlers_tab[1] = &MQTTClientPSM_handle_mqttport_reconnect;
MQTTClientExample_mqttclpsm_mqttport_msgs[2] = 11;
MQTTClientExample_mqttclpsm_mqttport_handlers_tab[2] = &MQTTClientPSM_handle_mqttport_disconnect;
MQTTClientExample_mqttclpsm_mqttport_handlers.nb_msg = 3;
MQTTClientExample_mqttclpsm_mqttport_handlers.msg = &MQTTClientExample_mqttclpsm_mqttport_msgs;
MQTTClientExample_mqttclpsm_mqttport_handlers.msg_handler = &MQTTClientExample_mqttclpsm_mqttport_handlers_tab;
MQTTClientExample_mqttclpsm_mqttport_handlers.instance = &MQTTClientExample_mqttclpsm_var;
MQTTClientExample_mqttclpsm_var.mqttport_handlers = &MQTTClientExample_mqttclpsm_mqttport_handlers;
MQTTClientExample_receivers[0] = &MQTTClientExample_mqttclpim_mqttport_handlers;
MQTTClientExample_mqttclpsm_var.mqttport_receiver_list_head = &MQTTClientExample_receivers[0];
MQTTClientExample_mqttclpsm_var.mqttport_receiver_list_tail = &MQTTClientExample_receivers[0];
MQTTClientExample_mqttclpsm_var.id_syncmqttport = add_instance( (void*) &MQTTClientExample_mqttclpsm_var);
MQTTClientExample_mqttclpsm_syncmqttport_msgs[0] = 6;
MQTTClientExample_mqttclpsm_syncmqttport_handlers_tab[0] = &MQTTClientPSM_handle_syncmqttport_subscribe;
MQTTClientExample_mqttclpsm_syncmqttport_msgs[1] = 5;
MQTTClientExample_mqttclpsm_syncmqttport_handlers_tab[1] = NULL;
MQTTClientExample_mqttclpsm_syncmqttport_msgs[2] = 7;
MQTTClientExample_mqttclpsm_syncmqttport_handlers_tab[2] = &MQTTClientPSM_handle_syncmqttport_publish;
MQTTClientExample_mqttclpsm_syncmqttport_handlers.nb_msg = 3;
MQTTClientExample_mqttclpsm_syncmqttport_handlers.msg = &MQTTClientExample_mqttclpsm_syncmqttport_msgs;
MQTTClientExample_mqttclpsm_syncmqttport_handlers.msg_handler = &MQTTClientExample_mqttclpsm_syncmqttport_handlers_tab;
MQTTClientExample_mqttclpsm_syncmqttport_handlers.instance = &MQTTClientExample_mqttclpsm_var;
MQTTClientExample_mqttclpsm_var.syncmqttport_handlers = &MQTTClientExample_mqttclpsm_syncmqttport_handlers;
MQTTClientExample_receivers[1] = &MQTTClientExample_mqttclpim_syncmqttport_handlers;
MQTTClientExample_mqttclpsm_var.syncmqttport_receiver_list_head = &MQTTClientExample_receivers[1];
MQTTClientExample_mqttclpsm_var.syncmqttport_receiver_list_tail = &MQTTClientExample_receivers[1];
MQTTClientExample_mqttclpsm_var.MQTTClientPSM_behavior_State = MQTTCLIENTPSM_BEHAVIOR_INITIALIZE_STATE;
MQTTClientExample_mqttclpsm_var.MQTTClientPSM_client__var = NULL;
MQTTClientExample_mqttclpsm_var.MQTTClientPSM_context__var = (ThingMLMQTTContext*) malloc(sizeof(ThingMLMQTTContext));
MQTTClientExample_mqttclpsm_var.MQTTClientPSM_serverURI__var = "tcp://m2m.eclipse.org:1883";
MQTTClientExample_mqttclpsm_var.MQTTClientPSM_clientId__var = "pub_sub_thingml_client";
MQTTClientExample_mqttclpsm_var.MQTTClientPSM_qos__var = 1;

// Init the ID, state variables and properties for instance MQTTClientExample_mqttclpim
MQTTClientExample_mqttclpim_var.id_mqttport = add_instance( (void*) &MQTTClientExample_mqttclpim_var);
MQTTClientExample_mqttclpim_mqttport_msgs[0] = 3;
MQTTClientExample_mqttclpim_mqttport_handlers_tab[0] = &MQTTClientPIM_handle_mqttport_connected;
MQTTClientExample_mqttclpim_mqttport_msgs[1] = 4;
MQTTClientExample_mqttclpim_mqttport_handlers_tab[1] = NULL;
MQTTClientExample_mqttclpim_mqttport_msgs[2] = 2;
MQTTClientExample_mqttclpim_mqttport_handlers_tab[2] = &MQTTClientPIM_handle_mqttport_subscribed;
MQTTClientExample_mqttclpim_mqttport_handlers.nb_msg = 3;
MQTTClientExample_mqttclpim_mqttport_handlers.msg = &MQTTClientExample_mqttclpim_mqttport_msgs;
MQTTClientExample_mqttclpim_mqttport_handlers.msg_handler = &MQTTClientExample_mqttclpim_mqttport_handlers_tab;
MQTTClientExample_mqttclpim_mqttport_handlers.instance = &MQTTClientExample_mqttclpim_var;
MQTTClientExample_mqttclpim_var.mqttport_handlers = &MQTTClientExample_mqttclpim_mqttport_handlers;
MQTTClientExample_mqttclpim_var.id_syncmqttport = add_instance( (void*) &MQTTClientExample_mqttclpim_var);
MQTTClientExample_mqttclpim_syncmqttport_msgs[0] = 8;
MQTTClientExample_mqttclpim_syncmqttport_handlers_tab[0] = &MQTTClientPIM_handle_syncmqttport_message_received;
MQTTClientExample_mqttclpim_syncmqttport_handlers.nb_msg = 1;
MQTTClientExample_mqttclpim_syncmqttport_handlers.msg = &MQTTClientExample_mqttclpim_syncmqttport_msgs;
MQTTClientExample_mqttclpim_syncmqttport_handlers.msg_handler = &MQTTClientExample_mqttclpim_syncmqttport_handlers_tab;
MQTTClientExample_mqttclpim_syncmqttport_handlers.instance = &MQTTClientExample_mqttclpim_var;
MQTTClientExample_mqttclpim_var.syncmqttport_handlers = &MQTTClientExample_mqttclpim_syncmqttport_handlers;
MQTTClientExample_receivers[2] = &MQTTClientExample_mqttclpsm_syncmqttport_handlers;
MQTTClientExample_mqttclpim_var.syncmqttport_receiver_list_head = &MQTTClientExample_receivers[2];
MQTTClientExample_mqttclpim_var.syncmqttport_receiver_list_tail = &MQTTClientExample_receivers[2];
MQTTClientExample_mqttclpim_var.id_signal = add_instance( (void*) &MQTTClientExample_mqttclpim_var);
MQTTClientExample_mqttclpim_signal_msgs[0] = 1;
MQTTClientExample_mqttclpim_signal_handlers_tab[0] = &MQTTClientPIM_handle_signal_clock_tick;
MQTTClientExample_mqttclpim_signal_handlers.nb_msg = 1;
MQTTClientExample_mqttclpim_signal_handlers.msg = &MQTTClientExample_mqttclpim_signal_msgs;
MQTTClientExample_mqttclpim_signal_handlers.msg_handler = &MQTTClientExample_mqttclpim_signal_handlers_tab;
MQTTClientExample_mqttclpim_signal_handlers.instance = &MQTTClientExample_mqttclpim_var;
MQTTClientExample_mqttclpim_var.signal_handlers = &MQTTClientExample_mqttclpim_signal_handlers;
MQTTClientExample_mqttclpim_var.MQTTClientPIM_behavior_State = MQTTCLIENTPIM_BEHAVIOR_INIT_STATE;
MQTTClientExample_mqttclpim_var.MQTTClientPIM_topic__var = "/sintef/vassik/hello";
MQTTClientExample_mqttclpim_var.MQTTClientPIM_msg__var = "hello world!";

// Init the ID, state variables and properties for instance MQTTClientExample_clock
MQTTClientExample_clock_var.id_signal = add_instance( (void*) &MQTTClientExample_clock_var);
MQTTClientExample_receivers[3] = &MQTTClientExample_mqttclpim_signal_handlers;
MQTTClientExample_clock_var.signal_receiver_list_head = &MQTTClientExample_receivers[3];
MQTTClientExample_clock_var.signal_receiver_list_tail = &MQTTClientExample_receivers[3];
MQTTClientExample_clock_var.ClockLinux_ClockImpl_State = CLOCKLINUX_CLOCKIMPL_TICKING_STATE;
MQTTClientExample_clock_var.Clock_period__var = 5000;


// Network Initilization 


// End Network Initilization 

ClockLinux_ClockImpl_OnEntry(CLOCKLINUX_CLOCKIMPL_STATE, &MQTTClientExample_clock_var);
MQTTClientPSM_behavior_OnEntry(MQTTCLIENTPSM_BEHAVIOR_STATE, &MQTTClientExample_mqttclpsm_var);
MQTTClientPIM_behavior_OnEntry(MQTTCLIENTPIM_BEHAVIOR_STATE, &MQTTClientExample_mqttclpim_var);
}




int main(int argc, char *argv[]) {
  init_runtime();
  
  initialize_configuration_MQTTClientExample();

  while (1) {
    
// Network Listener

    processMessageQueue();
  }
}